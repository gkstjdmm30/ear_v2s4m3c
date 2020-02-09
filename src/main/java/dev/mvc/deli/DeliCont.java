package dev.mvc.deli;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.product_order.Product_orderProcInter;
import dev.mvc.product_order.Product_orderVO;

@Controller
public class DeliCont {
  @Autowired
  @Qualifier("dev.mvc.deli.DeliProc")
  private DeliProcInter deliProc;
  
  @Autowired
  @Qualifier("dev.mvc.product_order.Product_orderProc")
  private Product_orderProcInter orderProc;

  public DeliCont() {           
  }
  
  @RequestMapping(value="deli/deli_insert.do", method=RequestMethod.GET)
  public ModelAndView deli_insert(DeliVO deliVO) {
    ModelAndView mav = new ModelAndView();
    
    return mav;
  }
  
  
  @RequestMapping(value="/deli/deli_select.do", method=RequestMethod.GET)
  public ModelAndView deli_select() {
    ModelAndView mav = new ModelAndView();
    List<DeliVO> list = deliProc.deli_select();
    List<Product_orderVO> orderVO = orderProc.product_order_select();
    List<DeliVO> name = deliProc.deli_name();
    
    mav.addObject("list", list);
    mav.addObject("orderVO", orderVO);
    mav.addObject("name", name);
    
    mav.setViewName("/deli/list");
    return mav;
  }

  @RequestMapping(value="deli/deli_read.do", method=RequestMethod.GET)
  public ModelAndView deli_read(int orderno) {
    ModelAndView mav = new ModelAndView();
    
    if(deliProc.deli_read_cnt(orderno) == 0) {
      DeliVO deliVO = new DeliVO();
      deliVO.setOrderno(orderno);
      deliProc.deli_insert(deliVO);
    }
    
    
    DeliVO read = deliProc.deli_read_orderno(orderno);
    mav.addObject("deliVO", read);
    mav.setViewName("/deli/read");
    return mav;
  }
  
  @RequestMapping(value="/deli/deli_update.do", method=RequestMethod.GET)
  public ModelAndView deli_update(int delino) {
    ModelAndView mav = new ModelAndView();
    DeliVO read = deliProc.deli_read(delino);
    mav.addObject("deliVO", read);
    mav.setViewName("/deli/update");
    return mav;
  }
  
  @RequestMapping(value="/deli/deli_update.do", method=RequestMethod.POST)
  public ModelAndView deli_update(DeliVO deliVO) {
    ModelAndView mav = new ModelAndView();
    deliProc.deli_update(deliVO);
    mav.setViewName("redirect:/deli/deli_select.do");
    return mav;
  }

}
