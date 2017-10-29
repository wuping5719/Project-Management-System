package com.cmb.pms.client.dto;

import java.io.Serializable;

public class UserDTO implements Serializable {
	private static final long serialVersionUID = -7024002907517522489L;

	private Integer userID; // 系统ID，自动生成

	private String userWorkID; // 用户工号，8位员工编号

	private String userPassword; // 登录密码(明文密码)

	private String userName; // 用户名称，姓名

	private String userMobile; // 联系方式，手机号码

	private String userEmail; // 邮箱

	private String userPass; // 登录密码(密文密码)
	
	private String groupName; // 团队名（例：风险团队）

	private String devRoom; // 开发室（例：对公信贷室）
	
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

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
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

}
