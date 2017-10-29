package com.cmb.pms.core.service;

import java.util.List;
import java.util.Map;

import com.cmb.pms.core.model.Project;

/**
 * @author ChenQian
 */

public interface ProjectServiceCore {

	public int getTotalNum(String projNumber,String projReqNum,String projName, String projPerInCharge,String projState);

    public List<Project> getProjects(String projNumber,String projReqNum,String projName, String projPerInCharge,String projState,
	    int startIndex, int pageSize);
    
    public int getFinishTotalNum(Map<String,String> serchCondition);

    public List<Project> getFinishProjects(Map<String,String> serchCondition, int startIndex, int pageSize);
    
    public String insertProject(Project  project);
   
    public String deleteProject(String projID);
    
    public Project getProjectByID(String projID);
    
    public Project getProjectByProjNum(String projNumber);
    
    public String updateProject(Project project);
        
    public List<String> getProjReqNum();
    
    public int countReqNum(String projReqNum);

}