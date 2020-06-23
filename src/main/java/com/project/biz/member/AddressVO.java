package com.project.biz.member;

public class AddressVO {
	private String zipnum;
	private String sido;
	private String gugun;
	private String dong;
	private String zipcode;
	private String bunji;
	public String getZipnum() {
		return zipnum;
	}
	public void setZipnum(String zipnum) {
		this.zipnum = zipnum;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getBunji() {
		return bunji;
	}
	public void setBunji(String bunji) {
		this.bunji = bunji;
	}
	
	@Override
	public String toString() {
		return "AddressVO [zipnum=" + zipnum + ", sido=" + sido + ", gugun=" + gugun + ", dong=" + dong + ", zipcode="
				+ zipcode + ", bunji=" + bunji + "]";
	}
	
	
}
