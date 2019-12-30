package dev.mvc.product_categrp;
 
public class Product_categrpVO {
  /** 상품 분류 번호 */
  private int productcateno;
  /**  분류명 */
  private String name;
  /** 출력 순서 */
  private int seqno;
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
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  
  
 
  
  
} 
 
  