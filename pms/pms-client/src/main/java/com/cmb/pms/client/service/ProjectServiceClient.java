package com.cmb.pms.client.service;

import java.util.Map;

import com.cmb.pms.client.dto.ProjectDTO;

/**
 * @author ChenQian
 */

public interface ProjectServiceClient {
	
    public String getProjectLists(String projNumber, String projReqNum,String projName,String projPerInCharge,String projState,int pageNum);
    
    public String getFinishProjectLists(Map<String,String> serchCondition, int pageNum);
    
    public String getProject(String projNumber);  // 用于新建项目中，若项目已经存在根据项目编号查询获取剩余项信息
    
    public String saveProject(ProjectDTO projectDTO);
	
	public String deleteProject(String conID);
	
	public String updateProject(ProjectDTO projectDTO);
	
	public String getProjReqNum();
}
