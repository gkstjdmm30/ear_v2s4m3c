package dev.mvc.product_categrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Product_categrpCont {
  @Autowired
  @Qualifier("dev.mvc.product_categrp.Product_categrpProc")
  private Product_categrpProcInter product_categrpProc;
  
  public Product_categrpCont() {
    System.out.println("--> Product_categrpCont created.");
  }
  
  // 등록폼
  //http://localhost:9090/team4/product_categrp/create.do
 @RequestMapping(value = "/product_categrp/create.do", method = RequestMethod.GET)
 public ModelAndView create() {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/product_categrp/create"); // /webapp/product_categrp/create.jsp
   
   return mav;
 }
 
 // 등록 처리
 @RequestMapping(value="/product_categrp/create.do", method=RequestMethod.POST)
 public ModelAndView create(Product_categrpVO product_categrpVO) {
   ModelAndView mav = new ModelAndView();
   
   int count = product_categrpProc.create(product_categrpVO);
   
   if (count == 0) {
     mav.setViewName("redirect:/product_categrp/create_msg.jsp?count=" + count);
   } else {
     mav.setViewName("redirect:/product_categrp/list.do"); // list.jsp X
   }
       
   return mav;
 }
  
 // 목록
  //  http://localhost:9090/ear/product_categrp/list.do
  @RequestMapping(value="/product_categrp/list.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<Product_categrpVO> list = product_categrpProc.list();
    
    mav.addObject("list", list);
    mav.setViewName("/product_categrp/list"); // /webapp/product_categrp/list.jsp
        
    return mav;
  }
  
//수정폼 + 조회
 @RequestMapping(value="/product_categrp/update.do", method=RequestMethod.GET)
 public ModelAndView update(int productcateno) {
   ModelAndView mav = new ModelAndView();
   
   Product_categrpVO product_categrpVO = product_categrpProc.read(productcateno);   
   
   mav.addObject("product_categrpVO", product_categrpVO);
   mav.setViewName("/product_categrp/update"); // /webapp/product_categrp/update.jsp

   // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);
       
   return mav;
 }

 // 수정 처리
 @RequestMapping(value="/product_categrp/update.do", method=RequestMethod.POST)
 public ModelAndView update_proc(Product_categrpVO product_categrpVO) {
   ModelAndView mav = new ModelAndView();
   
   int count = product_categrpProc.update(product_categrpVO);
   String url = "redirect:/product_categrp/update_msg.jsp?count=" + count +
                     "&productcateno=" + product_categrpVO.getProductcateno();
   mav.setViewName(url);
                              
   return mav;
 }
 
 // 삭제폼
 @RequestMapping(value="/product_categrp/delete.do", method=RequestMethod.GET)
 public ModelAndView delete(int productcateno) {
   ModelAndView mav = new ModelAndView();
   
   Product_categrpVO product_categrpVO = product_categrpProc.read(productcateno);
   
   mav.addObject("product_categrpVO", product_categrpVO);
   mav.setViewName("/product_categrp/delete"); // /webapp/product_categrp/delete.jsp
       
   return mav;
 }
 
 // 삭제 처리
 @RequestMapping(value="/product_categrp/delete.do", method=RequestMethod.POST)
 public ModelAndView delete_proc(int productcateno) {
   ModelAndView mav = new ModelAndView();
   
   int count = product_categrpProc.delete(productcateno);
   String url = "redirect:/product_categrp/delete_msg.jsp?count=" + count +
                     "&productcateno=" + productcateno;
   mav.setViewName(url);
                              
   return mav;
 }
 
  // 왼쪽 메뉴
  @RequestMapping(value = "/product_categrp/list_index_left.do", method = RequestMethod.GET)
  public ModelAndView list_index_left() {
    ModelAndView mav = new ModelAndView();

    List<Product_categrpVO> list = product_categrpProc.list();
    mav.addObject("list", list);

    //int total_count = product_contentsProc.total_count();
    //mav.addObject("total_count", total_count);

    mav.setViewName("/product_categrp/list_index_left"); // /webapp/categrp/list_index_left.jsp

    return mav;
  }
  
  
  

  
  
}





