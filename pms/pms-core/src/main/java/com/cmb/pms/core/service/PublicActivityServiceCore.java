package com.cmb.pms.core.service;

import java.util.List;

import com.cmb.pms.core.model.PublicActivity;

/**
 * @author WuPing
 */

public interface PublicActivityServiceCore {

	public int getTotalNum(String actContent, String actPerInCharge, String actProgress);

    public List<PublicActivity> getPublicActivities(String actContent, String actPerInCharge, String actProgress,
	    int startIndex, int pageSize);

    public String insertPublicActivity(PublicActivity  publicActivity);
    
    public String deletePublicActivity(Integer actID);
    
    public PublicActivity getPublicActivityByID(Integer actID);
    
    public String updatePublicActivity(PublicActivity  publicActivity);
}
