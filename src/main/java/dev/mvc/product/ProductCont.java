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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.product_categrp.Product_categrpProcInter;
import dev.mvc.product_categrp.Product_categrpVO;

@Controller
public class ProductCont {
  @Autowired
  @Qualifier("dev.mvc.product.ProductProc")
  private ProductProcInter productProc;
  
  @Autowired
  @Qualifier("dev.mvc.product_categrp.Product_categrpProc")
  private Product_categrpProcInter product_categrpProc;
  
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
                                           ProductVO productVO) {
    ModelAndView mav = new ModelAndView();

    int count = productProc.create(productVO);

    if (count == 1) {
      product_categrpProc.increaseCnt(productVO.getProductcateno()); // 카테고리 글수 증가
    }
    // mav.setViewName("/contents/create"); // /webapp/product/create.jsp
    // redirect: form에서 보낸 데이터 모두 삭제됨, 새로고침 중복 등록 방지용.
    
    ra.addAttribute("count", count); // redirect parameter 적용
    ra.addAttribute("categrpno", productVO.getProductcateno());
    
    mav.setViewName("redirect:/product/create_msg.jsp");

    return mav;
  }
  
  @RequestMapping(value = "/product/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all() {
    ModelAndView mav = new ModelAndView();

    List<ProductVO> list = productProc.list_all();
    mav.addObject("list", list);
    mav.setViewName("/product/list_all"); // /webapp/product/list_all.jsp

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
  
  @RequestMapping(value = "/product/list.do", method = RequestMethod.GET)
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
  } 
  
  // http://localhost:9090/team4/product/read.do?productno=1
  @RequestMapping(value = "/product/read.do", method = RequestMethod.GET)
  public ModelAndView read(int productno) {
    ModelAndView mav = new ModelAndView();

    ProductVO productVO = productProc.read(productno);
    mav.addObject("productVO", productVO);

    Product_categrpVO product_categrpVO = product_categrpProc.read(productVO.getProductcateno());
    mav.addObject("product_categrpVO", product_categrpVO);
    
    /*List<AttachfileVO> attachfile_list = attachfileProc.list_by_contentsno(contentsno);
    mav.addObject("attachfile_list", attachfile_list);*/
    
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

  /*@RequestMapping(value = "/product/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(HttpSession session, RedirectAttributes ra, int productcateno, int productno) {
    ModelAndView mav = new ModelAndView();

    int memberno = (Integer) session.getAttribute("memberno");
    // 현재 로그인한 사용자와 글 등록자가 같은지 검사
    if (memberno == productProc.read(productno).getMemberno()) {
      int count = productProc.delete(productno);
      if (count == 1) {
        product_categrpProc.decreaseCnt(productcateno);
      }

      ra.addAttribute("count", count);
      ra.addAttribute("productcateno", productcateno);
      ra.addAttribute("productno", productno);

      mav.setViewName("redirect:/product/delete_msg.jsp");
    } else {
      ra.addAttribute("productcateno", productcateno);
      mav.setViewName("redirect:/product/auth_fail_msg.jsp");
    }

    return mav;
  }*/
  
  /*@ResponseBody
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
  }*/
  
  
  
  
  
  
}





