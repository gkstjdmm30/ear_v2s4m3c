package dev.mvc.deli;

import java.util.Date;

public class Deli_listVO {
  public Deli_listVO() {
  System.out.println("Deli_listVO created");
  }
  private String name;
  private String zipcode;
  private String address1;
  private String address2;
  private int delino;
  private int orderno;
  private String delivery;
  private Date ddate;
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getZipcode() {
    return zipcode;
  }
  public void setZipcode(String zipcode) {
    this.zipcode = zipcode;
  }
  public String getAddress1() {
    return address1;
  }
  public void setAddress1(String address1) {
    this.address1 = address1;
  }
  public String getAddress2() {
    return address2;
  }
  public void setAddress2(String address2) {
    this.address2 = address2;
  }
  public int getDelino() {
    return delino;
  }
  public void setDelino(int delino) {
    this.delino = delino;
  }
  public int getOrderno() {
    return orderno;
  }
  public void setOrderno(int orderno) {
    this.orderno = orderno;
  }
  public String getDelivery() {
    return delivery;
  }
  public void setDelivery(String delivery) {
    this.delivery = delivery;
  }
  public Date getDdate() {
    return ddate;
  }
  public void setDdate(Date ddate) {
    this.ddate = ddate;
  }
  

}
