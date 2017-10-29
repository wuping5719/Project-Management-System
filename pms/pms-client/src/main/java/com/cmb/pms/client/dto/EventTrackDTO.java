package com.cmb.pms.client.dto;

import java.io.Serializable;

/*modified by ChenQian:the type of conSTStaTime、conUATStaTime、conExOnlineDate from String to Date*/

public class EventTrackDTO implements Serializable{
	
	private static final long serialVersionUID = 8182652055151L;

	private Integer eveTraID;  // 系统生成，Primary Key

    private String eveTraReqName;  // 需求名称

    private String eveTraState;  // 状态
    
    private String eveTraProgress; // 进展

    private String eveTraContent; // 主要内容
    
    private String eveTraPerInCharge;  // 负责人

	public Integer getEveTraID() {
		return eveTraID;
	}

	public void setEveTraID(Integer eveTraID) {
		this.eveTraID = eveTraID;
	}

	public String getEveTraReqName() {
		return eveTraReqName;
	}

	public void setEveTraReqName(String eveTraReqName) {
		this.eveTraReqName = eveTraReqName;
	}

	public String getEveTraState() {
		return eveTraState;
	}

	public void setEveTraState(String eveTraState) {
		this.eveTraState = eveTraState;
	}

	public String getEveTraProgress() {
		return eveTraProgress;
	}

	public void setEveTraProgress(String eveTraProgress) {
		this.eveTraProgress = eveTraProgress;
	}

	public String getEveTraContent() {
		return eveTraContent;
	}

	public void setEveTraContent(String eveTraContent) {
		this.eveTraContent = eveTraContent;
	}

	public String getEveTraPerInCharge() {
		return eveTraPerInCharge;
	}

	public void setEveTraPerInCharge(String eveTraPerInCharge) {
		this.eveTraPerInCharge = eveTraPerInCharge;
	}
    
}
