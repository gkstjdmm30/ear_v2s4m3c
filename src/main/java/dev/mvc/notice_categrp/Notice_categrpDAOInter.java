package dev.mvc.notice_categrp;

import java.util.List;

// MyBATIS�� <mapper namespace="dev.mvc.notice_categrp.Notice_categrpDAOInter">�� ���� 
public interface Notice_categrpDAOInter {
	
  // ���ۿ� ���� �޼ҵ���� MyBATIS�� XML ���Ͼ��� id�� �����ؾ��մϴ�.
  /** seqno �������� ��� */
  public List<Notice_categrpVO> list_seqno_asc();
  
  /** ī�װ� �߰� */
  public int create(Notice_categrpVO notice_categrpVO);
  
  /** ī�װ� ���� */
  public int delete(int categrpno);
  
  /** ī�װ� ��ȸ */
  public Notice_categrpVO read(int categrpno);
  
  /** ī�װ� ���� */
  public int update(Notice_categrpVO notice_categrpVO);
  
  /** seqno �켱���� ���� */
  public int update_seqno_up(int categrpno);
  
  /** seqno �켱���� ���� */
  public int update_seqno_down(int categrpno);
  
  /** �׷쿡 ���� ������ �ۼ� ���� */
  public int increaseCnt(int categrpno);
  
  /** �׷쿡 ���� ������ �ۼ� ���� */
  public int decreaseCnt(int categrpno);
  
  /** cnt �÷� 0���� �ʱ�ȭ */
  public int cnt_zero(int categrpno);
  
  
  
}







