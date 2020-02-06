package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.notice_attachfile.Notice_attachfileProcInter;
import dev.mvc.notice_attachfile.Notice_attachfileVO;
import dev.mvc.notice_categrp.Notice_categrpProcInter;
import dev.mvc.notice_categrp.Notice_categrpVO;

@Controller
public class NoticeCont {
	@Autowired
	@Qualifier("dev.mvc.notice.NoticeProc")
	private NoticeProcInter noticeProc;
	
	@Autowired
	@Qualifier("dev.mvc.notice_categrp.Notice_categrpProc")
	private Notice_categrpProcInter notice_categrpProc;
	
	@Autowired
	@Qualifier("dev.mvc.notice_attachfile.Notice_attachfileProc")
	private Notice_attachfileProcInter notice_attachfileProc;
	
  public NoticeCont() {
    System.out.println("--> NoticeCont created.");
  }
	
  /**
   * ��� + �˻� + ����¡ ����
   * http://localhost:9090/ojt/notice/list.do
   * http://localhost:9090/ojt/notice/list.do?categrpno=1&word=&nowPage=1
   * @param categoryno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/notice/list.do", 
                                       method = RequestMethod.GET)
  public ModelAndView list_by_categrpno_search_paging(
      @RequestParam(value="categrpno", defaultValue="1") int categrpno, // �⺻��
      @RequestParam(value="word", defaultValue="") String word,						// �⺻��
      @RequestParam(value="nowPage", defaultValue="1") int nowPage    // �⺻��
      ) { 
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/list_by_categrpno_search_paging");   
    
    // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("categrpno", categrpno); // #{categrpno}
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage);       
    
    // �˻� ���
    List<NoticeVO> list = noticeProc.list_by_categrpno_search_paging(map); // ����� ����
    mav.addObject("list", list); // ��������
    
    // �˻��� ���ڵ� ����
    int search_count = noticeProc.search_count(map);
    mav.addObject("search_count", search_count);
    
    Notice_categrpVO notice_categrpVO = notice_categrpProc.read(categrpno);
    mav.addObject("notice_categrpVO", notice_categrpVO);
  
    /*
     * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
     * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
     * 
     * @param listFile ��� ���ϸ� 
     * @param categrpno ī�װ���ȣ 
     * @param search_count �˻�(��ü) ���ڵ�� 
     * @param nowPage     ���� ������
     * @param word �˻���
     * @return ����¡ ���� ���ڿ�
     */ 
    String paging = noticeProc.pagingBox("list.do", categrpno, search_count, nowPage, word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);
    
