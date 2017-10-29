package com.cmb.pms.client.dto;

import java.io.Serializable;
import java.util.Date;

/*modified by ChenQian: type of projDependID from Integer to String */

public class ProjectDTO implements Serializable{
	
	private static final long serialVersionUID = 8182652335151L;
	
    private Integer projID;  // 系统编号: 系统生成，Primary Key
    
    private String projNumber; // 项目编号

    private String projReqNum; // 需求编号
    
    private String projName;  // 项目名称
    
    private Date projStartDate;  // 立项时间
   
    private Date projSTEndDate;  // ST结束时间(实际)
    
    private Date projOnlineDate;  // 上线时间
    
    private String projDependID;  // 程序版本依赖关系
    
    private String projCurState; // 目前状态

    private String projOrganizeType; // 主/辅办 

    private String projPerInCharge;  // 开发(项目)负责人

    private Float projFuncPoint; // 功能点估算

    private String projCouBusiness; // 对口业务
    
    private String projMember; // 成员

    private String projRemark; // 备注
    
    private Date projExpEndDate; // 计划结束时间（预研项目）

	public Integer getProjID() {
		return projID;
	}

	public void setProjID(Integer projID) {
		this.projID = projID;
	}

	public String getProjNumber() {
		return projNumber;
	}

	public void setProjNumber(String projNumber) {
		this.projNumber = projNumber;
	}

	public String getProjReqNum() {
		return projReqNum;
	}

	public void setProjReqNum(String projReqNum) {
		this.projReqNum = projReqNum;
	}

	public String getProjName() {
		return projName;
	}

	public void setProjName(String projName) {
		this.projName = projName;
	}

	public Date getProjStartDate() {
		return projStartDate;
	}

	public void setProjStartDate(Date projStartDate) {
		this.projStartDate = projStartDate;
	}

	public Date getProjSTEndDate() {
		return projSTEndDate;
	}

	public void setProjSTEndDate(Date projSTEndDate) {
		this.projSTEndDate = projSTEndDate;
	}

	public Date getProjOnlineDate() {
		return projOnlineDate;
	}

	public void setProjOnlineDate(Date projOnlineDate) {
		this.projOnlineDate = projOnlineDate;
	}

	public String getProjDependID() {
		return projDependID;
	}

	public void setProjDependID(String projDependID) {
		this.projDependID = projDependID;
	}

	public String getProjCurState() {
		return projCurState;
	}

	public void setProjCurState(String projCurState) {
		this.projCurState = projCurState;
	}

	public String getProjOrganizeType() {
		return projOrganizeType;
	}

	public void setProjOrganizeType(String projOrganizeType) {
		this.projOrganizeType = projOrganizeType;
	}

	public String getProjPerInCharge() {
		return projPerInCharge;
	}

	public void setProjPerInCharge(String projPerInCharge) {
		this.projPerInCharge = projPerInCharge;
	}

	public Float getProjFuncPoint() {
		return projFuncPoint;
	}

	public void setProjFuncPoint(Float projFuncPoint) {
		this.projFuncPoint = projFuncPoint;
	}

	public String getProjCouBusiness() {
		return projCouBusiness;
	}

	public void setProjCouBusiness(String projCouBusiness) {
		this.projCouBusiness = projCouBusiness;
	}
	
	public String getProjMember() {
		return projMember;
	}

	public void setProjMember(String projMember) {
		this.projMember = projMember;
	}

	public String getProjRemark() {
		return projRemark;
	}

	public void setProjRemark(String projRemark) {
		this.projRemark = projRemark;
	}

	public Date getProjExpEndDate() {
		return projExpEndDate;
	}

	public void setProjExpEndDate(Date projExpEndDate) {
		this.projExpEndDate = projExpEndDate;
	}
	
}
