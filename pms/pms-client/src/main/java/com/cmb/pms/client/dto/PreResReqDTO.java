package com.cmb.pms.client.dto;

import java.io.Serializable;

public class PreResReqDTO implements Serializable {

	private static final long serialVersionUID = -2336621468697844528L;

	private Integer reqID; // 系统编号, Primary Key
	
	private String reqNum; // 需求编号

    private String reqName; // 需求名称

    private String reqChildState; // 子状态 (子级状态，做状态内部划分)
    
    private String reqScheduleDate; // 排期（计划结束时间）
    
    private String reqStartDate;  // 立项时间
    
    private String reqOrganizeType; // 主/辅办 

    private String reqPerInCharge; // 负责人

    private String reqMember; // 其他成员

    private String reqBusDepart; // 业务部门

    private String reqComment; // 备注

	public String getReqNum() {
		return reqNum;
	}

	public void setReqNum(String reqNum) {
		this.reqNum = reqNum;
	}

	public String getReqName() {
		return reqName;
	}

	public void setReqName(String reqName) {
		this.reqName = reqName;
	}

	public String getReqPerInCharge() {
		return reqPerInCharge;
	}

	public void setReqPerInCharge(String reqPerInCharge) {
		this.reqPerInCharge = reqPerInCharge;
	}

	public String getReqMember() {
		return reqMember;
	}

	public void setReqMember(String reqMember) {
		this.reqMember = reqMember;
	}

	public String getReqBusDepart() {
		return reqBusDepart;
	}

	public void setReqBusDepart(String reqBusDepart) {
		this.reqBusDepart = reqBusDepart;
	}

	public String getReqComment() {
		return reqComment;
	}

	public void setReqComment(String reqComment) {
		this.reqComment = reqComment;
	}

	public String getReqScheduleDate() {
		return reqScheduleDate;
	}

	public void setReqScheduleDate(String reqScheduleDate) {
		this.reqScheduleDate = reqScheduleDate;
	}

	public String getReqStartDate() {
		return reqStartDate;
	}

	public void setReqStartDate(String reqStartDate) {
		this.reqStartDate = reqStartDate;
	}

	public String getReqOrganizeType() {
		return reqOrganizeType;
	}

	public void setReqOrganizeType(String reqOrganizeType) {
		this.reqOrganizeType = reqOrganizeType;
	}

	public String getReqChildState() {
		return reqChildState;
	}

	public void setReqChildState(String reqChildState) {
		this.reqChildState = reqChildState;
	}

	public Integer getReqID() {
		return reqID;
	}

	public void setReqID(Integer reqID) {
		this.reqID = reqID;
	}

}