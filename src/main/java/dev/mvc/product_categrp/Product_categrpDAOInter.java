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
   * seqno �������� ��� ���
   * @return
   */
  public List<Product_categrpVO> list_seqno_asc();
  
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
   * �켱���� ���� up 10 �� 1
   * @param categrpno
   * @return
   */
  public int update_seqno_up(int productcateno);
  
  /**
   * �켱���� ���� down 1 �� 10
   * @param categrpno
   * @return
   */
  public int update_seqno_down(int productcateno);
  
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
  
  /**
   * cnt �÷� 0���� �ʱ�ȭ
   * <xmp>
   * <update id="cnt_zero" parameterType="int"> 
   * </xmp>
   * @param productcateno
   * @return
   */
  public int cnt_zero(int productcateno);
  

  
}







