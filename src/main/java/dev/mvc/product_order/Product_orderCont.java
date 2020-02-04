package dev.mvc.product_order;
import dev.mvc.members.MembersProcInter;
import dev.mvc.members.MembersVO;
import dev.mvc.product.ProductProcInter;
import dev.mvc.product.ProductVO;
import dev.mvc.product_image.Product_imageProcInter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class Product_orderCont {
  @Autowired
  @Qualifier("dev.mvc.product_order.Product_orderProc")
  private Product_orderProcInter orderProc;
  
  @Autowired
  @Qualifier("dev.mvc.product.ProductProc")
  private ProductProcInter productProc;
  
  @Autowired
  @Qualifier("dev.mvc.product_image.Product_imageProc")
  private Product_imageProcInter product_imageProc;
  
  @Autowired
  @Qualifier("dev.mvc.members.MembersProc") // 이름 지정
  private MembersProcInter membersProc;
  
  public Product_orderCont() {
    
  }

  // http://localhost:9090/ear/product_order/product_order_create.do?membersno=1&productno=1
  @RequestMapping(value="/product_order/product_order_create.do", method = RequestMethod.GET)
  public ModelAndView product_order_create(int membersno, int productno) {
    ModelAndView mav = new ModelAndView();
    
    MembersVO membersVO = membersProc.mem_read(membersno);
    ProductVO productVO = productProc.read(productno);
    
    System.out.println("id :" + membersVO.getId());
    System.out.println("id :" + productVO.getName());
    
    mav.addObject("membersVO", membersVO);
    mav.addObject("productVO", productVO);
    
    mav.setViewName("/product_order/create");
    return mav;
  }
  
  
  @RequestMapping(value="/product_order/product_order_create.do", method = RequestMethod.POST)
  public ModelAndView product_order_create(Product_orderVO orderVO) {
    ModelAndView mav = new ModelAndView();
    int count = orderProc.product_order_create(orderVO);
    
    if(count == 1) {
      mav.setViewName("redirect:/product_order/read_membersno.jsp?membersno=" + orderVO.getMembersno());
    } else {
      mav.setViewName("redirect:/product_order/create_msg.jsp?count=" + count);
    }
    return mav;
    
  } 
  
//  @RequestMapping(value="/product_order/product_order_select.do", method=RequestMethod.GET)
//  public List<Product_orderVO> product_order_select() {
//    ModelAndView mav = new ModelAndView();
//    List<orderVO> select = orderProc.product_order_select();
//    mav.addObject("list", list);
//    return mav;
//  }
//  
//  
//  @RequestMapping(value="/product_order/product_order_read_orderno.do")
//  @RequestMapping(value="/product_order/product_order_read_membersno.do")
//  @RequestMapping(value="/product_order/product_order_update.do")
//  @RequestMapping(value="/product_order/product_order_delete.do")
//  
//  
  
}
