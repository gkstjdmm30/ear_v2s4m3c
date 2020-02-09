package dev.mvc.deli;

import java.util.List;

public interface DeliDAOInter {
  public int deli_insert(DeliVO deliVO);
  public List<DeliVO> deli_select();
  public DeliVO deli_read(int delino);
  public DeliVO deli_read_orderno(int orderno);
  public int deli_update(DeliVO deliVO);
  public List<DeliVO> deli_name();
  public int deli_read_cnt(int orderno);
  public List<Deli_listVO> deli_list();
  public String deli_thumb(int orderno);
}
