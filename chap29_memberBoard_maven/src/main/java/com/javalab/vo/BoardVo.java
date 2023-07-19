package com.javalab.vo;

public class BoardVo {
	private int no;
	private String title;
	private String content;
	private String id;
	private int hit;
	private String regdate;
	
	private int reply_group;
	private int reply_order;
	private int reply_indent;
	
	private String pageNum = "1";		// 페이지 번호
	private Integer listCount = 10;		// 1페이지 당 보여줄 게시물 수
	private Integer pagePerBlock = 10;  // 한번에 보여질 페이지번호 갯수

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

	public BoardVo() {
		super();

	}

	public BoardVo(int no, String title, String content, String id, int hit, String regdate, int reply_group,
			int reply_order, int reply_indent) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.id = id;
		this.hit = hit;
		this.regdate = regdate;
		this.reply_group = reply_group;
		this.reply_order = reply_order;
		this.reply_indent = reply_indent;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public int getReply_group() {
		return reply_group;
	}

	public void setReply_group(int reply_group) {
		this.reply_group = reply_group;
	}

	public int getReply_order() {
		return reply_order;
	}

	public void setReply_order(int reply_order) {
		this.reply_order = reply_order;
	}

	public int getReply_indent() {
		return reply_indent;
	}

	public void setReply_indent(int reply_indent) {
		this.reply_indent = reply_indent;
	}

}
