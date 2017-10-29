package com.cmb.pms.core.model;

import java.util.Date;

/*modified by ChenQian: type of projDependID from Integer to String */

public class Project {
    private Integer projID;  // 系统编号: 系统生成，Primary Key

    private String projNumber; // 项目编号

    private String projReqNum; // 需求编号
    
    private String projName;  // 项目名称
    
    private Date projStartDate;  // 立项时间

    private Date projSTStartDate;  // ST开始时间
    
    private Date projSTEndDate;  // ST结束时间(实际)

    private Date projUATStartDate;  // UAT开始时间
    
    private Date projOnlineDate;  // 上线时间

    private Date projExpEndDate; // 计划结束时间

    private String projOrganizeType; // 主/辅办 

    private String projPerInCharge;  // 开发(项目)负责人

    private Float projFuncPoint; // 功能点估算
    
    private String projMember; // 其他成员

    private String projCurState; // 目前状态

    private String projDependID;  // 程序版本依赖关系

    private String projCouBusiness; // 对口业务

    private String projRemark; // 备注

    private Date projCreTime; // 记录生成时间

    private Date projModTime; // 记录更新时间

    private String projCreator; // 创建人

    private String projModifier;  // 修改人

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

	public Date getProjOnlineDate() {
		return projOnlineDate;
	}

	public void setProjOnlineDate(Date projOnlineDate) {
		this.projOnlineDate = projOnlineDate;
	}

	public Date getProjExpEndDate() {
		return projExpEndDate;
	}

	public void setProjExpEndDate(Date projExpEndDate) {
		this.projExpEndDate = projExpEndDate;
	}

	public String getProjOrganizeType() {
		return projOrganizeType;
	}

	public void setProjOrganizeType(String projOrganizeType) {
		this.projOrganizeType = projOrganizeType;
	}

	public String getProjMember() {
		return projMember;
	}

	public void setProjMember(String projMember) {
		this.projMember = projMember;
	}

	public String getProjCurState() {
		return projCurState;
	}

	public void setProjCurState(String projCurState) {
		this.projCurState = projCurState;
	}

	public String getProjDependID() {
		return projDependID;
	}

	public void setProjDependID(String projDependID) {
		this.projDependID = projDependID;
	}

	public String getProjCouBusiness() {
		return projCouBusiness;
	}

	public void setProjCouBusiness(String projCouBusiness) {
		this.projCouBusiness = projCouBusiness;
	}

	public String getProjRemark() {
		return projRemark;
	}

	public void setProjRemark(String projRemark) {
		this.projRemark = projRemark;
	}

	public Date getProjCreTime() {
		return projCreTime;
	}

	public void setProjCreTime(Date projCreTime) {
		this.projCreTime = projCreTime;
	}

	public Date getProjModTime() {
		return projModTime;
	}

	public void setProjModTime(Date projModTime) {
		this.projModTime = projModTime;
	}

	public String getProjCreator() {
		return projCreator;
	}

	public void setProjCreator(String projCreator) {
		this.projCreator = projCreator;
	}

	public String getProjModifier() {
		return projModifier;
	}

	public void setProjModifier(String projModifier) {
		this.projModifier = projModifier;
	}

	public String getProjReqNum() {
		return projReqNum;
	}

	public void setProjReqNum(String projReqNum) {
		this.projReqNum = projReqNum;
	}

	public Date getProjSTStartDate() {
		return projSTStartDate;
	}

	public void setProjSTStartDate(Date projSTStartDate) {
		this.projSTStartDate = projSTStartDate;
	}

	public Date getProjSTEndDate() {
		return projSTEndDate;
	}

	public void setProjSTEndDate(Date projSTEndDate) {
		this.projSTEndDate = projSTEndDate;
	}

	public Date getProjUATStartDate() {
		return projUATStartDate;
	}

	public void setProjUATStartDate(Date projUATStartDate) {
		this.projUATStartDate = projUATStartDate;
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
    
}