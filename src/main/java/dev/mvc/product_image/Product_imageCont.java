package dev.mvc.product_image;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.product_categrp.Product_categrpProcInter;
import dev.mvc.product_categrp.Product_categrpVO;
import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class Product_imageCont {
  @Autowired
  @Qualifier("dev.mvc.product_categrp.Product_categrpProc") // 이름 지정
  private Product_categrpProcInter product_categrpProc;

  @Autowired
  @Qualifier("dev.mvc.product_image.Product_imageProc") // 이름 지정
  private Product_imageProcInter product_imageProc;
  
  public Product_imageCont(){
    System.out.println("--> Product_image Cont created.");
  }
  
  // http://localhost:9090/team4/product_image/create.do?productcateno=1&productno=1
  @RequestMapping(value = "/product_image/create.do", method = RequestMethod.GET)
  public ModelAndView create(int productcateno, int productno) {
    ModelAndView mav = new ModelAndView();

    Product_categrpVO product_categrpVO = product_categrpProc.read(productcateno);
    mav.addObject("product_categrpVO", product_categrpVO);

    mav.setViewName("/product_image/create"); // /webapp/attachfile/create.jsp
    
    return mav;
  }
  
  @RequestMapping(value = "/product_image/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra,
                                           HttpServletRequest request,
                                           Product_imageVO product_imageVO,
                                           int productcateno,
                                           int nowPage) {
    
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    int productno = product_imageVO.getProductno(); // 부모글 번호
    String fname = ""; // 원본 파일명
    String fupname = ""; // 업로드된 파일명
    long fsize = 0;  // 파일 사이즈
    String thumb = ""; // Preview 이미지
    int upload_count = 0; // 정상처리된 레코드 갯수
    
    String upDir = Tool.getRealPath(request, "/product_image/storage");
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = product_imageVO.getFnamesMF();
    int count = fnamesMF.size(); // 전송 파일 갯수
    if (count > 0) {
      for (MultipartFile multipartFile:fnamesMF) { // 파일 추출
        fsize = multipartFile.getSize();  // 파일 크기
        if (fsize > 0) { // 파일 크기 체크
          fname = multipartFile.getOriginalFilename(); // 원본 파일명
          fupname = Upload.saveFileSpring(multipartFile, upDir); // 파일 저장
          
          if (Tool.isImage(fname)) { // 이미지인지 검사
            thumb = Tool.preview(upDir, fupname, 120, 80); // thumb 이미지 생성
          }
        }
        Product_imageVO vo = new Product_imageVO();
        vo.setProductno(productno);
        vo.setFname(fname);
        vo.setFupname(fupname);
        vo.setThumb(thumb);
        vo.setFsize(fsize);
        
        upload_count = upload_count + product_imageProc.create(vo); // 파일 1건 등록 정도 dbms 저장
      }
    }    
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------
    
    ra.addAttribute("upload_count", upload_count);
    ra.addAttribute("productcateno", productcateno);
    ra.addAttribute("nowPage", nowPage);
    ra.addAttribute("productno", product_imageVO.getProductno());
    
    mav.setViewName("redirect:/product_image/create_msg.jsp");
    return mav;
  }
  
  @RequestMapping(value = "/product_image/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<Product_imageVO> list = product_imageProc.list();
    mav.addObject("list", list);

    mav.setViewName("/product_image/list");

    return mav;
  }
  
  @RequestMapping(value = "/product_image/downzip.do", 
                             method = RequestMethod.GET)
  public ModelAndView downzip(HttpServletRequest request, int productno) {
    ModelAndView mav = new ModelAndView();
    
    // 글번호에 해당하는 파일 목록 산출
    List<Product_imageVO> product_image_list = product_imageProc.list_by_productno(productno);
    
    // 실제 저장된 파일명만 추출
    ArrayList<String> files_array = new ArrayList<String>();
    for(Product_imageVO product_imageVO:product_image_list) {
      files_array.add(product_imageVO.getFupname());
    }
    
    String dir = "/product_image/storage";
    String upDir = Tool.getRealPath(request, dir); // 절대 경로
    
    // 압축될 파일명, 동시 접속자 다운로드의 충돌 처리
    String zip = "download_files_" + Tool.getRandomDate() + ".zip"; 
    String zip_filename = upDir + zip;
    
    String[] zip_src = new String[files_array.size()]; // 파일 갯수만큼 배열 선언
    
    for (int i=0; i < files_array.size(); i++) {
      zip_src[i] = upDir + "/" + files_array.get(i); // 절대 경로 조합      
    }
 
    byte[] buffer = new byte[4096]; // 4 KB
    
    try {
      ZipOutputStream zipOutputStream = new ZipOutputStream(new FileOutputStream(zip_filename));
      
      for(int index=0; index < zip_src.length; index++) {
        FileInputStream in = new FileInputStream(zip_src[index]);
        
        Path path = Paths.get(zip_src[index]);
        String zip_src_file = path.getFileName().toString();
        // System.out.println("zip_src_file: " + zip_src_file);
        
        ZipEntry zipEntry = new ZipEntry(zip_src_file);
        zipOutputStream.putNextEntry(zipEntry);
        
        int length = 0;
        // 4 KB씩 읽어서 buffer 배열에 저장후 읽은 바이트수를 length에 저장
        while((length = in.read(buffer)) > 0) {
          zipOutputStream.write(buffer, 0, length); // 기록할 내용, 내용에서의 시작 위치, 기록할 길이
          
        }
        zipOutputStream.closeEntry();
        in.close();
      }
      zipOutputStream.close();
      
      File file = new File(zip_filename);
      
      if (file.exists() && file.length() > 0) {
        System.out.println(zip_filename + " 압축 완료");
      }
      
//      if (file.delete() == true) {
//        System.out.println(zip_filename + " 파일을 삭제했습니다.");
//      }
 
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
 
    // download 서블릿 연결
    mav.setViewName("redirect:/download?dir=" + dir + "&filename=" + zip);    
    
    return mav;
  }
  
  @RequestMapping(value = "/product_image/delete_by_productno.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete_by_contentsno(RedirectAttributes ra,
                                                                 int productno,
                                                                 int productcateno) {
    ModelAndView mav = new ModelAndView();

    int count = product_imageProc.delete_by_productno(productno);

    ra.addAttribute("count", count); // 삭제된 레코드 갯수
    ra.addAttribute("productno", productno);
    ra.addAttribute("productcateno", productcateno);
    
    mav.setViewName("redirect:/product_image/delete_by_contentsno_msg.jsp");

    return mav;
  }
  
}




