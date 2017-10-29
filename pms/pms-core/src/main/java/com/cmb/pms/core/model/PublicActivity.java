package com.cmb.pms.core.model;

import java.util.Date;

public class PublicActivity {
    private Integer actID;  // 活动编号

    private String actContent; // 活动内容及任务

    private String actPerInCharge;  // 负责人

    private String actProgress;   // 进展情况

    private Date actCreTime;  // 记录生成时间

    private Date actModTime;  // 记录更新时间

    private String actCreator;  // 创建人

    private String actModifier; // 修改人

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

	public Date getActCreTime() {
		return actCreTime;
	}

	public void setActCreTime(Date actCreTime) {
		this.actCreTime = actCreTime;
	}

	public Date getActModTime() {
		return actModTime;
	}

	public void setActModTime(Date actModTime) {
		this.actModTime = actModTime;
	}

	public String getActCreator() {
		return actCreator;
	}

	public void setActCreator(String actCreator) {
		this.actCreator = actCreator;
	}

	public String getActModifier() {
		return actModifier;
	}

	public void setActModifier(String actModifier) {
		this.actModifier = actModifier;
	}

}