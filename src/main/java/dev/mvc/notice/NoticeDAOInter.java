package dev.mvc.notice;

import java.util.List;

// MyBATIS�� <mapper namespace="dev.mvc.categrp.CategrpDAOInter">�� ���� 
public interface NoticeDAOInter {
	
  // ���ۿ� ���� �޼ҵ���� MyBATIS�� XML ���Ͼ��� id�� �����ؾ��մϴ�.
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







