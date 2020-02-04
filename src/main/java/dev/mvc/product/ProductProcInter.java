package dev.mvc.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface ProductProcInter {
  
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
   * 페이지 메소드는 DAO를 호출하지 않음
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param cateno 카테고리번호
   * @param search_count 검색 갯수
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @param word 검색어
   * @return
   */
  public String pagingBox(String listFile, int productcateno, int search_count, int nowPage, String word);
  
  /**
   * 검색 + 페이징 목록
   * @param map
   * @return
   */
  public ArrayList<ProductVO> list_by_search_paging(HashMap<String, Object> map);
  
}



