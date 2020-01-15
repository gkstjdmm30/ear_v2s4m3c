package dev.mvc.members;

import java.util.Date;

public class MembersVO {
  
  private int membersno;
  private String id;
  private String name;
  private String passwd;
  private String tel;
  private String email;
  private String zipcode;
  private String address1;
  private String address2;
  private Date rdate;
  public int getMembersno() {
    return membersno;
  }
  public void setMembersno(int membersno) {
    this.membersno = membersno;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getTel() {
    return tel;
  }
  public void setTel(String tel) {
    this.tel = tel;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
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
  public Date getRdate() {
    return rdate;
  }
  public void setRdate(Date rdate) {
    this.rdate = rdate;
  }
}
