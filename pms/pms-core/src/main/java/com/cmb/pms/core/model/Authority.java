package com.cmb.pms.core.model;

import java.util.Date;

public class Authority {
    private Integer authorityID; // 权限ID, Primary key

    private Integer parentAuthID;  // 父权限ID

    private String authName;  // 权限名

    private String authDescription;  // 权限描述

    private String authURL;  // 权限访问地址路径
    
    private Date authCreTime;  // 记录生成时间

    private Date authModTime;  // 记录更新时间

    private String authCreator;  // 创建人

    private String authModifier;  // 修改人

	public Integer getAuthorityID() {
		return authorityID;
	}

	public void setAuthorityID(Integer authorityID) {
		this.authorityID = authorityID;
	}

	public Integer getParentAuthID() {
		return parentAuthID;
	}

	public void setParentAuthID(Integer parentAuthID) {
		this.parentAuthID = parentAuthID;
	}

	public String getAuthName() {
		return authName;
	}

	public void setAuthName(String authName) {
		this.authName = authName;
	}

	public String getAuthDescription() {
		return authDescription;
	}

	public void setAuthDescription(String authDescription) {
		this.authDescription = authDescription;
	}

	public Date getAuthCreTime() {
		return authCreTime;
	}

	public void setAuthCreTime(Date authCreTime) {
		this.authCreTime = authCreTime;
	}

	public Date getAuthModTime() {
		return authModTime;
	}

	public void setAuthModTime(Date authModTime) {
		this.authModTime = authModTime;
	}

	public String getAuthCreator() {
		return authCreator;
	}

	public void setAuthCreator(String authCreator) {
		this.authCreator = authCreator;
	}

	public String getAuthModifier() {
		return authModifier;
	}

	public void setAuthModifier(String authModifier) {
		this.authModifier = authModifier;
	}

	public String getAuthURL() {
		return authURL;
	}

	public void setAuthURL(String authURL) {
		this.authURL = authURL;
	}

}