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
  @Qualifier("dev.mvc.product_categrp.Product_categrpProc") // �̸� ����
  private Product_categrpProcInter product_categrpProc;

  @Autowired
  @Qualifier("dev.mvc.product_image.Product_imageProc") // �̸� ����
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
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    int productno = product_imageVO.getProductno(); // �θ�� ��ȣ
    String fname = ""; // ���� ���ϸ�
    String fupname = ""; // ���ε�� ���ϸ�
    long fsize = 0;  // ���� ������
    String thumb = ""; // Preview �̹���
    int upload_count = 0; // ����ó���� ���ڵ� ����
    
    String upDir = Tool.getRealPath(request, "/product_image/storage");
    // ���� ������ ����� fnamesMF ��ü�� ������.
    List<MultipartFile> fnamesMF = product_imageVO.getFnamesMF();
    int count = fnamesMF.size(); // ���� ���� ����
    if (count > 0) {
      for (MultipartFile multipartFile:fnamesMF) { // ���� ����
        fsize = multipartFile.getSize();  // ���� ũ��
        if (fsize > 0) { // ���� ũ�� üũ
          fname = multipartFile.getOriginalFilename(); // ���� ���ϸ�
          fupname = Upload.saveFileSpring(multipartFile, upDir); // ���� ����
          
          if (Tool.isImage(fname)) { // �̹������� �˻�
            thumb = Tool.preview(upDir, fupname, 120, 80); // thumb �̹��� ����
          }
        }
        Product_imageVO vo = new Product_imageVO();
        vo.setProductno(productno);
        vo.setFname(fname);
        vo.setFupname(fupname);
        vo.setThumb(thumb);
        vo.setFsize(fsize);
        
        upload_count = upload_count + product_imageProc.create(vo); // ���� 1�� ��� ���� dbms ����
      }
    }    
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
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
    
    // �۹�ȣ�� �ش��ϴ� ���� ��� ����
    List<Product_imageVO> product_image_list = product_imageProc.list_by_productno(productno);
    
    // ���� ����� ���ϸ� ����
    ArrayList<String> files_array = new ArrayList<String>();
    for(Product_imageVO product_imageVO:product_image_list) {
      files_array.add(product_imageVO.getFupname());
    }
    
    String dir = "/product_image/storage";
    String upDir = Tool.getRealPath(request, dir); // ���� ���
    
    // ����� ���ϸ�, ���� ������ �ٿ�ε��� �浹 ó��
    String zip = "download_files_" + Tool.getRandomDate() + ".zip"; 
    String zip_filename = upDir + zip;
    
    String[] zip_src = new String[files_array.size()]; // ���� ������ŭ �迭 ����
    
    for (int i=0; i < files_array.size(); i++) {
      zip_src[i] = upDir + "/" + files_array.get(i); // ���� ��� ����      
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
        // 4 KB�� �о buffer �迭�� ������ ���� ����Ʈ���� length�� ����
        while((length = in.read(buffer)) > 0) {
          zipOutputStream.write(buffer, 0, length); // ����� ����, ���뿡���� ���� ��ġ, ����� ����
          
        }
        zipOutputStream.closeEntry();
        in.close();
      }
      zipOutputStream.close();
      
      File file = new File(zip_filename);
      
      if (file.exists() && file.length() > 0) {
        System.out.println(zip_filename + " ���� �Ϸ�");
      }
      
//      if (file.delete() == true) {
//        System.out.println(zip_filename + " ������ �����߽��ϴ�.");
//      }
 
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
 
    // download ���� ����
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

    ra.addAttribute("count", count); // ������ ���ڵ� ����
    ra.addAttribute("productno", productno);
    ra.addAttribute("productcateno", productcateno);
    
    mav.setViewName("redirect:/product_image/delete_by_contentsno_msg.jsp");

    return mav;
  }
  
}




