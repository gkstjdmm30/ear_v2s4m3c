package dev.mvc.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.product_categrp.Product_categrpProcInter;
import dev.mvc.product_categrp.Product_categrpVO;
import dev.mvc.product_image.Product_imageProcInter;
import dev.mvc.product_image.Product_imageVO;
import dev.mvc.reply.ReplyProcInter;

@Controller
public class ProductCont {
  @Autowired
  @Qualifier("dev.mvc.product.ProductProc")
  private ProductProcInter productProc;
  
  @Autowired
  @Qualifier("dev.mvc.product_categrp.Product_categrpProc")
  private Product_categrpProcInter product_categrpProc;
  
  @Autowired
  @Qualifier("dev.mvc.product_image.Product_imageProc")
  private Product_imageProcInter product_imageProc;
  
  @Autowired
  @Qualifier("dev.mvc.reply.ReplyProc") // 이름 지정
  private ReplyProcInter replyProc;
  
  /*@Autowired
  @Qualifier("dev.mvc.membersProc")
  private MembersProc membersProc;*/
  
  public ProductCont() {
    System.out.println("--> Product created.");
  }
  
  // http://localhost:9090/ojt/product/create.do?productcateno=1
  @RequestMapping(value = "/product/create.do", method = RequestMethod.GET)
  public ModelAndView create(int productcateno) {
    ModelAndView mav = new ModelAndView();

    Product_categrpVO product_categrpVO = product_categrpProc.read(productcateno);
    mav.addObject("product_categrpVO", product_categrpVO);

    mav.setViewName("/product/create"); // /webapp/product/create.jsp

    return mav;
  }
  
  @RequestMapping(value = "/product/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra,
                                           ProductVO productVO,
                                           int nowPage) {
    ModelAndView mav = new ModelAndView();

    int count = productProc.create(productVO);

    if (count == 1) {
      product_categrpProc.increaseCnt(productVO.getProductcateno()); // 카테고리 글수 증가
    }
    // mav.setViewName("/contents/create"); // /webapp/product/create.jsp
    // redirect: form에서 보낸 데이터 모두 삭제됨, 새로고침 중복 등록 방지용.
    
    ra.addAttribute("count", count); // redirect parameter 적용
    ra.addAttribute("productcateno", productVO.getProductcateno());
    ra.addAttribute("nowPage", nowPage);
    
    mav.setViewName("redirect:/product/create_msg.jsp");

    return mav;
  }
  
  
  
  // http://localhost:9090/team4/product/list_by_productcateno.do?productcateno=1
  @RequestMapping(value = "/product/list_by_productcateno.do", method = RequestMethod.GET)
  public ModelAndView list_by_productcateno(int productcateno) {
    ModelAndView mav = new ModelAndView();

    List<ProductVO> list = productProc.list_by_productcateno(productcateno);
    mav.addObject("list", list);
    // /webapp/product/list.jsp

    Product_categrpVO product_categrpVO = product_categrpProc.read(productcateno);
    mav.addObject("product_categrpVO", product_categrpVO);

    mav.setViewName("/product/list_by_productcateno"); // 카테고리 그룹별 목록

    return mav;
  }
  
  /*@RequestMapping(value = "/product/list.do", method = RequestMethod.GET)
  public ModelAndView list_by_search(String word) {
    ModelAndView mav = new ModelAndView();

    HashMap<String, Object> hashMap = new HashMap<>();
    hashMap.put("word", word);
    
    List<ProductVO> list = productProc.list_by_search(hashMap); // 검색
    mav.addObject("list", list);
    // /webapp/product/list.jsp
    
    int search_count = productProc.search_count(hashMap); // 검색된 레코드 갯수
    mav.addObject("search_count", search_count);

    mav.setViewName("/product/list"); // 카테고리 그룹별 목록

    return mav;
  } */
  
  // http://localhost:9090/team4/product/read.do?productno=1
  @RequestMapping(value = "/product/read.do", method = RequestMethod.GET)
  public ModelAndView read(int productno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = productProc.increaseCnt(productno);
    mav.addObject("cnt",cnt);

    ProductVO productVO = productProc.read(productno);
    mav.addObject("productVO", productVO);

    Product_categrpVO product_categrpVO = product_categrpProc.read(productVO.getProductcateno());
    mav.addObject("product_categrpVO", product_categrpVO);
    
    List<Product_imageVO> product_image = product_imageProc.list_by_productno(productno);
    mav.addObject("product_image" ,product_image);
    
    mav.setViewName("/product/read");

    return mav;
  } 
  
