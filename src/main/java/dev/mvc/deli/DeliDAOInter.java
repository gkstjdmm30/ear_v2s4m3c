package dev.mvc.deli;

import java.util.List;

public interface DeliDAOInter {
  public int deli_insert(DeliVO deliVO);
  public List<DeliVO> deli_select();
  public DeliVO deli_read(int orderno);
  public int deli_update(DeliVO deliVO);
  public int deli_delete(int orderno);
}
