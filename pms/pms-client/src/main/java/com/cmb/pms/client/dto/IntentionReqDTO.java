package com.cmb.pms.client.dto;

import java.io.Serializable;

public class IntentionReqDTO implements Serializable {

	private static final long serialVersionUID = 3149889681943018257L;

	private Integer reqID; // 系统编号, Primary Key
	
	private String reqNum; // 需求编号

    private String reqName; // 需求名称
    
    private String reqBusDepart; // 业务部门

    private String reqChildState; // 子状态 (子级状态，做状态内部划分)
    
    private String reqPriority;    // 优先级(A-最高, B-次高, C-...)
    
    private String reqContent;  // （主要内容）需求内容
    
    private String reqPerInCharge; // 负责人
    
    private String reqAssessment; // 评估意见
    
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

	public String getReqContent() {
		return reqContent;
	}

	public void setReqContent(String reqContent) {
		this.reqContent = reqContent;
	}

	public String getReqAssessment() {
		return reqAssessment;
	}

	public void setReqAssessment(String reqAssessment) {
		this.reqAssessment = reqAssessment;
	}

	public Integer getReqID() {
		return reqID;
	}

	public void setReqID(Integer reqID) {
		this.reqID = reqID;
	}

}