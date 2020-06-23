package com.project.biz.member;

import java.util.Date;

public class MemberVO {
	
	// 사용자 VO
	private String userid;
	private String password;
	private String username;
	private Date birthdate;
	private String email;
	private String phone;
	private String zipnum;
	private String address;
	private int grade;
	private Date regdate;
	private int verify;
	
	private String useyn;
	
	private String birthyy;
	private String birthmm;
	private String birthdd;
	
	// Getter / Setter
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZipnum() {
		return zipnum;
	}
	public void setZipnum(String zipnum) {
		this.zipnum = zipnum;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getVerify() {
		return verify;
	}
	public void setVerify(int verify) {
		this.verify = verify;
	}
	
	public String getBirthyy() {
		return birthyy;
	}
	public void setBirthyy(String birthyy) {
		this.birthyy = birthyy;
	}
	public String getBirthmm() {
		return birthmm;
	}
	public void setBirthmm(String birthmm) {
		this.birthmm = birthmm;
	}
	public String getBirthdd() {
		return birthdd;
	}
	public void setBirthdd(String birthdd) {
		this.birthdd = birthdd;
	}
	
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	
	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", password=" + password + ", username=" + username + ", birthdate="
				+ birthdate + ", email=" + email + ", phone=" + phone + ", zipnum=" + zipnum + ", address=" + address
				+ ", grade=" + grade + ", regdate=" + regdate + ", verify=" + verify + ", useyn=" + useyn + ", birthyy="
				+ birthyy + ", birthmm=" + birthmm + ", birthdd=" + birthdd + "]";
	}
	
	// toString
	
	
	
	
	
	
}
