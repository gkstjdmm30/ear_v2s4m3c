package dev.mvc.notice_attachfile;

public class Contents_AttachfileVO {
  // contents ���̺�
  // ------------------------------------
  /** ȸ�� ��ȣ */
  private int membersno;
  /** ī�װ� ��ȣ */
  private int categrpno;
  /** ���� */
  private String title;
  /** ���� */
  private String content;
  /** ��õ */
  private int recom;
  /** ��ȸ�� */
  private int cnt;
  /** ��ۼ� */
  private int replycnt;
  /** �˻��� */
  private String word;
  
  // attachfile ���̺�
  // ------------------------------------
  /** ���� ��ȣ */
  private int attachfileno;
  /** �� ��ȣ(FK), attachfile ���̺� */
  private int noticeno;
  /** ���� ���ϸ� */
  private String fname;
  /** ���ε�� ���ϸ� */
  private String fupname;
  /** Thumb �̹��� */
  private String thumb;
  /** ���� ũ�� */
  private long fsize;
  /** �����, attachfile ���̺� */
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







