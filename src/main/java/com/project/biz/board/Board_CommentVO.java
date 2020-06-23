package com.project.biz.board;

import java.util.Date;

public class Board_CommentVO {
	
	private int comment_no;
	private int bno;
	private String content;
	private String writer;
	private Date regdate;
	private Date modifydate;
	
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getModifydate() {
		return modifydate;
	}
	public void setModifydate(Date modifydate) {
		this.modifydate = modifydate;
	}
	
	@Override
	public String toString() {
		return "CommentVO [comment_no=" + comment_no + ", bno=" + bno + ", content=" + content + ", writer=" + writer
				+ ", regdate=" + regdate + ", modifydate=" + modifydate + "]";
	}
	
	
	
	
}
