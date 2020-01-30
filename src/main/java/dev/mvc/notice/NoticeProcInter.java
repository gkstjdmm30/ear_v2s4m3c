package dev.mvc.notice;

import java.util.ArrayList;
import java.util.HashMap;

public interface NoticeProcInter {
  /**
   * <xmp>
   * �˻� + ����¡ ���
   * <select id="list_by_categrpno_search_paging" resultType="ContentsVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public ArrayList<NoticeVO> list_by_categrpno_search_paging(HashMap<String, Object> map);

  /**
   * ī�װ��� �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * ������ �޼ҵ�� DAO�� ȣ������ ����
   * ������ ��� ���ڿ� ����, Box ����
   * @param listFile ��� ���ϸ� 
   * @param cateno ī�װ���ȣ
   * @param search_count �˻� ����
   * @param nowPage ���� ������, nowPage�� 1���� ����
   * @param word �˻���
   * @return
   */
  public String pagingBox(String listFile, int categrpno, int search_count, int nowPage, String word);
   
  /**
   * <xmp>
   * ��ȸ
   * <select id="read" resultType="NoticeVO" parameterType="int">
   * </xmp> 
   * @param noticeno
   * @return
   */
  public NoticeVO read(int noticeno);

}
