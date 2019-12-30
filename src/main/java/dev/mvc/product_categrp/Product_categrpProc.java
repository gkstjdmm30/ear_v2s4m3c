package dev.mvc.product_categrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// ���� �̸� ����
@Component("dev.mvc.product_categrp.Product_categrpProc")
public class Product_categrpProc implements Product_categrpProcInter {
  // CategrpDAOInter�� MyBATIS�� ȣ���ϴ� �ڵ尡 �ڵ�������.
  // �ڵ� ������ Ŭ������ ��ü�� �ڵ� �Ҵ��.
  @Autowired
  private Product_categrpDAOInter product_categrpDAO; 
  
  @Override
  public int create(Product_categrpVO product_categrpVO) {
    int count = product_categrpDAO.create(product_categrpVO);
    return count;
  }
  
  @Override
  public List<Product_categrpVO> list() {
    List<Product_categrpVO> list = product_categrpDAO.list();
    return list;
  }

  @Override
  public Product_categrpVO read(int productcateno) {
    Product_categrpVO product_categrpVO = product_categrpDAO.read(productcateno);
    return product_categrpVO;
  }

  @Override
  public int update(Product_categrpVO product_categrpVO) {
    int count = product_categrpDAO.update(product_categrpVO);
    return count;
  }

  @Override
  public int delete(int productcateno) {
    int count = product_categrpDAO.delete(productcateno);
    return count;
  }

  @Override
  public int increaseCnt(int productcateno) {
    int count = product_categrpDAO.increaseCnt(productcateno);
    return count;
  }

  @Override
  public int decreaseCnt(int productcateno) {
    int count = product_categrpDAO.decreaseCnt(productcateno);
    return count;
  }

}



