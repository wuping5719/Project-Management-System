package com.cmb.pms.core.model;

import java.util.Date;

public class Role {
    private Integer roleID;  // 系统生成，Primary Key

    private String roleName;  // 角色名

    private String roleType;  // 角色类型 (PM-室经理（Project Manager）PL-项目组长（Project Leader）、CD-普通开发人员（Common Developer）)

    private String roleDescription; // 角色描述

    private Integer parentRoleID; // 父角色ID
    
    private Date roleCreTime;   // 记录生成时间

    private Date roleModTime;  // 记录更新时间

    private String roleCreator;  // 创建人

    private String roleModifier; // 修改人

    public Integer getRoleID() {
        return roleID;
    }

    public void setRoleID(Integer roleID) {
        this.roleID = roleID;
    }

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleType() {
		return roleType;
	}

	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}

	public String getRoleDescription() {
		return roleDescription;
	}

	public void setRoleDescription(String roleDescription) {
		this.roleDescription = roleDescription;
	}

	public Date getRoleCreTime() {
		return roleCreTime;
	}

	public void setRoleCreTime(Date roleCreTime) {
		this.roleCreTime = roleCreTime;
	}

	public Date getRoleModTime() {
		return roleModTime;
	}

	public void setRoleModTime(Date roleModTime) {
		this.roleModTime = roleModTime;
	}

	public String getRoleCreator() {
		return roleCreator;
	}

	public void setRoleCreator(String roleCreator) {
		this.roleCreator = roleCreator;
	}

	public String getRoleModifier() {
		return roleModifier;
	}

	public void setRoleModifier(String roleModifier) {
		this.roleModifier = roleModifier;
	}

	public Integer getParentRoleID() {
		return parentRoleID;
	}

	public void setParentRoleID(Integer parentRoleID) {
		this.parentRoleID = parentRoleID;
	}

}