package dev.mvc.product;

import java.util.List;

public interface ProductDAOInter {
  
  /**
   * 상품 등록
   * @param productVO
   * @return 등록된 레코드 갯수
   */
  public int create(ProductVO productVO);

  /**
   * 상품 전체 목록
   * @return
   */
  public List<ProductVO> list_all();

  /**
   * productcateno별 전체 목록
   * @return
   */
  public List<ProductVO> list_by_productcateno(int productcateno);

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
   * @param categrpno
   * @return
   */
  public int count_by_productcateno(int productcateno);
  
  /**
   * 부모 카테고리 번호별 레코드 삭제
   * @param categrpno
   * @return
   */
  public int delete_by_productcateno(int productcateno);
  

  
}







