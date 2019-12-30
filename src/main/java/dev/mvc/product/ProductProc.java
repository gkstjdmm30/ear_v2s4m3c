package dev.mvc.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.product.ProductProc")
public class ProductProc implements ProductProcInter {
  @Autowired
  private ProductDAOInter productDAO;

  @Override
  public int create(ProductVO productVO) {
    int count = productDAO.create(productVO);
    return count;
  }

  @Override
  public List<ProductVO> list_all() {
    List<ProductVO> list = productDAO.list_all();
    return list;
  }

  @Override
  public List<ProductVO> list_by_productcateno(int productcateno) {
    List<ProductVO> list = productDAO.list_by_productcateno(productcateno);
    return list;
  }

  @Override
  public int total_count() {
    int count = productDAO.total_count();
    return count;
  }

  @Override
  public ProductVO read(int productno) {
    ProductVO productVO = productDAO.read(productno);
    return productVO;
  }

  @Override
  public int update(ProductVO productVO) {
    int count = productDAO.update(productVO);
    return count;
  }

  @Override
  public int delete(int productno) {
    int count = productDAO.delete(productno);
    return count;
  }

  @Override
  public int count_by_productcateno(int productcateno) {
    int count = productDAO.count_by_productcateno(productcateno);
    return count;
  }

  @Override
  public int delete_by_productcateno(int productcateno) {
    int count = productDAO.delete_by_productcateno(productcateno);
    return count;
  } 
  

}



