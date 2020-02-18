package dev.mvc.notice;

import java.util.ArrayList;
import java.util.HashMap;

public interface NoticeProcInter {

  //검색 + 페이징 목록
  public ArrayList<NoticeVO> list_by_categrpno_search_paging(HashMap<String, Object> map);
  
  // 카테고리별 검색 레코드 갯수
  public int search_count(HashMap<String, Object> hashMap);
  
  // 페이지 메소드는 DAO를 호출하지 않음
  // 페이지 목록 문자열 생성, Box 형태
  public String pagingBox(String listFile, int categrpno, int search_count, int nowPage, String word);

  /**
   * 글 등록
   * @param noticeVO
   * @return
   */
  public int create(NoticeVO noticeVO);
  
  /**
   * 글 읽기
   * @param noticeno
   * @return
   */
  public NoticeVO read(int noticeno);
  
  /**
   * 기존 글 업데이트
   * @param noticeVO
   * @return
   */
  public int update(NoticeVO noticeVO);
  
  /**
   * 한 건 삭제
   * @param noticeno
   * @return
   */
  public int delete(int noticeno);
  
  // 부모 카테고리 번호별 레코드 갯수
  public int count_by_categrpno(int categrpno);
  
  // 부모 카테고리 번호별 레코드 삭제
  public int delete_by_categrpno(int categrpno);
  
  public int increaseReplycnt(int noticeno);
  
  public int decreaseReplycnt(int noticeno);

  
}
