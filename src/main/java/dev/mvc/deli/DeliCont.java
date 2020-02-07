package dev.mvc.deli;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DeliCont {
  @Autowired
  @Qualifier("dev.mvc.deli.DeliProc")
  private DeliProcInter deliProc;
  public DeliCont() {           
  }
  @RequestMapping(value="/deli/deli_select.do", method=RequestMethod.GET)
  public ModelAndView deli_select() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/deli/list");
    return mav;
  }
  
}
