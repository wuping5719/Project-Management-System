package com.cmb.pms.core.service.impl;

import java.util.List;

import com.cmb.pms.core.service.ProgramConflictServiceCore;
import com.cmb.pms.core.dao.ProgramConflictDAO;
import com.cmb.pms.core.dao.ProjectDAO;
import com.cmb.pms.core.model.ProgramConflict;
import com.cmb.pms.core.model.Project;

public class ProgramConflictServiceCoreImpl implements ProgramConflictServiceCore {

	private ProgramConflictDAO programConflictDAO;
	
	private ProjectDAO projectDAO;

	@Override
	public int getTotalNum(String conProName, String conProID,String conProjName, String conPerInCharge) {
		return programConflictDAO.selectTotalNum(conProName, conProID,conProjName, conPerInCharge);
	}

	@Override
    public List<ProgramConflict> getProgramConflicts(String conProName, String conProID,String conProjName, String conPerInCharge,
	    int startIndex, int pageSize) {
    	return programConflictDAO.selectProgramConflict(conProName, conProID,conProjName, conPerInCharge, startIndex, pageSize);
    }

	@Override
    public String insertProgramConflict(ProgramConflict  programConflict) {
		programConflictDAO.insertSelective(programConflict);
    	return "success";
    }
	
	@Override
	public String deleteProgramConflict(String conID){
		programConflictDAO.deleteByPrimaryKey(Integer.valueOf(conID));
    	return "success";
	}
	
	@Override
	public ProgramConflict getProgramConflictByID(String conID){		
		return programConflictDAO.selectByPrimaryKey(Integer.valueOf(conID));
	}
	
	@Override
	public String updateProgramConflict(ProgramConflict programConflict){
		programConflictDAO.updateByPrimaryKeySelective(programConflict);
		programConflictDAO.updateByProName(programConflict);
		return "success";
	}
	
	@Override
	public Project getConProject(String conProID){
		return projectDAO.selectByProjNumber(conProID);
	}
	
	@Override
	public List<String> getConProjNumber(){
		return projectDAO.selectProjNumber();
	}
	
	public ProgramConflictDAO getProgramConflictDAO() {
		return programConflictDAO;
	}

	public void setProgramConflictDAO(ProgramConflictDAO programConflictDAO) {
		this.programConflictDAO = programConflictDAO;
	}
	
	public ProjectDAO getProjectDAO() {
		return projectDAO;
	}

	public void setProjectDAO(ProjectDAO projectDAO) {
		this.projectDAO = projectDAO;
	}
}
