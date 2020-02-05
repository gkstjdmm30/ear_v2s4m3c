package dev.mvc.product_image;

import java.util.List;

public interface Product_imageDAOInter {

  public int create(Product_imageVO product_imageVO);
  
  public List<Product_imageVO> list();
  
  public List<Product_imageVO> list_by_productno(int productno);
  
  public int delete(int productimgno); 
  
  public int count_by_productno(int productno);
  
  public int delete_by_productno(int productno);
  
}






