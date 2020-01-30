package dev.mvc.notice;

public class NoticeVO {
	

	/** 공지사항 번호 */ 
	private int noticeno;
	/** 카테고리 그룹번호 */ 
	private int categrpno;
	/** 제목 */ 
	private String title;
	/** 내용 */ 
	private String content;
	/** 추천수 */ 
	private int recom;
	/** 조회수 */ 
	private int cnt;
	/** 댓글수 */ 
	private int replycnt;
	/** 등록일 */ 
	private String rdate;
	/** 검색어 */ 
	private String word;
	public int getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}
	public int getCategrpno() {
		return categrpno;
	}
	public void setCategrpno(int categrpno) {
		this.categrpno = categrpno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRecom() {
		return recom;
	}
	public void setRecom(int recom) {
		this.recom = recom;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	
	
	
}
