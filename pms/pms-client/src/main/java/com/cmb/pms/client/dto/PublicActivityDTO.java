package com.cmb.pms.client.dto;

import java.io.Serializable;

public class PublicActivityDTO implements Serializable {
	
	private static final long serialVersionUID = 8082656235051L;

	private Integer actID;  // 活动编号

    private String actContent; // 活动内容及任务

    private String actPerInCharge;  // 负责人

    private String actProgress;   // 进展情况
    
	public Integer getActID() {
		return actID;
	}

	public void setActID(Integer actID) {
		this.actID = actID;
	}

	public String getActContent() {
		return actContent;
	}

	public void setActContent(String actContent) {
		this.actContent = actContent;
	}

	public String getActPerInCharge() {
		return actPerInCharge;
	}

	public void setActPerInCharge(String actPerInCharge) {
		this.actPerInCharge = actPerInCharge;
	}

	public String getActProgress() {
		return actProgress;
	}

	public void setActProgress(String actProgress) {
		this.actProgress = actProgress;
	}
}
