package dev.mvc.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    // mav.setViewName("/contents/create"); // /webapp/contents/create.jsp
    // redirect: form에서 보낸 데이터 모두 삭제됨, 새로고침 중복 등록 방지용.
    
    ra.addAttribute("count", count); // redirect parameter 적용
    ra.addAttribute("categrpno", productVO.getProductcateno());
    
    mav.setViewName("redirect:/product/create_msg.jsp");

    return mav;
  }
  
  
  
  
  
  
  
  
  
  
  
  
  

  
  
}





