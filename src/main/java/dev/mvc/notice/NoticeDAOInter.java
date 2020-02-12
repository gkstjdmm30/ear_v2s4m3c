package dev.mvc.notice;

import java.util.ArrayList;
import java.util.HashMap;

public interface NoticeDAOInter {
	
	/**
	 * �˻� + ����¡ ���
	 * <select id="list_by_categrpno_search_paging" resultType="NoticeVO" parameterType="int">
	 * @param map
	 * @return NoticeVO
	 */
  public ArrayList<NoticeVO> list_by_categrpno_search_paging(HashMap<String, Object> map);
  
	/**
	 * ī�װ��� �˻� ���ڵ� ����
	 * <select id="search_count" resultType="int" parameterType="HashMap">
	 * @param hashMap
	 * @return int
	 */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
	 * ������ �޼ҵ�� DAO�� ȣ������ ����
	 * ������ ��� ���ڿ� ����, Box ����
   * @param listFile
   * @param categrpno
   * @param search_count
   * @param nowPage
   * @param word
   * @return
   */
  public String pagingBox(String listFile, int categrpno, int search_count, int nowPage, String word);

  // ���
  public int create(NoticeVO noticeVO);
  
  // ��ȸ
  public NoticeVO read(int noticeno);
  
  // ����
  public int update(NoticeVO noticeVO);
  
  // �Ѱ� ����
  public int delete(int noticeno);
  
  // �θ� ī�װ� ��ȣ�� ���ڵ� ����
  public int count_by_categrpno(int categrpno);
  
  // �θ� ī�װ� ��ȣ�� ���ڵ� ����
  public int delete_by_categrpno(int categrpno);
  
  public int increaseReplycnt(int noticeno);
  
  public int decreaseReplycnt(int noticeno);
 
  
  
  
  
}