 //http://localhost:9090/team4/product/update.do?memberno=1&categrpno=1
  @RequestMapping(value = "/product/update.do", method = RequestMethod.GET)
  public ModelAndView update(int productcateno, int productno) {
    ModelAndView mav = new ModelAndView();

    Product_categrpVO product_categrpVO = product_categrpProc.read(productcateno);
    mav.addObject("product_categrpVO", product_categrpVO);

    ProductVO productVO = productProc.read(productno);
    mav.addObject("productVO", productVO);

    mav.setViewName("/product/update"); // /webapp/product/update.jsp

    return mav;
  }
  
  @RequestMapping(value = "/product/update.do", method = RequestMethod.POST)
  public ModelAndView update(RedirectAttributes ra, ProductVO productVO) {
    ModelAndView mav = new ModelAndView();

    int count = productProc.update(productVO);

    ra.addAttribute("count", count);
    ra.addAttribute("productcateno", productVO.getProductcateno());
    ra.addAttribute("productno", productVO.getProductno());

    mav.setViewName("redirect:/product/update_msg.jsp");

    return mav;
  }
  
//http://localhost:9090/team4/product/delete.do?productcateno=1&productno=1
  @RequestMapping(value = "/product/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int productcateno, int productno) {
    ModelAndView mav = new ModelAndView();

    Product_categrpVO product_categrpVO = product_categrpProc.read(productcateno);
    mav.addObject("product_categrpVO", product_categrpVO);

    ProductVO productVO = productProc.read(productno);
    mav.addObject("productVO", productVO);

    /*// FK productno 컬럼 값이 사용된 레코드 갯수 산출: id="count_by_productno"
    int count_by_productno = attachfileProc.count_by_productno(productno);
    mav.addObject("count_by_productno", count_by_productno);*/

    mav.setViewName("/product/delete"); // /webapp/contents/delete.jsp

    return mav;
  }

  @RequestMapping(value = "/product/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(HttpSession session, RedirectAttributes ra, int productcateno, int productno, int nowPage) {
    ModelAndView mav = new ModelAndView();

    int membersno = (Integer) session.getAttribute("membersno");
    // 현재 로그인한 사용자와 글 등록자가 같은지 검사
    if (membersno == productProc.read(productno).getMembersno()) {
      int count = productProc.delete(productno);
      if (count == 1) {
        product_categrpProc.decreaseCnt(productcateno);
      }

      ra.addAttribute("count", count);
      ra.addAttribute("productcateno", productcateno);
      ra.addAttribute("productno", productno);
      ra.addAttribute("nowPage", nowPage);

      mav.setViewName("redirect:/product/delete_msg.jsp");
    } else {
      ra.addAttribute("productcateno", productcateno);
      mav.setViewName("redirect:/product/auth_fail_msg.jsp");
    }

    return mav;
  }
  
  /**
   * FK 컬럼값을 이용한 레코드 삭제 처리
   * @param ra
   * @param productcateno
   * @return
   */
  @RequestMapping(value = "/product/delete_by_productcateno.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete_by_productcateno(RedirectAttributes ra,
                                            int productcateno) {
    ModelAndView mav = new ModelAndView();

    int count = productProc.delete_by_productcateno(productcateno);
    if (count > 0) { // FK 컬럼 관련 글이 정상적으로 삭제되었다면 cnt 컬럼 0으로변경
      product_categrpProc.cnt_zero(productcateno);
    }

    ra.addAttribute("count", count); // 삭제된 레코드 갯수
    ra.addAttribute("productcateno", productcateno);
    
    mav.setViewName("redirect:/product/delete_by_categrpno_msg.jsp");

    return mav;
  }
  
