package dev.mvc.product_categrp;

import java.util.List;

// MyBATIS의 <mapper namespace="dev.mvc.categrp.CategrpDAOInter">에 선언 
public interface Product_categrpDAOInter {
  /**
   * 등록
   * 
   * @param product_categrpVO
   * @return 등록된 레코드 갯수
   */
  public int create(Product_categrpVO product_categrpVO);
  
  /**
   * seqno 오름차순 출력 목록
   * @return
   */
  public List<Product_categrpVO> list_seqno_asc();
  
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
   * 우선순위 상향 up 10 ▷ 1
   * @param categrpno
   * @return
   */
  public int update_seqno_up(int productcateno);
  
  /**
   * 우선순위 하향 down 1 ▷ 10
   * @param categrpno
   * @return
   */
  public int update_seqno_down(int productcateno);
  
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
  
  /**
   * cnt 컬럼 0으로 초기화
   * <xmp>
   * <update id="cnt_zero" parameterType="int"> 
   * </xmp>
   * @param productcateno
   * @return
   */
  public int cnt_zero(int productcateno);
  

  
}







