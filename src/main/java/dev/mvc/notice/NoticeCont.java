package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;

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
   * http://localhost:9090/ojt/contents/list.do
   * http://localhost:9090/ojt/contents/list.do?categrpno=1&word=&nowPage=1
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
   
  // http://localhost:9090/ear/notice/create.do?memberno=2&categrpno=1
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
   
   
   
	
}
