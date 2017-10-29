package com.cmb.pms.core.model;

import java.util.Date;

public class UserRole {
    private Integer userRoleID; // 系统自动生成 Primary Key

    private Integer userID; // 用户ID
 
    private Integer roleID;  // 角色ID

    private Date createTime; // 记录生成时间

    private Date modifyTime; // 记录更新时间

    private String creator; // 创建人

    private String modifier; // 修改人

	public Integer getUserRoleID() {
		return userRoleID;
	}

	public void setUserRoleID(Integer userRoleID) {
		this.userRoleID = userRoleID;
	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public Integer getRoleID() {
		return roleID;
	}

	public void setRoleID(Integer roleID) {
		this.roleID = roleID;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

}