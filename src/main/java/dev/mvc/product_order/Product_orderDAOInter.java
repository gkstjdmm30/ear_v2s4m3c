package dev.mvc.product_order;

import java.util.List;

public interface Product_orderDAOInter {
  public int product_order_create(Product_orderVO orderVO);
  public List<Product_orderVO> product_order_select();
  public Product_orderVO product_order_read_orderno(int orderno);
  public List<Product_orderVO> product_order_read_membersno(int membersno);
  public int product_order_update(int howorder);
  public int product_order_delete(int orderno);
  public List<String> name(int membersno);
}
