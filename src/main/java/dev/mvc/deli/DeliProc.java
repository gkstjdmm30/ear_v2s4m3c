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
  public DeliVO deli_read(int delino) {
    DeliVO read = deliDAO.deli_read(delino);
    return read;
  }

  @Override
  public int deli_update(DeliVO deliVO) {
    int count = deliDAO.deli_update(deliVO);
    return count;
  }


  @Override
  public List<DeliVO> deli_name() {
    List<DeliVO> name = deliDAO.deli_name();
    return name;
  }

  @Override
  public DeliVO deli_read_orderno(int orderno) {
    DeliVO read_orderno = deliDAO.deli_read_orderno(orderno);
    return read_orderno;
  }

  @Override
  public int deli_read_cnt(int orderno) {
    int count = deliDAO.deli_read_cnt(orderno);
    return count;
  }

  @Override
  public List<Deli_listVO> deli_list() {
    List<Deli_listVO> list = deliDAO.deli_list();
    return list;
  }

  @Override
  public String deli_thumb(int orderno) {
    String thumb = deliDAO.deli_thumb(orderno);
    return thumb;
  }

}
