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
   * 목록 + 검색 + 페이징 지원
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
   
   
   
	
}
