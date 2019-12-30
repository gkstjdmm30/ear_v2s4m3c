package dev.mvc.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.notice.NoticeVO;

@Controller
public class NoticeCont {
  @Autowired
  @Qualifier("dev.mvc.notice.NoticeProc") // 이름 지정
  private NoticeProcInter noticeProc;
  
  public NoticeCont() {
    System.out.println("--> NoticeCont created.");
  }
  
  // seqno 오름차순 출력 목록
  // http://localhost:9090/team4/notice/list.do
  @RequestMapping(value="/notice/list.do", method=RequestMethod.GET)
  public ModelAndView list_seqno_asc() {
    ModelAndView mav = new ModelAndView();
    
    List<NoticeVO> list = noticeProc.list_seqno_asc();
    
    mav.addObject("list", list);
    mav.setViewName("/notice/list"); // /webapp/notice/list.jsp
        
    return mav;
  }
  
  //등록 처리 폼
  // http://localhost:9090/team4/notice/create.do
  @RequestMapping(value="/notice/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/create"); // /webapp/notice/create.jsp
    
    return mav;
  }
  
  // 등록 처리
  @RequestMapping(value="/notice/create.do", method=RequestMethod.POST)
  public ModelAndView create(NoticeVO noticeVO) {
    ModelAndView mav = new ModelAndView();
    
    int count = noticeProc.create(noticeVO);
    if (count == 0) {
      mav.setViewName("redirect:/notice/create_msg.jsp?count=" + count);
    } else {
      mav.setViewName("redirect:/notice/list.do"); // list.jsp X
    }
        
    return mav;
  }
  
  // 수정폼 + 조회
  @RequestMapping(value="/notice/update.do", method=RequestMethod.GET)
  public ModelAndView update(int categrpno) {
    ModelAndView mav = new ModelAndView();
    
    NoticeVO noticeVO = noticeProc.read(categrpno);
    
    mav.addObject("noticeVO", noticeVO);
    mav.setViewName("/notice/update"); // /webapp/notice/update.jsp

    // mav.setViewName("redirect:/notice/create_msg.jsp?count=" + count);
        
    return mav;
  }
 
  // 수정 처리
  @RequestMapping(value="/notice/update.do", method=RequestMethod.POST)
  public ModelAndView update(NoticeVO noticeVO) {
    ModelAndView mav = new ModelAndView();
    
    int count = noticeProc.update(noticeVO);
    String url = "redirect:/notice/update_msg.jsp?count=" + count +
                      "&categrpno=" + noticeVO.getCategrpno();
    mav.setViewName(url);
                               
    return mav;
  }
  
  // 삭제폼
  @RequestMapping(value="/notice/delete.do", method=RequestMethod.GET)
  public ModelAndView delete(int categrpno) {
    ModelAndView mav = new ModelAndView();
    
    NoticeVO noticeVO = noticeProc.read(categrpno);
    
    mav.addObject("noticeVO", noticeVO);
    mav.setViewName("/notice/delete"); // /webapp/notice/delete.jsp

    // mav.setViewName("redirect:/notice/create_msg.jsp?count=" + count);
        
    return mav;
  }
  
  // 삭제 처리
  @RequestMapping(value="/notice/delete.do", method=RequestMethod.POST)
  public ModelAndView delete_proc(int categrpno) {
    ModelAndView mav = new ModelAndView();
    
    int count = noticeProc.delete(categrpno);
    String url = "redirect:/notice/delete_msg.jsp?count=" + count +
                      "&categrpno=" + categrpno;
    mav.setViewName(url);
                               
    return mav;
  }
  
} 





