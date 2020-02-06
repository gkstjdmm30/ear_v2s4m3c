package dev.mvc.deli;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller
public class DeliCont {
  @Autowired
  @Qualifier("dev.mvc.deli.DeliProc")
  private DeliProcInter deliProc;
  public DeliCont() {
    
  }
  
}
