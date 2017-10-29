package com.cmb.pms.core.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.cmb.pms.core.service.ProjectServiceCore;
import com.cmb.pms.core.dao.ProjectDAO;
import com.cmb.pms.core.model.Project;
import com.cmb.pms.core.dao.RequirementsDAO;
import com.cmb.pms.core.dao.ProgramConflictDAO;
import com.cmb.pms.core.model.ProgramConflict;

public class ProjectServiceCoreImpl implements ProjectServiceCore {
	
	private ProjectDAO projectDAO;
	
	private RequirementsDAO requirementsDAO;
	
	private ProgramConflictDAO programConflictDAO;
	
	@Override
	public int getTotalNum(String projNumber,String projReqNum,String projName, String projPerInCharge,String projState) {
		return projectDAO.selectTotalNum(projNumber, projReqNum,projName, projPerInCharge,projState);
	}

	@Override
    public List<Project> getProjects(String projNumber,String projReqNum,String projName, String projPerInCharge,String projState,
    	    int startIndex, int pageSize) {
    	return projectDAO.selectProject(projNumber, projReqNum,projName, projPerInCharge,projState, startIndex, pageSize);
    }
	
	@Override
	public int getFinishTotalNum(Map<String,String> serchCondition) {
		if(serchCondition.size()!=6){
			return 0;
		}
		String projNumber = serchCondition.get("projNumber"); 
		String projReqNum = serchCondition.get("projReqNum");
		String projName = serchCondition.get("projName");
		String projPerInCharge =serchCondition.get("projPerInCharge");
		String projOnlineStart =serchCondition.get("projOnlineStart");
		String projOnlineEnd =serchCondition.get("projOnlineEnd");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date projOnlineS = null;
		Date projOnlineE = null;
		if (projOnlineStart!=null&&!"".equals(projOnlineStart.trim())) {
			try {
				projOnlineS = sdf.parse(projOnlineStart.trim());				
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (projOnlineEnd!=null&&!"".equals(projOnlineEnd.trim())) {
			try {
				projOnlineE = sdf.parse(projOnlineEnd.trim());				
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return projectDAO.selectFinishTotalNum(projNumber, projReqNum,projName, projPerInCharge,projOnlineS,projOnlineE);
	}

	@Override
    public List<Project> getFinishProjects(Map<String,String> serchCondition,int startIndex, int pageSize) {
		if(serchCondition.size()!=6){
			return null;
		}			         
		String projNumber = serchCondition.get("projNumber"); 
		String projReqNum = serchCondition.get("projReqNum");
		String projName = serchCondition.get("projName");
		String projPerInCharge =serchCondition.get("projPerInCharge");
		String projOnlineStart =serchCondition.get("projOnlineStart");
		String projOnlineEnd =serchCondition.get("projOnlineEnd");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date projOnlineS = null;
		Date projOnlineE = null;
		if (projOnlineStart!=null&&!"".equals(projOnlineStart.trim())) {
			try {
				projOnlineS = sdf.parse(projOnlineStart.trim());				
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (projOnlineEnd!=null&&!"".equals(projOnlineEnd.trim())) {
			try {
				projOnlineE = sdf.parse(projOnlineEnd.trim());				
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
    	return projectDAO.selectFinishProject(projNumber, projReqNum,projName, projPerInCharge,projOnlineS,projOnlineE, startIndex, pageSize);
    }

	@Override
    public String insertProject(Project  project) {
		projectDAO.insertSelective(project);
    	return "success";
    }
	
	@Override
	public String deleteProject(String projID){
		String projNumString = projectDAO.selectByPrimaryKey(Integer.valueOf(projID)).getProjNumber();
		projectDAO.deleteByPrimaryKey(Integer.valueOf(projID));
		programConflictDAO.deleteByProjNumber(projNumString);
    	return "success";
	}
	
	@Override
	public Project getProjectByID(String projID){		
		return projectDAO.selectByPrimaryKey(Integer.valueOf(projID));
	}
	
	@Override
	public Project getProjectByProjNum(String projNumber){		
		return projectDAO.selectByProjNumber(projNumber);
	}

	
	@Override
	public String updateProject(Project project){		
		projectDAO.updateByPrimaryKeySelective(project);		
		//项目表中项目信息更新同时更新冲突程序表中项目信息
		if(project.getProjCurState().equals("16")){    //如果项目状态变成已完成，冲突程序中该项目将自动删除
			programConflictDAO.deleteByProjNumber(project.getProjNumber());
		}else{
			List<ProgramConflict> programConflictList = programConflictDAO.selectByProjNumber(project.getProjNumber()); 
			for (ProgramConflict programConflict : programConflictList){
				programConflict.setConProjName(project.getProjName());
				programConflict.setConPerInCharge(project.getProjPerInCharge());
				programConflict.setConSTStaTime(project.getProjSTStartDate());
				programConflict.setConUATStaTime(project.getProjUATStartDate());
				programConflict.setConExOnlineDate(project.getProjOnlineDate());
				programConflictDAO.updateByPrimaryKeySelective(programConflict);
			}
		}
		return "success";
	}
		
	@Override
	public List<String> getProjReqNum(){
		return requirementsDAO.selectReqNumber();
	}
	
	@Override
	public int countReqNum(String projReqNum) {
		return projectDAO.selectByReqNum(projReqNum);
	}

	public ProjectDAO getProjectDAO() {
		return projectDAO;
	}

	public void setProjectDAO(ProjectDAO projectDAO) {
		this.projectDAO = projectDAO;
	}

	public RequirementsDAO getRequirementsDAO() {
		return requirementsDAO;
	}

	public void setRequirementsDAO(RequirementsDAO requirementsDAO) {
		this.requirementsDAO = requirementsDAO;
	}

	public ProgramConflictDAO getProgramConflictDAO() {
		return programConflictDAO;
	}

	public void setProgramConflictDAO(ProgramConflictDAO programConflictDAO) {
		this.programConflictDAO = programConflictDAO;
	}
		
}
