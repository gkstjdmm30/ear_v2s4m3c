package dev.mvc.product_categrp;

import java.util.List;


// MyBATIS�� <mapper namespace="dev.mvc.categrp.CategrpDAOInter">�� ���� 
public interface Product_categrpDAOInter {
  /**
   * ���
   * 
   * @param product_categrpVO
   * @return ��ϵ� ���ڵ� ����
   */
  public int create(Product_categrpVO product_categrpVO);
  
  /**
   * ���
   * @return
   */
  public List<Product_categrpVO> list();
  
  /**
   * ��ȸ
   * @param productcateno
   * @return
   */
  public Product_categrpVO read(int productcateno);
  
  /**
   * ���� ó��
   * @param product_categrpVO
   * @return ó���� ���ڵ� ����
   */
  public int update(Product_categrpVO product_categrpVO);
  
  /**
   * ���� ó��
   * @param productcateno
   * @return ó���� ���ڵ� ����
   */
  public int delete(int productcateno);
  
  /**
   * �׷쿡 ���� ��ǰ �� ����
   * @param productcateno
   * @return
   */
  public int increaseCnt(int productcateno);
  
  /**
   * �׷쿡 ���� ��ǰ �� ����
   * <update id="decreaseCnt" parameterType="int">
   * @param productcateno
   * @return
   */
  public int decreaseCnt(int productcateno);
  

  
}






