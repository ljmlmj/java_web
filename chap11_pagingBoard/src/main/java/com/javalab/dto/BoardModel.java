package com.javalab.dto;

public class BoardModel {
	private int no;
	private String subject;
	private String writer;
	private String contents;
	private int hit;
	private String regdate;
	
	private String pageNum = "1";		// 페이지 번호
	private Integer listCount = 10;		// 1페이지 당 보여줄 게시물 수
	private Integer pagePerBlock = 10;  // 한번에 보여질 페이지번호 갯수
	
	public BoardModel() {
		super();
		
	}
	
	public BoardModel(int no, String subject, String writer, String contents, int hit, String regdate) {
		super();
		this.no = no;
		this.subject = subject;
		this.writer = writer;
		this.contents = contents;
		this.hit = hit;
		this.regdate = regdate;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getPageNum() {
		return pageNum;
	}

	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}

	public Integer getListCount() {
		return listCount;
	}

	public void setListCount(Integer listCount) {
		this.listCount = listCount;
	}

	public Integer getPagePerBlock() {
		return pagePerBlock;
	}

	public void setPagePerBlock(Integer pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	
}
