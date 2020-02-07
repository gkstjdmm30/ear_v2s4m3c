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
import dev.mvc.product_image.Product_imageVO;


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
    List<Product_imageVO> img_list = product_imageProc.list_by_productno(productno);
    
    mav.addObject("membersVO", membersVO);
    mav.addObject("productVO", productVO);
    mav.addObject("img_list", img_list);
    
    mav.setViewName("/product_order/create");
    return mav;
  }
  
  
  @RequestMapping(value="/product_order/product_order_create.do", method = RequestMethod.POST)
  public ModelAndView product_order_create(Product_orderVO orderVO, int membersno, int productno) {
    ModelAndView mav = new ModelAndView();
    orderVO.setMembersno(membersno);
    orderVO.setProductno(productno);
    MembersVO membersVO = membersProc.mem_read(membersno);
    ProductVO productVO = productProc.read(productno);
    List<Product_imageVO> img_list = product_imageProc.list_by_productno(productno);
 
    orderVO.setTel(membersVO.getTel());
    
    int count = orderProc.product_order_create(orderVO);
    mav.addObject("membersVO", membersVO);
    mav.addObject("productVO", productVO);
    mav.addObject("img_list", img_list);
     
    mav.setViewName("redirect:/product_order/create_msg.jsp?count=" + count);

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
  
  // http://localhost:9090/ear/product_order/product_order_read.do?orderno=1&membersno=1&productno=1
  @RequestMapping(value="/product_order/product_order_read.do", method=RequestMethod.GET)
  public ModelAndView product_order_read(int orderno) {
    ModelAndView mav = new ModelAndView();
    Product_orderVO orderVO = orderProc.product_order_read_orderno(orderno);
    
    MembersVO membersVO = membersProc.mem_read(orderVO.getMembersno());
    ProductVO productVO = productProc.read(orderVO.getProductno());
    List<Product_imageVO> img_list = product_imageProc.list_by_productno(orderVO.getProductno());
    
    mav.addObject("membersVO", membersVO);
    mav.addObject("productVO", productVO);
    mav.addObject("orderVO", orderVO);
    mav.addObject("img_list", img_list);
    
    System.out.println("price :" + orderVO.getPrice());
    
    mav.setViewName("/product_order/read_orderno");
    return mav;
  }
//  @RequestMapping(value="/product_order/product_order_read_membersno.do")
//  @RequestMapping(value="/product_order/product_order_update.do")
//  @RequestMapping(value="/product_order/product_order_delete.do")
//  
//  
  
}
