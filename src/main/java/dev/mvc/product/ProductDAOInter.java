package dev.mvc.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dev.mvc.reply.ReplyMemberVO;

public interface ProductDAOInter {
  
  /**
   * ��ǰ ���
   * @param productVO
   * @return ��ϵ� ���ڵ� ����
   */
  public int create(ProductVO productVO);

  /**
   * productcateno�� ��ü ���
   * @return
   */
  public List<ProductVO> list_by_productcateno(int productcateno);

  public List<Product_imageProductVO> list_by_product_image_join(int productno);
  
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
  
  public int increaseRecom(int productno);
  
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
  
  /**
   * ��ǰ ��ü ���
   * @return
   */
  public ArrayList<Product_imageProductVO> list_all_search_paging(HashMap<String, Object> map);
  
  /**
   * �˻� + ����¡ ���
   * @param map
   * @return
   */
  public ArrayList<Product_imageProductVO> list_by_productno_search_paging(HashMap<String, Object> map);
  
  
}







