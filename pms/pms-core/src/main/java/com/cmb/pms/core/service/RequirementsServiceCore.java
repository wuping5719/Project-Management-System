package com.cmb.pms.core.service;

import java.util.List;
import java.util.Map;

import com.cmb.pms.core.model.Requirements;

/**
 * @author WuPing
 */

public interface RequirementsServiceCore {

	public int getTotalNum(Map<String,String> condition, String reqState);

    public List<Requirements> getRequirements(Map<String,String> condition, 
    		        String reqState, int startIndex, int pageSize);
    
    public String insertRequirement(Requirements  requirement);
    
    public String deleteRequirement(Integer reqID);
    
    public Requirements getRequirementByID(Integer reqID);
    
    public String updateRequirement(Requirements  requirement);
    
    public int countReqByReqNum(String reqNum);
}
