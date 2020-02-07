package dev.mvc.deli;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.deli.DeliProc")
public class DeliProc implements DeliProcInter{
  @Autowired
  private DeliDAOInter deliDAO;

  @Override
  public int deli_insert(DeliVO deliVO) {
    int count = deliDAO.deli_insert(deliVO);
    return count;
  }

  @Override
  public List<DeliVO> deli_select() {
    List<DeliVO> list = deliDAO.deli_select();
    return list;
  }

  @Override
  public DeliVO deli_read(int orderno) {
    DeliVO read = deliDAO.deli_read(orderno);
    return read;
  }

  @Override
  public int deli_update(DeliVO deliVO) {
    int count = deliDAO.deli_update(deliVO);
    return count;
  }

  @Override
  public int deli_delete(int orderno) {
    int count = deliDAO.deli_delete(orderno);
    return count;
  }

}
