package dev.mvc.notice_attachfile;

public class Contents_AttachfileVO {
  // contents 테이블
  // ------------------------------------
  /** 회원 번호 */
  private int membersno;
  /** 카테고리 번호 */
  private int categrpno;
  /** 제목 */
  private String title;
  /** 내용 */
  private String content;
  /** 추천 */
  private int recom;
  /** 조회수 */
  private int cnt;
  /** 댓글수 */
  private int replycnt;
  /** 검색어 */
  private String word;
  
  // attachfile 테이블
  // ------------------------------------
  /** 파일 번호 */
  private int attachfileno;
  /** 글 번호(FK), attachfile 테이블 */
  private int noticeno;
  /** 원본 파일명 */
  private String fname;
  /** 업로드된 파일명 */
  private String fupname;
  /** Thumb 이미지 */
  private String thumb;
  /** 파일 크기 */
  private long fsize;
  /** 등록일, attachfile 테이블 */
  private String rdate;
	public int getMembersno() {
		return membersno;
	}
	public void setMembersno(int membersno) {
		this.membersno = membersno;
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
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public int getAttachfileno() {
		return attachfileno;
	}
	public void setAttachfileno(int attachfileno) {
		this.attachfileno = attachfileno;
	}
	public int getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getFupname() {
		return fupname;
	}
	public void setFupname(String fupname) {
		this.fupname = fupname;
	}
	public String getThumb() {
		return thumb;
	}
	public void setThumb(String thumb) {
		this.thumb = thumb;
	}
	public long getFsize() {
		return fsize;
	}
	public void setFsize(long fsize) {
		this.fsize = fsize;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
  

  
  
}







