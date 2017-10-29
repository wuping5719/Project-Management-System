package com.cmb.pms.client.service;

import com.cmb.pms.client.dto.ProgramConflictDTO;

/**
 * @author ChenQian
 */

public interface ProgramConflictServiceClient {
	
    public String getProgramConflictLists(String conProName, String conProID,String conProjName,String conPerInCharge,int pageNum);
    
	public String saveProgramConflict(ProgramConflictDTO programConflictDTO);
	
	public String deleteProgramConflict(String conID);
	
	public String updateProgramConflict(ProgramConflictDTO programConflictDTO);
	
	public String getConProject(String conProID);
	
	public String getConProjNumber();
}
