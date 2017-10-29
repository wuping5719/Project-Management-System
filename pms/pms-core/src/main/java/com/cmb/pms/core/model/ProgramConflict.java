package com.cmb.pms.core.model;

import java.util.Date;

public class ProgramConflict {
    private Integer conID;      // 系统生成，Primary Key

    private String conProID;  // 程序编号

    private String conProName;   // 程序名称

    private String conProjName;   // 项目名称

    private String conPerInCharge; // 负责人

    private Date conSTStaTime;  // ST开始时间

    private Date conUATStaTime;  // UAT开始时间

    private Date conExOnlineDate;  // 预计上线时间
    
    private String conSolution;  // 解决方案

    private Date conCreTime; // 记录生成时间

    private Date conModTime;  // 记录更新时间

    private String conCreator;  // 创建人

    private String conModifier;  // 修改人

	public Integer getConID() {
		return conID;
	}

	public void setConID(Integer conID) {
		this.conID = conID;
	}

	public String getConProID() {
		return conProID;
	}

	public void setConProID(String conProID) {
		this.conProID = conProID;
	}

	public String getConProName() {
		return conProName;
	}

	public void setConProName(String conProName) {
		this.conProName = conProName;
	}

	public String getConProjName() {
		return conProjName;
	}

	public void setConProjName(String conProjName) {
		this.conProjName = conProjName;
	}

	public String getConPerInCharge() {
		return conPerInCharge;
	}

	public void setConPerInCharge(String conPerInCharge) {
		this.conPerInCharge = conPerInCharge;
	}

	public Date getConSTStaTime() {
		return conSTStaTime;
	}

	public void setConSTStaTime(Date conSTStaTime) {
		this.conSTStaTime = conSTStaTime;
	}

	public Date getConUATStaTime() {
		return conUATStaTime;
	}

	public void setConUATStaTime(Date conUATStaTime) {
		this.conUATStaTime = conUATStaTime;
	}

	public String getConSolution() {
		return conSolution;
	}

	public void setConSolution(String conSolution) {
		this.conSolution = conSolution;
	}

	public Date getConCreTime() {
		return conCreTime;
	}

	public void setConCreTime(Date conCreTime) {
		this.conCreTime = conCreTime;
	}

	public Date getConModTime() {
		return conModTime;
	}

	public void setConModTime(Date conModTime) {
		this.conModTime = conModTime;
	}

	public String getConCreator() {
		return conCreator;
	}

	public void setConCreator(String conCreator) {
		this.conCreator = conCreator;
	}

	public String getConModifier() {
		return conModifier;
	}

	public void setConModifier(String conModifier) {
		this.conModifier = conModifier;
	}

	public Date getConExOnlineDate() {
		return conExOnlineDate;
	}

	public void setConExOnlineDate(Date conExOnlineDate) {
		this.conExOnlineDate = conExOnlineDate;
	}

}