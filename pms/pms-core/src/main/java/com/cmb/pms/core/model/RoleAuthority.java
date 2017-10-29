package com.cmb.pms.core.model;

import java.util.Date;

public class RoleAuthority {
    private Integer roleAuthID; // 系统自动生成Primary Key

    private Integer roleID; // 角色ID

    private Integer authorityID; // 权限ID

    private Date createtime; // 记录生成时间

    private Date modifyTime; // 记录更新时间

    private String creator; // 创建人

    private String modifier; // 修改人

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator == null ? null : creator.trim();
    }

    public String getModifier() {
        return modifier;
    }

    public void setModifier(String modifier) {
        this.modifier = modifier == null ? null : modifier.trim();
    }

	public Integer getRoleAuthID() {
		return roleAuthID;
	}

	public void setRoleAuthID(Integer roleAuthID) {
		this.roleAuthID = roleAuthID;
	}

	public Integer getRoleID() {
		return roleID;
	}

	public void setRoleID(Integer roleID) {
		this.roleID = roleID;
	}

	public Integer getAuthorityID() {
		return authorityID;
	}

	public void setAuthorityID(Integer authorityID) {
		this.authorityID = authorityID;
	}

	public Date getCreateTime() {
		return createtime;
	}

	public void setCreateTime(Date createtime) {
		this.createtime = createtime;
	}

	public Date getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
}