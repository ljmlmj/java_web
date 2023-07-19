package com.javalab.vo;

import java.sql.Date;

public class MemberVo
{
	private String id;
	private String pwd;
	private String name;
	private String email;
	private Date joinDate;
	
	public MemberVo() {
	}
	
	// 로그인시 사용하는 생성자
	public MemberVo(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}

	public MemberVo(String id, String name, String email, Date joinDate) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.joinDate = joinDate;
	}

	public MemberVo(String id, String pwd, String name, String email) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
	}

	public MemberVo(String id, String pwd, String name, String email, Date joinDate) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.joinDate = joinDate;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + "]";
	}
	
	
	
}
