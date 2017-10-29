package com.cmb.pms.client.dto;

import java.io.Serializable;

public class RoleDTO implements Serializable {
	
	private static final long serialVersionUID = -4459173056237479291L;

	private Integer roleID;  // 系统生成，Primary Key

    private String roleName;  // 角色名

    private String roleType;  // 角色类型 (PM-室经理（Project Manager）PL-项目组长（Project Leader）、CD-普通开发人员（Common Developer）)

    private String roleDescription; // 角色描述

    private Integer parentRoleID; // 父角色ID
    
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

	public Integer getParentRoleID() {
		return parentRoleID;
	}

	public void setParentRoleID(Integer parentRoleID) {
		this.parentRoleID = parentRoleID;
	}
}