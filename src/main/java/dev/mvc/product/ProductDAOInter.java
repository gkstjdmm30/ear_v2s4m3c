package dev.mvc.product;

import java.util.HashMap;
import java.util.List;

public interface ProductDAOInter {
  
  /**
   * ��ǰ ���
   * @param productVO
   * @return ��ϵ� ���ڵ� ����
   */
  public int create(ProductVO productVO);

  /**
   * ��ǰ ��ü ���
   * @return
   */
  public List<ProductVO> list_all();

  /**
   * productcateno�� ��ü ���
   * @return
   */
  public List<ProductVO> list_by_productcateno(int productcateno);

  /**
   * ��ü ��� ���ڵ� ���� 
   * @return ��ü ��� ���ڵ� ����
   */
  public int total_count();
    
  /**
   * ��ȸ
   * @param productno
   * @return
   */
  public ProductVO read(int productno);
  
  /**
   * ����
   * @param productVO
   * @return ������ ���ڵ� ����
   */
  public int update(ProductVO productVO);
  
  /**
   * �Ѱ� ����
   * @param productno
   * @return
   */
  public int delete(int productno);

  /**
   * �θ� ī�װ� ��ȣ�� ���ڵ� ����
   * @param productcateno
   * @return
   */
  public int count_by_productcateno(int productcateno);
  
  /**
   * �θ� ī�װ� ��ȣ�� ���ڵ� ����
   * @param productcateno
   * @return
   */
  public int delete_by_productcateno(int productcateno);
  
  public int increaseReplycnt(int productno);
  
  public int decreaseReplycnt(int productno);

  /**
   * �˻� ���
   * @param hashMap
   * @return
   */
  public List<ProductVO> list_by_search(HashMap<String, Object> hashMap);
  
  /**
   * ī�װ��� �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
}







