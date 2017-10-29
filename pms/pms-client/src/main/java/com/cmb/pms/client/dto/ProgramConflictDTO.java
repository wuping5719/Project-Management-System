package com.cmb.pms.client.dto;

import java.io.Serializable;
import java.util.Date;

/*modified by ChenQian:the type of conSTStaTime、conUATStaTime、conExOnlineDate from String to Date*/

public class ProgramConflictDTO implements Serializable{
	
	private static final long serialVersionUID = 8182653455151L;

	private Integer conID;  // 冲突编号

    private String conProName; // 程序名
    
    private String conProID; //项目编号

    private String conProjName;  // 冲突项目名

    private String conPerInCharge;   // 负责人
    
    private String conSolution;     //解决方案	
    
    private Date conSTStaTime;   //ST开始时间
    
    private Date conUATStaTime;   //UAT开始时间
    
    private Date conExOnlineDate;   //上线日期
	    
	public Integer getConID() {
		return conID;
	}

	public void setConID(Integer conID) {
		this.conID = conID;
	}

	public String getConProName() {
		return conProName;
	}

	public void setConProName(String conProName) {
		this.conProName = conProName;
	}

	
	public String getConProID() {
		return conProID;
	}

	public void setConProID(String conProID) {
		this.conProID = conProID;
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
	
	public String getConSolution() {
		return conSolution;
	}

	public void setConSolution(String conSolution) {
		this.conSolution = conSolution;
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

	public Date getConExOnlineDate() {
		return conExOnlineDate;
	}

	public void setConExOnlineDate(Date conExOnlineDate) {
		this.conExOnlineDate = conExOnlineDate;
	}
	
	
}
