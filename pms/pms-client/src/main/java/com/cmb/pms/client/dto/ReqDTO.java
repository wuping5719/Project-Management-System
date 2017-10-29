package com.cmb.pms.client.dto;

import java.io.Serializable;

public class ReqDTO implements Serializable {

	private static final long serialVersionUID = -54537653073038440L;

	private Integer reqID; // 系统编号, Primary Key

    private String reqNum; // 需求编号

    private String reqName; // 需求名称
     
    private String reqState; // 状态 (父级状态，做大类区分, 01-预研,02-意向性, 04-暂缓)
    
    private String reqChildState; // 子状态 (子级状态，做状态内部划分)
    
    private String reqAssessmentDate;  // 需求评估日期
    
    private String reqScheduleStartDate;  // 计划启动日期
    
    private String reqScheduleDate; // 排期（计划结束时间）
    
    private String reqStartDate;  // 立项时间
    
    private String reqOrganizeType; // 主/辅办 
    
    private String reqPriority;    // 优先级(A-最高, B-次高, C-...)
    
    private String reqContent;  // （主要内容）需求内容
    
    private String reqPerInCharge; // 负责人

    private String reqMember; // 其他成员
    
    private String reqAssessment; // 评估意见

    private String reqAuthor;  // 需求提交人
    
    private String reqBusDepart;  // 业务部门

    private String reqComment; // 备注
    
	public Integer getReqID() {
		return reqID;
	}

	public void setReqID(Integer reqID) {
		this.reqID = reqID;
	}

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

	public String getReqState() {
		return reqState;
	}

	public void setReqState(String reqState) {
		this.reqState = reqState;
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

	public String getReqChildState() {
		return reqChildState;
	}

	public void setReqChildState(String reqChildState) {
		this.reqChildState = reqChildState;
	}

	public String getReqAssessmentDate() {
		return reqAssessmentDate;
	}

	public void setReqAssessmentDate(String reqAssessmentDate) {
		this.reqAssessmentDate = reqAssessmentDate;
	}

	public String getReqScheduleStartDate() {
		return reqScheduleStartDate;
	}

	public void setReqScheduleStartDate(String reqScheduleStartDate) {
		this.reqScheduleStartDate = reqScheduleStartDate;
	}

	public String getReqAuthor() {
		return reqAuthor;
	}

	public void setReqAuthor(String reqAuthor) {
		this.reqAuthor = reqAuthor;
	}

}