  /**
   * 첨부 파일 1건 삭제 폼
   * 
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/product/file_delete.do", 
                             method = RequestMethod.GET)
  public ModelAndView file_delete(int productno) {
    ModelAndView mav = new ModelAndView();

    ProductVO productVO = productProc.read(productno);
    mav.addObject("productVO", productVO);

    Product_categrpVO product_categrpVO = product_categrpProc.read(productVO.getProductcateno());
    mav.addObject("product_categrpVO", product_categrpVO);
    
    List<Product_imageVO> product_image = product_imageProc.list_by_productno(productno);
    mav.addObject("product_image", product_image);
    
    mav.setViewName("/product/file_delete"); // file_delete.jsp

    return mav;
  }
  
  /**
   * 첨부 파일 1건 삭제 처리
   * 
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/product/file_delete_proc.do", 
                             method = RequestMethod.GET)
  public ModelAndView file_delete_proc(int productno, int productimgno) {
    ModelAndView mav = new ModelAndView();

    ProductVO productVO = productProc.read(productno);
    mav.addObject("productVO", productVO);

    Product_categrpVO product_categrpVO = product_categrpProc.read(productVO.getProductcateno());
    mav.addObject("product_categrpVO", product_categrpVO);

    // 1건의 파일 삭제
    product_imageProc.delete(productimgno);
    
    List<Product_imageVO> product_image = product_imageProc.list_by_productno(productno);
    mav.addObject("product_image", product_image);
    
    mav.setViewName("/product/file_delete"); // file_delete.jsp

    return mav;
  }
  
  /**
   * http://localhost:9090/ojt/contents/reply_delete.do?replyno=1&passwd=1234
   * {"delete_count":0,"count":0}
   * {"delete_count":1,"count":1}
   * @param replyno
   * @param passwd
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/product/reply_delete.do", 
                              method = RequestMethod.POST,
                              produces = "text/plain;charset=UTF-8")
  public String reply_delete(int replyno, String passwd) {
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("replyno", replyno);
    map.put("passwd", passwd);
    
    int count = replyProc.checkPasswd(map); // 패스워드 검사
    int delete_count = 0;
    if (count == 1) {
      delete_count = replyProc.delete(replyno); // 댓글 삭제
    }
    
    JSONObject obj = new JSONObject();
    obj.put("count", count);
    obj.put("delete_count", delete_count);
    
    return obj.toString();
  }
  
  @RequestMapping(value = "/product/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all_search_paging(
      @RequestParam(value="productcateno", defaultValue="1") int productcateno, // 기본값
      @RequestParam(value="word", defaultValue="") String word,           // 기본값
      @RequestParam(value="nowPage", defaultValue="1") int nowPage    // 기본값
      ) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/product/list_all"); // /webapp/product/list_all.jsp
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("productcateno", productcateno); // #{productcateno}
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage);  
    
    List<Product_imageProductVO> list = productProc.list_all_search_paging(map); // 목록을 만들어서
    mav.addObject("list", list); // 리턴해줌
    
    // 검색된 레코드 갯수
    int search_count = productProc.search_count(map);
    mav.addObject("search_count", search_count);
    
    Product_categrpVO product_categrpVO = product_categrpProc.read(productcateno);
    mav.addObject("product_categrpVO", product_categrpVO);
  
    String paging = productProc.pagingBox("list_all.do", productcateno, search_count, nowPage, word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);

    return mav;
  }
  
  /**
   * 목록 + 검색 + 페이징 지원
   * http://localhost:9090/ojt/product/list.do
   * http://localhost:9090/ojt/product/list.do?categrpno=1&word=&nowPage=1
   * @param productcateno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/product/list.do", 
                                       method = RequestMethod.GET)
  public ModelAndView list_by_productno_search_paging(
      @RequestParam(value="productcateno", defaultValue="1") int productcateno, // 기본값
      @RequestParam(value="word", defaultValue="") String word,           // 기본값
      @RequestParam(value="nowPage", defaultValue="1") int nowPage   // 기본값
      ) { 
    
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/product/list");   
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("productcateno", productcateno); // #{productcateno}
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage);       
    
    // 검색 목록
    
    List<Product_imageProductVO> list = productProc.list_by_productno_search_paging(map); // 목록을 만들어서
    mav.addObject("list", list); // 리턴해줌
    
    // 검색된 레코드 갯수
    int search_count = productProc.search_count(map);
    mav.addObject("search_count", search_count);
    
    Product_categrpVO product_categrpVO = product_categrpProc.read(productcateno);
    mav.addObject("product_categrpVO", product_categrpVO);
  
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
    String paging = productProc.pagingBox("list.do", productcateno, search_count, nowPage, word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);
    
    return mav;
  }
  
  
  
  
  
  
  
}





