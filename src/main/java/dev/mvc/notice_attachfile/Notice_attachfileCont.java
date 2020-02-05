package dev.mvc.notice_attachfile;

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

import dev.mvc.notice_categrp.Notice_categrpProcInter;
import dev.mvc.notice_categrp.Notice_categrpVO;
import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class Notice_attachfileCont {
  @Autowired
  @Qualifier("dev.mvc.notice_categrp.Notice_categrpProc") // �̸� ����
  private Notice_categrpProcInter notice_categrpProc;

  @Autowired
  @Qualifier("dev.mvc.notice_attachfile.Notice_attachfileProc") // �̸� ����
  private Notice_attachfileProcInter notice_attachfileProc;
  
  public Notice_attachfileCont(){
    System.out.println("--> Notice_attachfileCont created.");
  }
  
  /**
   * ���� �����
   * @param categrpno ī�װ� �׷� FK
   * @param noticeno ������ ��ȣ FK
   * @return
   */
  // http://localhost:9090/ear/notice_attachfile/create.do?categrpno=1&notoceno=1
  @RequestMapping(value = "/notice_attachfile/create.do", method = RequestMethod.GET)
  public ModelAndView create(int categrpno, int noticeno) {
    ModelAndView mav = new ModelAndView();

    Notice_categrpVO notice_categrpVO = notice_categrpProc.read(categrpno);
    mav.addObject("notice_categrpVO", notice_categrpVO);
    mav.addObject("categrpno", categrpno);

    mav.setViewName("/notice_attachfile/create"); // /webapp/notice_attachfile/create.jsp
    
    return mav;
  }
  
  @RequestMapping(value = "/notice_attachfile/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra,
                                           HttpServletRequest request,
                                           Notice_attachfileVO notice_attachfileVO,
                                           int categrpno) {
    System.out.println("--> --> --> ");
    
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    int noticeno = notice_attachfileVO.getNoticeno(); // �θ�� ��ȣ
    String fname = ""; // ���� ���ϸ�
    String fupname = ""; // ���ε�� ���ϸ�
    long fsize = 0;  // ���� ������
    String thumb = ""; // Preview �̹���
    int upload_count = 0; // ����ó���� ���ڵ� ����
    
    String upDir = Tool.getRealPath(request, "/notice_attachfile/storage");
    // ���� ������ ����� fnamesMF ��ü�� ������.
    List<MultipartFile> fnamesMF = notice_attachfileVO.getFnamesMF();
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
        Notice_attachfileVO v = new Notice_attachfileVO();
        v.setNoticeno(noticeno);
        v.setFname(fname);
        v.setFupname(fupname);
        v.setThumb(thumb);
        v.setFsize(fsize);
        
        upload_count = upload_count + notice_attachfileProc.create(v); // ���� 1�� ��� ���� dbms ����
      }
    }    
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    
    ra.addAttribute("upload_count", upload_count);
    ra.addAttribute("categrpno", categrpno);
    ra.addAttribute("noticeno", notice_attachfileVO.getNoticeno());
    
    mav.setViewName("redirect:/notice_attachfile/create_msg.jsp");
    return mav;
  }
  
  /**
   * ���
   * http://localhost:9090/ear/notice_attachfile/list.do
   * 
   * @param categrpno
   * @return
   */
  @RequestMapping(value = "/notice_attachfile/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<Notice_attachfileVO> list = notice_attachfileProc.list();
    mav.addObject("list", list);

    mav.setViewName("/notice_attachfile/list");

    return mav;
  }
  
  /**
   * ZIP ���� �� ���� �ٿ�ε�
   * @param request
   * @param noticeno ���� ����� �����ö� ����� �۹�ȣ
   * @return
   */
  @RequestMapping(value = "/notice_attachfile/downzip.do", 
                             method = RequestMethod.GET)
  public ModelAndView downzip(HttpServletRequest request, int noticeno) {
    ModelAndView mav = new ModelAndView();
    
    // �۹�ȣ�� �ش��ϴ� ���� ��� ����
    List<Notice_attachfileVO> attachfile_list = notice_attachfileProc.list_by_noticeno(noticeno);
    
    // ���� ����� ���ϸ� ����
    ArrayList<String> files_array = new ArrayList<String>();
    for(Notice_attachfileVO notice_attachfileVO:attachfile_list) {
      files_array.add(notice_attachfileVO.getFupname());
    }
    
    String dir = "/notice_attachfile/storage";
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
  
  /**
   * FK noticeno �÷����� �̿��� ���ڵ� ���� ó��
   * @param ra
   * @param categrpno
   * @return
   */
  @RequestMapping(value = "/notice_attachfile/delete_by_noticeno.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete_by_contentsno(RedirectAttributes ra,
                                                                 int noticeno,
                                                                 int categrpno) {
    ModelAndView mav = new ModelAndView();

    int count = notice_attachfileProc.delete_by_noticeno(noticeno);

    ra.addAttribute("count", count); // ������ ���ڵ� ����
    ra.addAttribute("noticeno", noticeno);
    ra.addAttribute("categrpno", categrpno);
    
    mav.setViewName("redirect:/notice_attachfile/delete_by_noticeno_msg.jsp");

    return mav;
  }
  
}




