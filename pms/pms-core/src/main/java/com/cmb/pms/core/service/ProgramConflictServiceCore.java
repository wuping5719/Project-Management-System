package com.cmb.pms.core.service;

import java.util.List;

import com.cmb.pms.core.model.ProgramConflict;
import com.cmb.pms.core.model.Project;

/**
 * @author ChenQian
 */

public interface ProgramConflictServiceCore {

	public int getTotalNum(String conProName,String conProID,String conProjName, String conPerInCharge);

    public List<ProgramConflict> getProgramConflicts(String conProName,String conProID,String conProjName, String conPerInCharge,
	    int startIndex, int pageSize);
    
    public String insertProgramConflict(ProgramConflict  programConflict);
   
    public String deleteProgramConflict(String conID);
    
    public ProgramConflict getProgramConflictByID(String conID);
    
    public String updateProgramConflict(ProgramConflict programConflict);
    
    public Project getConProject(String conID);
    
    public List<String> getConProjNumber();

}
