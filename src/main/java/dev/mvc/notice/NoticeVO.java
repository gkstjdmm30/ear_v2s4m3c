package dev.mvc.notice;

public class NoticeVO {
	
	/** 카테고리 그룹번호 */
	private int categrpno;
	/** 카테고리 이름 */
	private String name;
	/** 출력 순서 */
	private int seqno;
	/** 출력 모드 */
	private String visible;
	/** 그룹 생성일 */
	private String rdate;
	/** 공지사항 등록갯수 */
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
