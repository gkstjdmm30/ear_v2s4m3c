package dev.mvc.product_categrp;

import java.util.List;

public interface Product_categrpProcInter {
  /**
   * 등록
   * 
   * @param product_categrpVO
   * @return 등록된 레코드 갯수
   */
  public int create(Product_categrpVO product_categrpVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list" resultType="ProductVO">
   * </xmp> 
   * @return
   */
  public List<Product_categrpVO> list();
  
  /**
   * 조회
   * @param productcateno
   * @return
   */
  public Product_categrpVO read(int productcateno);
  
  /**
   * 수정 처리
   * @param product_categrpVO
   * @return 처리된 레코드 갯수
   */
  public int update(Product_categrpVO product_categrpVO);
  
  /**
   * 삭제 처리
   * @param productcateno
   * @return 처리된 레코드 갯수
   */
  public int delete(int productcateno);
  
  /**
   * 그룹에 속한 상품 수 증가
   * @param productcateno
   * @return
   */
  public int increaseCnt(int productcateno);
  
  /**
   * 그룹에 속한 상품 수 감소
   * <update id="decreaseCnt" parameterType="int">
   * @param productcateno
   * @return
   */
  public int decreaseCnt(int productcateno);
  
  
  
}



