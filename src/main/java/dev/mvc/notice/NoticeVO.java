package dev.mvc.notice;

public class NoticeVO {
	
	/** ī�װ��� �׷��ȣ */
	private int categrpno;
	/** ī�װ��� �̸� */
	private String name;
	/** ��� ���� */
	private int seqno;
	/** ��� ��� */
	private String visible;
	/** �׷� ������ */
	private String rdate;
	/** �������� ��ϰ��� */
	private int cnt;
	
	public int getCategrpno() {
		return categrpno;
	}
	public void setCategrpno(int categrpno) {
		this.categrpno = categrpno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSeqno() {
		return seqno;
	}
	public void setSeqno(int seqno) {
		this.seqno = seqno;
	}
	public String getVisible() {
		return visible;
	}
	public void setVisible(String visible) {
		this.visible = visible;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
	
}