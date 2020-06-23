package com.project.biz.order;

import java.sql.Timestamp;

public class CartVO {
	
	private int cno;
	private String userid;
	private int pno;
	private String mname;
	private String pname;
	private int quantity;
	private int price;
	private Timestamp indate;
	private String result;
	private String image;
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	
	
	
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Timestamp getIndate() {
		return indate;
	}
	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "CartVO [cno=" + cno + ", userid=" + userid + ", pno=" + pno + ", mname=" + mname + ", pname=" + pname
				+ ", quantity=" + quantity + ", price=" + price + ", indate=" + indate + ", result=" + result
				+ ", image=" + image + "]";
	}
	
	
	
	
	
}
