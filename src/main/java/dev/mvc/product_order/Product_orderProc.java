package dev.mvc.product_order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.product_order.Product_orderProc")
public class Product_orderProc implements Product_orderProcInter{
  @Autowired
  private Product_orderDAOInter orderDAO;

  @Override
  public int product_order_create(Product_orderVO orderVO) {
    int count = orderDAO.product_order_create(orderVO);
    return count;
  }

  @Override
  public List<Product_orderVO> product_order_select() {
    List<Product_orderVO> product_order_select = orderDAO.product_order_select();
    return product_order_select;
  }

  @Override
  public Product_orderVO product_order_read_orderno(int orderno) {
    Product_orderVO product_order_read_orderno = orderDAO.product_order_read_orderno(orderno);
    return product_order_read_orderno;
  }

  @Override
  public List<Product_orderVO> product_order_read_membersno(int membersno) {
    List<Product_orderVO> product_order_read_membersno = orderDAO.product_order_read_membersno(membersno);
    return product_order_read_membersno;
  }

  @Override
  public int product_order_update(int howorder) {
    int count = orderDAO.product_order_update(howorder);
    return count;
  }

  @Override
  public int product_order_delete(int orderno) {
    int count = orderDAO.product_order_delete(orderno);
    return count;
  }

  @Override
  public List<String> name(int membersno) {
    List<String> name = orderDAO.name(membersno);
    return name;
  }



}
