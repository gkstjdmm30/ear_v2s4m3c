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
   * 목록 + 검색 + 페이징 지원
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
      @RequestParam(value="categrpno", defaultValue="1") int categrpno, // 기본값
      @RequestParam(value="word", defaultValue="") String word,						// 기본값
      @RequestParam(value="nowPage", defaultValue="1") int nowPage    // 기본값
      ) { 
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/list_by_categrpno_search_paging");   
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("categrpno", categrpno); // #{categrpno}
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage);       
    
    // 검색 목록
    List<NoticeVO> list = noticeProc.list_by_categrpno_search_paging(map); // 목록을 만들어서
    mav.addObject("list", list); // 리턴해줌
    
    // 검색된 레코드 갯수
    int search_count = noticeProc.search_count(map);
    mav.addObject("search_count", search_count);
    
    Notice_categrpVO notice_categrpVO = notice_categrpProc.read(categrpno);
    mav.addObject("notice_categrpVO", notice_categrpVO);
  
    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
     * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
     * 
     * @param listFile 목록 파일명 
     * @param categrpno 카테고리번호 
     * @param search_count 검색(전체) 레코드수 
     * @param nowPage     현재 페이지
     * @param word 검색어
     * @return 페이징 생성 문자열
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
      notice_categrpProc.increaseCnt(noticeVO.getCategrpno()); // 카테고리 글수 증가
    }
    // mav.setViewName("/notice/create"); // /webapp/notice/create.jsp
    // redirect: form에서 보낸 데이터 모두 삭제됨, 새로고침 중복 등록 방지용.
    
    ra.addAttribute("count", count); // redirect parameter 적용
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
   * 첨부 파일 1건 삭제 폼
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
   * 첨부 파일 1건 삭제 처리
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

    // 1건의 파일 삭제
    notice_attachfileProc.delete(attachfileno);
    
    List<Notice_attachfileVO> notice_attachfile_list = notice_attachfileProc.list_by_noticeno(noticeno);
    mav.addObject("notice_attachfile_list", notice_attachfile_list);
    
    mav.setViewName("/notice/file_delete"); // file_delete.jsp

    return mav;
  }
  
  /**
   * 수정 폼
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
   * 수정 처리
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
    // redirect: form에서 보낸 데이터 모두 삭제됨, 새로고침 중복 등록 방지용.
    ra.addAttribute("count", count);
    ra.addAttribute("categrpno", noticeVO.getCategrpno());
    ra.addAttribute("noticeno", noticeVO.getNoticeno());
    ra.addAttribute("nowPage", nowPage);
    
    mav.setViewName("redirect:/notice/update_msg.jsp");

    return mav;
  }
  
  /**
   * 한건 삭제폼
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
    
    // FK noticeno 컬럼 값이 사용된 레코드 갯수 산출: id="count_by_noticeno" 
    int count_by_noticeno = notice_attachfileProc.count_by_noticeno(noticeno);
    mav.addObject("count_by_noticeno", count_by_noticeno);
    
    mav.setViewName("/notice/delete"); // /webapp/notice/delete.jsp

    return mav;
  }
  
  /**
   * 한건 삭제 처리
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
    // 현재 로그인한 사용자와 글 등록자가 같은지 검사
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
   * FK 컬럼값을 이용한 레코드 삭제 처리
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
    if (count > 0) { // FK 컬럼 관련 글이 정상적으로 삭제되었다면 cnt 컬럼 0으로변경
      notice_categrpProc.cnt_zero(categrpno);
    }

    ra.addAttribute("count", count); // 삭제된 레코드 갯수
    ra.addAttribute("categrpno", categrpno);
    
    mav.setViewName("redirect:/notice/delete_by_categrpno_msg.jsp");

    return mav;
  }
   
   
   
	
}
