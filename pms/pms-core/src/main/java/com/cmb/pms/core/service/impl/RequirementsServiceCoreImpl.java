package com.cmb.pms.core.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.cmb.pms.core.service.RequirementsServiceCore;
import com.cmb.pms.core.dao.RequirementsDAO;
import com.cmb.pms.core.model.Requirements;

public class RequirementsServiceCoreImpl implements RequirementsServiceCore {

	private RequirementsDAO requirementsDAO;

	@Override
	public int getTotalNum(Map<String,String> condition, String reqState) {
		String reqNum = condition.get("reqNum"); 
		String reqName = condition.get("reqName");
		String reqPerInCharge = condition.get("reqPerInCharge");
		String strAssessmentDateStart = condition.get("assessmentDateStart");
		String strAssessmentDateEnd = condition.get("assessmentDateEnd");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date assessmentDateStart = null;
		if (strAssessmentDateStart != null && !"".equals(strAssessmentDateStart.trim())) {
			try {
				assessmentDateStart = sdf.parse(strAssessmentDateStart.trim());				
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		Date assessmentDateEnd = null;
		if (strAssessmentDateEnd != null && !"".equals(strAssessmentDateEnd.trim())) {
			try {
				assessmentDateEnd = sdf.parse(strAssessmentDateEnd.trim());				
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return requirementsDAO.selectTotalNum(reqNum, reqName, reqPerInCharge, 
				assessmentDateStart, assessmentDateEnd, reqState);
	}

	@Override
    public List<Requirements> getRequirements(Map<String,String> condition,
    		String reqState, int startIndex, int pageSize) {
		String reqNum = condition.get("reqNum"); 
		String reqName = condition.get("reqName");
		String reqPerInCharge = condition.get("reqPerInCharge");
		String strAssessmentDateStart = condition.get("assessmentDateStart");
		String strAssessmentDateEnd = condition.get("assessmentDateEnd");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date assessmentDateStart = null;
		if (strAssessmentDateStart != null && !"".equals(strAssessmentDateStart.trim())) {
			try {
				assessmentDateStart = sdf.parse(strAssessmentDateStart.trim());				
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		Date assessmentDateEnd = null;
		if (strAssessmentDateEnd != null && !"".equals(strAssessmentDateEnd.trim())) {
			try {
				assessmentDateEnd = sdf.parse(strAssessmentDateEnd.trim());				
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
    	return requirementsDAO.selectRequirements(reqNum, reqName, reqPerInCharge,
    			assessmentDateStart, assessmentDateEnd, reqState, startIndex, pageSize);
    }

	@Override
	public String insertRequirement(Requirements  requirement) {
		try {
			// 日期判空处理
			String reqAssessmentDateStr = requirement.getReqAssessmentDate();
			if (reqAssessmentDateStr == null || "".equals(reqAssessmentDateStr)) {
				requirement.setReqAssessmentDate(null);
			}
			String reqScheduleDateStr = requirement.getReqScheduleDate();
			if (reqScheduleDateStr == null || "".equals(reqScheduleDateStr)) {
				requirement.setReqScheduleDate(null);
			}
			String reqScheduleStartDateStr = requirement.getReqScheduleStartDate();
			if (reqScheduleStartDateStr == null || "".equals(reqScheduleStartDateStr)) {
				requirement.setReqScheduleStartDate(null);
			}
			String reqStartDateStr = requirement.getReqStartDate();
			if (reqStartDateStr == null || "".equals(reqStartDateStr)) {
				requirement.setReqStartDate(null);
			}
			
			int result = requirementsDAO.insertSelective(requirement);
			return "success: " + result;
		} 
		catch (Exception e) {
			e.printStackTrace();
			return "failure";
		}
    }
	
	@Override
	public String deleteRequirement(Integer reqID) {
		try {
			int result = requirementsDAO.deleteByPrimaryKey(reqID);
			return "success: " + result;
		} 
		catch (Exception e) {
			e.printStackTrace();
			return "failure";
		}
	}
	
	@Override
	public Requirements getRequirementByID(Integer reqID) {
		return requirementsDAO.selectByPrimaryKey(reqID);
	}
	
	@Override
	public String updateRequirement(Requirements requirement) {
		try {
			// 日期判空处理
			String reqAssessmentDateStr = requirement.getReqAssessmentDate();
			if (reqAssessmentDateStr == null || "".equals(reqAssessmentDateStr)) {
				requirement.setReqAssessmentDate(null);
			}
			String reqScheduleDateStr = requirement.getReqScheduleDate();
			if (reqScheduleDateStr == null || "".equals(reqScheduleDateStr)) {
				requirement.setReqScheduleDate(null);
			}
			String reqScheduleStartDateStr = requirement.getReqScheduleStartDate();
			if (reqScheduleStartDateStr == null || "".equals(reqScheduleStartDateStr)) {
				requirement.setReqScheduleStartDate(null);
			}
			String reqStartDateStr = requirement.getReqStartDate();
			if (reqStartDateStr == null || "".equals(reqStartDateStr)) {
				requirement.setReqStartDate(null);
			}

			int result = requirementsDAO.updateByPrimaryKeySelective(requirement);
			return "success: " + result;
		} catch (Exception e) {
			e.printStackTrace();
			return "failure";
		}
	}
	
	@Override
	public int countReqByReqNum(String reqNum) {
		return requirementsDAO.countReqByReqNum(reqNum);
	}
	
	public RequirementsDAO getRequirementsDAO() {
		return requirementsDAO;
	}

	public void setRequirementsDAO(RequirementsDAO requirementsDAO) {
		this.requirementsDAO = requirementsDAO;
	}
}
