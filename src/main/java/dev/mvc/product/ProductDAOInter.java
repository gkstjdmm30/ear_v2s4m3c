package dev.mvc.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dev.mvc.reply.ReplyMemberVO;

public interface ProductDAOInter {
  
  /**
   * 상품 등록
   * @param productVO
   * @return 등록된 레코드 갯수
   */
  public int create(ProductVO productVO);

  /**
   * productcateno별 전체 목록
   * @return
   */
  public List<ProductVO> list_by_productcateno(int productcateno);

  public List<Product_imageProductVO> list_by_product_image_join(int productno);
  
  /**
   * 전체 등록 레코드 갯수 
   * @return 전체 등록 레코드 갯수
   */
  public int total_count();
    
  /**
   * 조회
   * @param productno
   * @return
   */
  public ProductVO read(int productno);
  
  /**
   * 수정
   * @param productVO
   * @return 수정된 레코드 갯수
   */
  public int update(ProductVO productVO);
  
  /**
   * 한건 삭제
   * @param productno
   * @return
   */
  public int delete(int productno);

  /**
   * 부모 카테고리 번호별 레코드 갯수
   * @param productcateno
   * @return
   */
  public int count_by_productcateno(int productcateno);
  
  /**
   * 부모 카테고리 번호별 레코드 삭제
   * @param productcateno
   * @return
   */
  public int delete_by_productcateno(int productcateno);
  
  public int increaseRecom(int productno);
  
  public int increaseReplycnt(int productno);
  
  public int decreaseReplycnt(int productno);

  /**
   * 검색 목록
   * @param hashMap
   * @return
   */
  public List<ProductVO> list_by_search(HashMap<String, Object> hashMap);
  
  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * 상품 전체 목록
   * @return
   */
  public ArrayList<Product_imageProductVO> list_all_search_paging(HashMap<String, Object> map);
  
  /**
   * 검색 + 페이징 목록
   * @param map
   * @return
   */
  public ArrayList<Product_imageProductVO> list_by_productno_search_paging(HashMap<String, Object> map);
  
  
}







