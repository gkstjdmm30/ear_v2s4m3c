package dev.mvc.product_order;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.members.MembersProcInter;
import dev.mvc.members.MembersVO;
import dev.mvc.product.ProductProcInter;
import dev.mvc.product.ProductVO;
import dev.mvc.product_image.Product_imageProcInter;


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
//    Product_imageVO imageVO = product_imageProc.read(productno);
    
    mav.addObject("membersVO", membersVO);
    mav.addObject("productVO", productVO);
//    mav.addObject("product_imageVO", imageVO);
    
    mav.setViewName("/product_order/create");
    return mav;
  }
  
  
  @RequestMapping(value="/product_order/product_order_create.do", method = RequestMethod.POST)
  public ModelAndView product_order_create(Product_orderVO orderVO, int membersno, int productno, String tel) {
    ModelAndView mav = new ModelAndView();
    orderVO.setMembersno(membersno);
    orderVO.setProductno(productno);
    orderVO.setTel(tel);
    
    MembersVO membersVO = membersProc.mem_read(membersno);
    ProductVO productVO = productProc.read(productno);
    System.out.println("membersVO : " + membersVO.getMembersno());
    System.out.println("productno : " + productVO.getProductno());
    
    System.out.println("orderno : " + orderVO.getOrderno());
    System.out.println("membersno : " + orderVO.getMembersno());
    System.out.println("productno : " + orderVO.getProductno());
    System.out.println("count : " + orderVO.getCount());
    System.out.println("price : " + orderVO.getPrice());
    System.out.println("shippding : " + orderVO.getShipping());
    System.out.println("total : " + orderVO.getTotalprice());
    System.out.println("how : " + orderVO.getHoworder());
    System.out.println("tel : " + orderVO.getTel());
    System.out.println("zipcode : " + orderVO.getZipcode());
    System.out.println("address1 : " + orderVO.getAddress1());
    System.out.println("address2 : " + orderVO.getAddress2());
    int count = orderProc.product_order_create(orderVO);
//    
//    if(count == 1) {
//      mav.setViewName("redirect:/product_order/read_membersno.jsp?membersno=" + orderVO.getMembersno());
//    } else {
//      mav.setViewName("redirect:/product_order/create_msg.jsp?count=" + count);
//    }
    return mav;
    
  } 
  
  @RequestMapping(value="/product_order/product_order_select.do", method=RequestMethod.GET)
  public ModelAndView product_order_select() {
    ModelAndView mav = new ModelAndView();
    List<Product_orderVO> list = orderProc.product_order_select();
    mav.addObject("list", list);
    mav.setViewName("/product_order/list");
    return mav;
  }
  

  @RequestMapping(value="/product_order/product_order_read.do", method=RequestMethod.GET)
  public ModelAndView product_order_read(int orderno, int membersno, int productno) {
    ModelAndView mav = new ModelAndView();
    MembersVO membersVO = membersProc.mem_read(membersno);
    ProductVO productVO = productProc.read(productno);
//    Product_imageVO imageVO = product_imageProc.read(productno);
    
    mav.addObject("membersVO", membersVO);
    mav.addObject("productVO", productVO);
//    mav.addObject("product_imageVO", imageVO);
    Product_orderVO list = orderProc.product_order_read_orderno(orderno);
    mav.addObject("list", list);
    mav.setViewName("/product_order/read_orderno");
    return mav;
  }
//  @RequestMapping(value="/product_order/product_order_read_membersno.do")
//  @RequestMapping(value="/product_order/product_order_update.do")
//  @RequestMapping(value="/product_order/product_order_delete.do")
//  
//  
  
}
