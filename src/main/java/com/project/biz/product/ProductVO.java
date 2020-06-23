package com.project.biz.product;

import java.util.Date;

public class ProductVO {
	
	
	private int pno;
	private String cateName;
	private String pname;
	private String pdesc;
	private int price;
	private String image;
	private Date productdate;
	private int inventory;
	private String useyn;
	
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getProductdate() {
		return productdate;
	}
	public void setProductdate(Date productdate) {
		this.productdate = productdate;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
	
	
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	
	@Override
	public String toString() {
		return "ProductVO [pno=" + pno + ", cateName=" + cateName + ", pname=" + pname + ", pdesc=" + pdesc + ", price="
				+ price + ", image=" + image + ", productdate=" + productdate + ", inventory=" + inventory + ", useyn="
				+ useyn + "]";
	}

	
	
	
}
