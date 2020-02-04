package dev.mvc.product;

public class ProductVO {
  /** 상품 번호 */
  private int productno;
  /** 상품 카테고리 번호 */
  private int productcateno;
  /** 회원 번호 */
  private int membersno;
  /** 이름 */
  private String name;
  /** 가격 */
  private int price;
  /** 내용 */
  private String content;
  /** 추천 */
  private int recom;
  /** 조회수 */
  private int cnt;
  /** 댓글수 */
  private int replycnt;
  /** 등록일 */
  private String rdate;
  /** 검색어 */
  private String word;
  
  public int getProductno() {
    return productno;
  }
  public void setProductno(int productno) {
    this.productno = productno;
  }
  public int getProductcateno() {
    return productcateno;
  }
  public void setProductcateno(int productcateno) {
    this.productcateno = productcateno;
  }
  public int getMembersno() {
    return membersno;
  }
  public void setMembersno(int membersno) {
    this.membersno = membersno;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  
  public int getPrice() {
    return price;
  }
  public void setPrice(int price) {
    this.price = price;
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
