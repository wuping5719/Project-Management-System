package com.cmb.pms.core.model;

import java.util.Date;

public class User {
	private Integer userID; // 系统ID，自动生成

	private String userWorkID; // 用户工号，8位员工编号

	private String userPassword; // 登录密码
	
	private String userName; // 用户名称，姓名

	private String userMobile; // 联系方式，手机号码

	private String userEmail; // 邮箱

	private String groupName; // 团队名（例：风险团队）

	private String devRoom; // 开发室（例：对公信贷室）
	
	private String userPass; // 登录密码(密文密码)

	private Date userCreTime; // 创建时间

	private Date userModTime; // 修改时间

	private String userCreator; // 创建人

	private String userModifier; // 修改人

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public String getUserWorkID() {
		return userWorkID;
	}

	public void setUserWorkID(String userWorkID) {
		this.userWorkID = userWorkID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserMobile() {
		return userMobile;
	}

	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Date getUserCreTime() {
		return userCreTime;
	}

	public void setUserCreTime(Date userCreTime) {
		this.userCreTime = userCreTime;
	}

	public Date getUserModTime() {
		return userModTime;
	}

	public void setUserModTime(Date userModTime) {
		this.userModTime = userModTime;
	}

	public String getUserCreator() {
		return userCreator;
	}

	public void setUserCreator(String userCreator) {
		this.userCreator = userCreator;
	}

	public String getUserModifier() {
		return userModifier;
	}

	public void setUserModifier(String userModifier) {
		this.userModifier = userModifier;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getDevRoom() {
		return devRoom;
	}

	public void setDevRoom(String devRoom) {
		this.devRoom = devRoom;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

}