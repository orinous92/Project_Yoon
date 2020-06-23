package com.project.biz.board;

import java.util.Date;

public class QnaVO {

	private int qno;
	private String subject;
	private String content;
	private String reply;
	private String userid;
	private String rep;
	private Date indate;
	
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRep() {
		return rep;
	}
	public void setRep(String rep) {
		this.rep = rep;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	
	@Override
	public String toString() {
		return "QnaVO [qno=" + qno + ", subject=" + subject + ", content=" + content + ", reply=" + reply + ", userid="
				+ userid + ", rep=" + rep + ", indate=" + indate + "]";
	}
	
	
}