    return mav;
  }
   
  // http://localhost:9090/ear/notice/create.do?membersno=2&categrpno=1
  @RequestMapping(value = "/notice/create.do", method = RequestMethod.GET)
  public ModelAndView create(int categrpno) {
    ModelAndView mav = new ModelAndView();

    Notice_categrpVO notice_categrpVO = notice_categrpProc.read(categrpno);
    mav.addObject("notice_categrpVO", notice_categrpVO);

    mav.setViewName("/notice/create"); // /webapp/notice/create.jsp

    return mav;
  }
   
  @RequestMapping(value = "/notice/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra,
                                           NoticeVO noticeVO) {
    ModelAndView mav = new ModelAndView();

    int count = noticeProc.create(noticeVO);

    if (count == 1) {
      notice_categrpProc.increaseCnt(noticeVO.getCategrpno()); // ī�װ� �ۼ� ����
    }
    // mav.setViewName("/notice/create"); // /webapp/notice/create.jsp
    // redirect: form���� ���� ������ ��� ������, ���ΰ�ħ �ߺ� ��� ������.
    
    ra.addAttribute("count", count); // redirect parameter ����
    ra.addAttribute("categrpno", noticeVO.getCategrpno());
    
    mav.setViewName("redirect:/notice/create_msg.jsp");

    return mav;
  }
  
  @RequestMapping(value = "/notice/read.do", method = RequestMethod.GET)
  public ModelAndView read(int noticeno) {
    ModelAndView mav = new ModelAndView();

    NoticeVO noticeVO = noticeProc.read(noticeno);
    mav.addObject("noticeVO", noticeVO);

    Notice_categrpVO notice_categrpVO = notice_categrpProc.read(noticeVO.getCategrpno());
    mav.addObject("notice_categrpVO", notice_categrpVO);
    
    List<Notice_attachfileVO> attachfile_list = notice_attachfileProc.list_by_noticeno(noticeno);
    mav.addObject("attachfile_list", attachfile_list);
    
    mav.setViewName("/notice/read");

    return mav;
  }
  
  /**
   * ÷�� ���� 1�� ���� ��
   * 
   * @param noticeno
   * @return
   */
  @RequestMapping(value = "/notice/file_delete.do", 
                             method = RequestMethod.GET)
  public ModelAndView file_delete(int noticeno) {
    ModelAndView mav = new ModelAndView();

    NoticeVO noticeVO = noticeProc.read(noticeno);
    mav.addObject("noticeVO", noticeVO);

    Notice_categrpVO notice_categrpVO = notice_categrpProc.read(noticeVO.getCategrpno());
    mav.addObject("notice_categrpVO", notice_categrpVO);
    
    List<Notice_attachfileVO> notice_attachfile_list = notice_attachfileProc.list_by_noticeno(noticeno);
    mav.addObject("notice_attachfile_list", notice_attachfile_list);
    
    mav.setViewName("/notice/file_delete"); // file_delete.jsp

    return mav;
  }
  
  /**
   * ÷�� ���� 1�� ���� ó��
   * 
   * @param noticeno
   * @return
   */
  @RequestMapping(value = "/notice/file_delete_proc.do", 
                             method = RequestMethod.GET)
  public ModelAndView file_delete_proc(int noticeno, int attachfileno) {
    ModelAndView mav = new ModelAndView();

    NoticeVO noticeVO = noticeProc.read(noticeno);
    mav.addObject("noticeVO", noticeVO);

    Notice_categrpVO notice_categrpVO = notice_categrpProc.read(noticeVO.getCategrpno());
    mav.addObject("notice_categrpVO", notice_categrpVO);

    // 1���� ���� ����
    notice_attachfileProc.delete(attachfileno);
    
    List<Notice_attachfileVO> notice_attachfile_list = notice_attachfileProc.list_by_noticeno(noticeno);
    mav.addObject("notice_attachfile_list", notice_attachfile_list);
    
    mav.setViewName("/notice/file_delete"); // file_delete.jsp

    return mav;
  }
  
  /**
   * ���� ��
   * @param 
   * @return
   */
  // http://localhost:9090/ojt/contents/update.do?memberno=1&categrpno=1
  @RequestMapping(value = "/notice/update.do", method = RequestMethod.GET)
  public ModelAndView update(int categrpno, int noticeno) {
    ModelAndView mav = new ModelAndView();

    Notice_categrpVO notice_categrpVO = notice_categrpProc.read(categrpno);
    mav.addObject("notice_categrpVO", notice_categrpVO);

    NoticeVO noticeVO = noticeProc.read(noticeno);
    mav.addObject("noticeVO", noticeVO);

    mav.setViewName("/notice/update"); // /webapp/notice/update.jsp

    return mav;
  }
  
  /**
   * ���� ó��
   * @param noticeVO
   * @return
   */
  @RequestMapping(value = "/notice/update.do", 
                             method = RequestMethod.POST)
  public ModelAndView update(RedirectAttributes ra,
                                            NoticeVO noticeVO,
                                            int nowPage) {
    ModelAndView mav = new ModelAndView();

    int count = noticeProc.update(noticeVO);

    // mav.setViewName("/contents/create"); // /webapp/notice/create.jsp
    // redirect: form���� ���� ������ ��� ������, ���ΰ�ħ �ߺ� ��� ������.
    ra.addAttribute("count", count);
    ra.addAttribute("categrpno", noticeVO.getCategrpno());
    ra.addAttribute("noticeno", noticeVO.getNoticeno());
    ra.addAttribute("nowPage", nowPage);
    
    mav.setViewName("redirect:/notice/update_msg.jsp");

    return mav;
  }
  
  /**
   * �Ѱ� ������
   * @param categrpno
   * @param notice
   * @return
   */
  // http://localhost:9090/ojt/notice/delete.do?categrpno=1&notice=1
  @RequestMapping(value = "/notice/delete.do", 
                             method = RequestMethod.GET)
  public ModelAndView delete(int categrpno, int noticeno, int nowPage) {
    ModelAndView mav = new ModelAndView();

    Notice_categrpVO notice_categrpVO = notice_categrpProc.read(categrpno);
    mav.addObject("notice_categrpProc", notice_categrpProc);

    NoticeVO noticeVO = noticeProc.read(noticeno);
    mav.addObject("noticeVO", noticeVO);
    
    // FK noticeno �÷� ���� ���� ���ڵ� ���� ����: id="count_by_noticeno" 
    int count_by_noticeno = notice_attachfileProc.count_by_noticeno(noticeno);
    mav.addObject("count_by_noticeno", count_by_noticeno);
    
    mav.setViewName("/notice/delete"); // /webapp/notice/delete.jsp

    return mav;
  }
  
  /**
   * �Ѱ� ���� ó��
   * @param ra
   * @param notice
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/notice/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete(HttpSession session,
                                           RedirectAttributes ra,
                                            int categrpno,
                                            int noticeno, 
                                            int nowPage) {
    ModelAndView mav = new ModelAndView();

    int membersno = (Integer)session.getAttribute("membersno");
    // ���� �α����� ����ڿ� �� ����ڰ� ������ �˻�
    if (membersno == noticeProc.read(noticeno).getMembersno()) {
      int count = noticeProc.delete(noticeno);
      if (count == 1) {
        notice_categrpProc.decreaseCnt(categrpno);
      }

      ra.addAttribute("count", count);
      ra.addAttribute("categrpno", categrpno);
      ra.addAttribute("noticeno", noticeno);
      ra.addAttribute("nowPage", nowPage);
      
      mav.setViewName("redirect:/notice/delete_msg.jsp");
    } else {
      ra.addAttribute("categrpno", categrpno);
      mav.setViewName("redirect:/notice/auth_fail_msg.jsp");
    }

    return mav;
  }
  
  /**
   * FK �÷����� �̿��� ���ڵ� ���� ó��
   * @param ra
   * @param categrpno
   * @return
   */
  @RequestMapping(value = "/notice/delete_by_noticeno.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete_by_categrpno(RedirectAttributes ra,
                                            int categrpno) {
    ModelAndView mav = new ModelAndView();

    int count = noticeProc.delete_by_categrpno(categrpno);
    if (count > 0) { // FK �÷� ���� ���� ���������� �����Ǿ��ٸ� cnt �÷� 0���κ���
      notice_categrpProc.cnt_zero(categrpno);
    }

    ra.addAttribute("count", count); // ������ ���ڵ� ����
    ra.addAttribute("categrpno", categrpno);
    
    mav.setViewName("redirect:/notice/delete_by_categrpno_msg.jsp");

    return mav;
  }
   
   
   
	
}
