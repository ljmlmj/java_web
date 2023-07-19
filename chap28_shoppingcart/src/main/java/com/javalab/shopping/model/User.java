package com.javalab.shopping.model;

public class User {

	private String userId;
	private String userEmail;
	private String userName;
	private String userPwd;
	private String userHp;
	private String createDate;
	
	public User() {
		super();
	}

	public User(String userId, String userEmail, String userName, String userPwd, String userHp, String createDate) {
		super();
		this.userId = userId;
		this.userEmail = userEmail;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userHp = userHp;
		this.createDate = createDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserHp() {
		return userHp;
	}

	public void setUserHp(String userHp) {
		this.userHp = userHp;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userEmail=" + userEmail + ", userName=" + userName + ", userPwd=" + userPwd
				+ ", userHp=" + userHp + ", createDate=" + createDate + "]";
	}
	
} // class e
