package dev.mvc.deli;

import java.util.List;

public interface DeliProcInter {
  public int deli_insert(DeliVO deliVO);
  public List<DeliVO> deli_select();
  public DeliVO deli_read(int delino);
  public DeliVO deli_read_orderno(int orderno);
  public int deli_update(DeliVO deliVO);
  public List<DeliVO> deli_name();

}
