package com.cmb.pms.client.dto;

import java.io.Serializable;

public class DevelopingReqDTO implements Serializable {

	private static final long serialVersionUID = 2630827197519955866L;

	private Integer reqID; // 系统编号, Primary Key
	
	private String reqNum; // 需求编号

    private String reqName; // 需求名称
    
    private String reqChildState; // 子状态 (子级状态，做状态内部划分)
    
    private String reqPriority;    // 优先级(A-最高, B-次高, C-...)
    
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

	public String getReqBusDepart() {
		return reqBusDepart;
	}

	public void setReqBusDepart(String reqBusDepart) {
		this.reqBusDepart = reqBusDepart;
	}

	public String getReqChildState() {
		return reqChildState;
	}

	public void setReqChildState(String reqChildState) {
		this.reqChildState = reqChildState;
	}

	public String getReqPriority() {
		return reqPriority;
	}

	public void setReqPriority(String reqPriority) {
		this.reqPriority = reqPriority;
	}

	public Integer getReqID() {
		return reqID;
	}

	public void setReqID(Integer reqID) {
		this.reqID = reqID;
	}

	public String getReqMember() {
		return reqMember;
	}

	public void setReqMember(String reqMember) {
		this.reqMember = reqMember;
	}

	public String getReqComment() {
		return reqComment;
	}

	public void setReqComment(String reqComment) {
		this.reqComment = reqComment;
	}

}