package dev.mvc.notice;

import java.util.ArrayList;
import java.util.HashMap;

public interface NoticeProcInter {

  //�˻� + ����¡ ���
  public ArrayList<NoticeVO> list_by_categrpno_search_paging(HashMap<String, Object> map);
  
  // ī�װ��� �˻� ���ڵ� ����
  public int search_count(HashMap<String, Object> hashMap);
  
  // ������ �޼ҵ�� DAO�� ȣ������ ����
  // ������ ��� ���ڿ� ����, Box ����
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
