package com.cmb.pms.client.dto;

import java.io.Serializable;

public class AuthorityDTO implements Serializable {
	
	private static final long serialVersionUID = 8455397869498508636L;

	private Integer authorityID; // 权限ID, Primary key

    private Integer parentAuthID;  // 父权限ID

    private String authName;  // 权限名

    private String authDescription;  // 权限描述

    private String authURL;  // 权限访问地址路径
    
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

	public String getAuthURL() {
		return authURL;
	}

	public void setAuthURL(String authURL) {
		this.authURL = authURL;
	}
}