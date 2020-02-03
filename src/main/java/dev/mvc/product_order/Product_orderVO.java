package dev.mvc.product_order;

import oracle.sql.DATE;

public class Product_orderVO {
  
  private int orderno;
  private int productno;
  private int membersno;
  private int count;
  private int price;
  private int shipping;
  private int totalprice;
  private int howorder;
  private String tel;
  private String zipcode;
  private String address1;
  private String address2;
  private DATE odate;
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getShipping() {
		return shipping;
	}
	public void setShipping(int shipping) {
		this.shipping = shipping;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public int getHoworder() {
		return howorder;
	}
	public void setHoworder(int howorder) {
		this.howorder = howorder;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
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
	public DATE getOdate() {
		return odate;
	}
	public void setOdate(DATE odate) {
		this.odate = odate;
	}
  
  
}
