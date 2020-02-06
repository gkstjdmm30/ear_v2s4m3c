package dev.mvc.product_image;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Product_imageVO {
  
  /** ��ǰ �̹��� ��ȣ */
  private int productimgno;
  /** ��ǰ ��ȣ */
  private int productno;
  /** ���� ���ϸ� */
  private String fname;
  /** ���ε�� ���ϸ� */
  private String fupname;
  /** Thumb �̹��� */
  private String thumb;
  /** ���� ũ�� */
  private long fsize;
  /** ����� */
  private String rdate;
  
  /** Form�� ������ MultipartFile�� ��ȯ�Ͽ� List�� ����  */
  private List<MultipartFile> fnamesMF;
  
  // private MultipartFile fnamesMF;  // �ϳ��� ���� ó��
  /** ���� ���� ��� */
  private String flabel;   
  
  public int getProductimgno() {
    return productimgno;
  }
  public void setProductimgno(int productimgno) {
    this.productimgno = productimgno;
  }
  public int getProductno() {
    return productno;
  }
  public void setProductno(int productno) {
    this.productno = productno;
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
  public List<MultipartFile> getFnamesMF() {
    return fnamesMF;
  }
  public void setFnamesMF(List<MultipartFile> fnamesMF) {
    this.fnamesMF = fnamesMF;
  }
  public String getFlabel() {
    return flabel;
  }
  public void setFlabel(String flabel) {
    this.flabel = flabel;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  

}
