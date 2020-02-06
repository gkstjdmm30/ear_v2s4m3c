package dev.mvc.deli;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.deli.DeliProc")
public class DeliProc implements DeliProcInter{
  @Autowired
  private DeliDAOInter deliDAO;

}
