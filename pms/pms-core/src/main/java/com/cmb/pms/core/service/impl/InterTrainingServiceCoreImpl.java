package com.cmb.pms.core.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.cmb.pms.core.service.InterTrainingServiceCore;
import com.cmb.pms.core.dao.InterTrainingDAO;
import com.cmb.pms.core.model.InterTraining;

public class InterTrainingServiceCoreImpl implements InterTrainingServiceCore {

	private InterTrainingDAO interTrainingDAO;

	@Override
	public int getTotalNum(String traSpeaker, String traTime, String traContent) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date traTimePar = null;    
		if( !"".equals(traTime.trim()) ) {
		    try {
		    	traTimePar = sdf.parse(traTime.trim());
		    } catch (ParseException e) {
			     e.printStackTrace();
		    }
		}
		return interTrainingDAO.selectTotalNum(traSpeaker, traTimePar, traContent);
	}

	@Override
	public List<InterTraining> getInterTrainings(String traSpeaker, String traTime, String traContent,
		    int startIndex, int pageSize) {
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date traTimePar = null;    
		if( !"".equals(traTime.trim()) ) {
		    try {
		    	traTimePar = sdf.parse(traTime.trim());
		    } catch (ParseException e) {
			     e.printStackTrace();
		    }
		}
    	return interTrainingDAO.selectInterTrainings(traSpeaker, traTimePar, traContent, startIndex, pageSize);
    }
    
	@Override
	public String insertInterTraining(InterTraining  interTraining) {
		try {
			interTrainingDAO.insertSelective(interTraining);
	    	return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failure";
		}
    }
	
	@Override
	public String deleteInterTraining(Integer traID) {
		try {
			int result = interTrainingDAO.deleteByPrimaryKey(traID);
			return "success: " + result;
		} 
		catch (Exception e) {
			e.printStackTrace();
			return "failure";
		}
	}
	
	@Override
	public InterTraining getInterTrainingByID(Integer traID) {
		return interTrainingDAO.selectByPrimaryKey(traID);
	}
	
	@Override
	public String updateInterTraining(InterTraining  interTraining) {
		try {
			int result = interTrainingDAO.updateByPrimaryKeySelective(interTraining);
			return "success: " + result;
		} 
		catch (Exception e) {
			e.printStackTrace();
			return "failure";
		}
	}
	
	public InterTrainingDAO getInterTrainingDAO() {
		return interTrainingDAO;
	}

	public void setInterTrainingDAO(InterTrainingDAO interTrainingDAO) {
		this.interTrainingDAO = interTrainingDAO;
	}
}
