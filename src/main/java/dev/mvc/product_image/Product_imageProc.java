package dev.mvc.product_image;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// 빈의 이름 지정
@Component("dev.mvc.product_image.Product_imageProc")
public class Product_imageProc implements Product_imageProcInter {
  @Autowired
  private Product_imageDAOInter product_imageDAO; 
  
  @Override
  public int create(Product_imageVO product_imageVO) {
    int count = product_imageDAO.create(product_imageVO);
    return count;
  }

  @Override
  public List<Product_imageVO> list() {
    List<Product_imageVO> list = product_imageDAO.list();
    return list;
  }

  @Override
  public List<Product_imageVO> list_by_productno(int productno) {
    List<Product_imageVO> list = product_imageDAO.list_by_productno(productno);
    return list;
  }

  @Override
  public int delete(int productimgno) {
    int count = product_imageDAO.delete(productimgno);
    return count;
  }

  @Override
  public int count_by_productno(int productno) {
    int count = product_imageDAO.count_by_productno(productno);
    return count;
  }

  @Override
  public int delete_by_productno(int productno) {
    int count = product_imageDAO.delete_by_productno(productno);
    return count;
  }

}




