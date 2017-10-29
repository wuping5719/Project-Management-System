package com.cmb.pms.core.model;

import java.util.Date;

public class EventTrack {
    private Integer eveTraID;  // 系统生成，Primary Key

    private String eveTraReqName;  // 需求名称

    private String eveTraState;  // 状态
    
    private String eveTraProgress; // 进展

    private String eveTraContent; // 主要内容
    
    private String eveTraPerInCharge;  // 负责人
    
    private Date eveTraCreTime;   // 记录生成时间

    private Date eveTraModTime;  // 记录更新时间

    private String eveTraCreator;  // 创建人

    private String eveTraModifier; // 修改人

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

	public Date getEveTraCreTime() {
		return eveTraCreTime;
	}

	public void setEveTraCreTime(Date eveTraCreTime) {
		this.eveTraCreTime = eveTraCreTime;
	}

	public Date getEveTraModTime() {
		return eveTraModTime;
	}

	public void setEveTraModTime(Date eveTraModTime) {
		this.eveTraModTime = eveTraModTime;
	}

	public String getEveTraCreator() {
		return eveTraCreator;
	}

	public void setEveTraCreator(String eveTraCreator) {
		this.eveTraCreator = eveTraCreator;
	}

	public String getEveTraModifier() {
		return eveTraModifier;
	}

	public void setEveTraModifier(String eveTraModifier) {
		this.eveTraModifier = eveTraModifier;
	}

	public String getEveTraPerInCharge() {
		return eveTraPerInCharge;
	}

	public void setEveTraPerInCharge(String eveTraPerInCharge) {
		this.eveTraPerInCharge = eveTraPerInCharge;
	}
    
}