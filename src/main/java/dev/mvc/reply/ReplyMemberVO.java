package dev.mvc.reply;

public class ReplyMemberVO {
  /** ���̵� */
  private String id = "";
  
  /** ��� ��ȣ */
  private int replyno;
  /** ���� �� ��ȣ */
  private int productno;
  /** ȸ�� ��ȣ */
  private int membersno;
  /** ���� */
  private String content;
  /** �н����� */
  private String passwd;
  /** ����� */
  private String rdate;
  
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public int getReplyno() {
    return replyno;
  }
  public void setReplyno(int replyno) {
    this.replyno = replyno;
  }
  public int getProductno() {
    return productno;
  }
  public void setProductno(int productno) {
    this.productno = productno;
  }
  public int getMembersno() {
    return membersno;
  }
  public void setMembersno(int membersno) {
    this.membersno = membersno;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  
}
