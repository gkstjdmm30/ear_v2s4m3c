package dev.mvc.notice;

import java.util.List;

public interface NoticeProcInter {

  /** seqno �������� ��� */
  public List<NoticeVO> list_seqno_asc();
  
  /** ī�װ� �߰� */
  public int create(NoticeVO noticeVO);
  
  /** ī�װ� ���� */
  public int delete(int categrpno);
  
  /** ī�װ� ��ȸ */
  public NoticeVO read(int categrpno);
  
  /** ī�װ� ���� */
  public int update(NoticeVO notice);
  
}



