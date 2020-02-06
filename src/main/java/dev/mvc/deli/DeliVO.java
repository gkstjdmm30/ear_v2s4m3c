package dev.mvc.deli;

import java.util.Date;

public class DeliVO {
  
  private int delino;
  private int orderno;
  private String delivery;
  private Date ddate;
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
