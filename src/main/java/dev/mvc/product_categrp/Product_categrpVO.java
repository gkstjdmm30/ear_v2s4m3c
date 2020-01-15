package dev.mvc.product_categrp;
 
public class Product_categrpVO {
  /** 상품 분류 번호 */
  private int productcateno;
  /**  상품 카테고리 이름 */
  private String name;
  /** 출력 순서 */  
  private int seqno;
  /**그룹 생성일*/
  private String rdate;
  /** 등록된 상품 수*/
  private int cnt;
  
  public int getProductcateno() {
    return productcateno;
  }
  public void setProductcateno(int productcateno) {
    this.productcateno = productcateno;
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
 
  