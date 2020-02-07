package dev.mvc.notice_categrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.notice.NoticeProcInter;
import dev.mvc.notice_categrp.Notice_categrpVO;

@Controller
public class Notice_categrpCont {
  @Autowired
  @Qualifier("dev.mvc.notice_categrp.Notice_categrpProc") // 이름 지정
  private Notice_categrpProcInter notice_categrpProc;
  
	@Autowired
	@Qualifier("dev.mvc.notice.NoticeProc")
	private NoticeProcInter noticeProc;
  
  public Notice_categrpCont() {
    System.out.println("--> Notice_categrpCont created.");
  }
  
  // seqno 오름차순 출력 목록
  // http://localhost:9090/team4/notice_categrp/list.do
  @RequestMapping(value="/notice_categrp/list.do", method=RequestMethod.GET)
  public ModelAndView list_seqno_asc() {
    ModelAndView mav = new ModelAndView();
    
    List<Notice_categrpVO> list = notice_categrpProc.list_seqno_asc();
    
    mav.addObject("list", list);
    mav.setViewName("/notice_categrp/list"); // /webapp/notice_categrp/list.jsp
        
    return mav;
  }
  
  //등록 처리 폼
  // http://localhost:9090/team4/notice_categrp/create.do
  @RequestMapping(value="/notice_categrp/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice_categrp/create"); // /webapp/notice_categrp/create.jsp
    
    return mav;
  }
  
  // 등록 처리
  @RequestMapping(value="/notice_categrp/create.do", method=RequestMethod.POST)
  public ModelAndView create(Notice_categrpVO notice_categrpVO) {
    ModelAndView mav = new ModelAndView();
    
    int count = notice_categrpProc.create(notice_categrpVO);
    if (count == 0) {
      mav.setViewName("redirect:/notice_categrp/create_msg.jsp?count=" + count);
    } else {
      mav.setViewName("redirect:/notice_categrp/list.do"); // list.jsp X
    }
        
    return mav;
  }
  
  // 수정폼 + 조회
  @RequestMapping(value="/notice_categrp/update.do", method=RequestMethod.GET)
  public ModelAndView update(int categrpno) {
    ModelAndView mav = new ModelAndView();
    
    Notice_categrpVO notice_categrpVO = notice_categrpProc.read(categrpno);
    
    mav.addObject("notice_categrpVO", notice_categrpVO);
    mav.setViewName("/notice_categrp/update"); // /webapp/notice_categrp/update.jsp

    // mav.setViewName("redirect:/notice_categrp/create_msg.jsp?count=" + count);
        
    return mav;
  }
 
  // 수정 처리
  @RequestMapping(value="/notice_categrp/update.do", method=RequestMethod.POST)
  public ModelAndView update(Notice_categrpVO notice_categrpVO) {
    ModelAndView mav = new ModelAndView();
    
    int count = notice_categrpProc.update(notice_categrpVO);
    String url = "redirect:/notice_categrp/update_msg.jsp?count=" + count +
                      "&categrpno=" + notice_categrpVO.getCategrpno();
    mav.setViewName(url);
                               
    return mav;
  }
  
  // 삭제폼
  @RequestMapping(value="/notice_categrp/delete.do", method=RequestMethod.GET)
  public ModelAndView delete(int categrpno) {
    ModelAndView mav = new ModelAndView();
    
    Notice_categrpVO notice_categrpVO = notice_categrpProc.read(categrpno);
    
    int count_by_categrpno = noticeProc.count_by_categrpno(categrpno);
    mav.addObject("count_by_categrpno", count_by_categrpno);
    
    mav.addObject("notice_categrpVO", notice_categrpVO);
    mav.setViewName("/notice_categrp/delete"); // /webapp/notice_categrp/delete.jsp

    // mav.setViewName("redirect:/notice_categrp/create_msg.jsp?count=" + count);
        
    return mav;
  }
  
  // 삭제 처리
  @RequestMapping(value="/notice_categrp/delete.do", method=RequestMethod.POST)
  public ModelAndView delete_proc(int categrpno) {
    ModelAndView mav = new ModelAndView();
    
    int count = notice_categrpProc.delete(categrpno);
    String url = "redirect:/notice_categrp/delete_msg.jsp?count=" + count +
                      "&categrpno=" + categrpno;
    mav.setViewName(url);
                               
    return mav;
  }
  
  // 우선순위 상향
  @RequestMapping(value="/notice_categrp/update_seqno_up.do", method=RequestMethod.GET)
  public ModelAndView update_seqno_up(int categrpno) {
  	ModelAndView mav = new ModelAndView();

  	int count = notice_categrpProc.update_seqno_up(categrpno);
  	String url = "redirect:/notice_categrp/list.do";
  	mav.setViewName(url);
  	
  	return mav;
  }

  // 우선순위 하향
  @RequestMapping(value="/notice_categrp/update_seqno_down.do", method=RequestMethod.GET)
  public ModelAndView update_seqno_down(int categrpno) {
  	ModelAndView mav = new ModelAndView();

  	int count = notice_categrpProc.update_seqno_down(categrpno);
  	String url = "redirect:/notice_categrp/list.do";
  	mav.setViewName(url);
  	
  	return mav;
  }
  
  
  
  
  
  
  
  
} 





