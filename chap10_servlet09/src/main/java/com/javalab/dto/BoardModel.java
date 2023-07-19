package com.javalab.dto;

public class BoardModel {
	private int no;
	private String subject;
	private String writer;
	private String contents;
	private int hit;
	
	public BoardModel() {
		super();
		
	}

	public BoardModel(int no, String subject, String writer, String contents, int hit) {
		super();
		this.no = no;
		this.subject = subject;
		this.writer = writer;
		this.contents = contents;
		this.hit = hit;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

}
