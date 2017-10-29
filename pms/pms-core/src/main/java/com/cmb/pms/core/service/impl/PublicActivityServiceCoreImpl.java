package com.cmb.pms.core.service.impl;

import java.util.List;

import com.cmb.pms.core.service.PublicActivityServiceCore;
import com.cmb.pms.core.dao.PublicActivityDAO;
import com.cmb.pms.core.model.PublicActivity;

public class PublicActivityServiceCoreImpl implements PublicActivityServiceCore {

	private PublicActivityDAO publicActivityDAO;

	@Override
	public int getTotalNum(String actContent, String actPerInCharge, String actProgress) {
		return publicActivityDAO.selectTotalNum(actContent, actPerInCharge, actProgress);
	}

	@Override
    public List<PublicActivity> getPublicActivities(String actContent, String actPerInCharge, String actProgress,
	    int startIndex, int pageSize) {
    	return publicActivityDAO.selectPublicActivities(actContent, actPerInCharge, actProgress, startIndex, pageSize);
    }

	@Override
    public String insertPublicActivity(PublicActivity  publicActivity) {
    	try {
    		publicActivityDAO.insertSelective(publicActivity);
        	return "success";
    	}  catch (Exception e) {
			e.printStackTrace();
			return "failure";
		}
    }
	
	@Override
	public String deletePublicActivity(Integer actID) {
		try {
			int result = publicActivityDAO.deleteByPrimaryKey(actID);
			return "success: " + result;
		} 
		catch (Exception e) {
			e.printStackTrace();
			return "failure";
		}
	}
	
	@Override
	public PublicActivity getPublicActivityByID(Integer actID) {
		return publicActivityDAO.selectByPrimaryKey(actID);
	}
	
	@Override
	public String updatePublicActivity(PublicActivity  publicActivity) {
		try {
			int result = publicActivityDAO.updateByPrimaryKeySelective(publicActivity);
			return "success: " + result;
		} 
		catch (Exception e) {
			e.printStackTrace();
			return "failure";
		}
	}
	
	public PublicActivityDAO getPublicActivityDAO() {
		return publicActivityDAO;
	}

	public void setPublicActivityDAO(PublicActivityDAO publicActivityDAO) {
		this.publicActivityDAO = publicActivityDAO;
	}
}
