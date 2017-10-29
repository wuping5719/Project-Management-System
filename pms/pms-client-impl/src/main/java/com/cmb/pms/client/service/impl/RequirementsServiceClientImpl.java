package com.cmb.pms.client.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.cmb.pms.client.dto.DeferReqDTO;
import com.cmb.pms.client.dto.DevelopingReqDTO;
import com.cmb.pms.client.dto.IntentionReqDTO;
import com.cmb.pms.client.dto.EstimatingReqDTO;
import com.cmb.pms.client.dto.PreResReqDTO;
import com.cmb.pms.client.dto.ReqDTO;
import com.cmb.pms.client.dto.WaitPerfectReqDTO;
import com.cmb.pms.client.service.RequirementsServiceClient;
import com.cmb.pms.client.util.PagingParameters;
import com.cmb.pms.core.service.ProjectServiceCore;
import com.cmb.pms.core.service.RequirementsServiceCore;
import com.cmb.pms.core.model.Requirements;

public class RequirementsServiceClientImpl implements RequirementsServiceClient {

	private RequirementsServiceCore requirementsServiceCore;
	
	private ProjectServiceCore projectServiceCore;

	@Override
	public String getReqList(Map<String,String> condition, int pageNum) {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = PagingParameters.PAGE_SIZE;
		int startIndex = 0; // 开始索引

		totalNum = requirementsServiceCore.getTotalNum(condition, null);

		totalPage = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;

		if (totalNum > 0) {
			if (pageNum <= 1) {
				startIndex = 0;
			} else {
				startIndex = pageNum * pageSize - pageSize;
			}
		} else {
			totalPage = 1;
		}
		
		List<Requirements> requirementsList = new ArrayList<>();
		requirementsList = requirementsServiceCore.getRequirements(condition, null, startIndex, pageSize);

		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (Requirements requirement : requirementsList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("reqAssessmentDate", requirement.getReqAssessmentDate());
			jsonObject.put("reqNum", requirement.getReqNum());
			jsonObject.put("reqName", requirement.getReqName());

			if ("01".equals(requirement.getReqState())) {
				jsonObject.put("reqState", "预研");
				jsonObject.put("backgroundColor", "#9ACD32");
			} else if ("02".equals(requirement.getReqState())) {
				jsonObject.put("reqState", "意向性");
				jsonObject.put("backgroundColor", "#87CEFA");
			} else if ("03".equals(requirement.getReqState())) {
				jsonObject.put("reqState", "待完善");    // 已退回 归到此类
				jsonObject.put("backgroundColor", "#FFDAB9");
			} else if ("04".equals(requirement.getReqState())) {
				jsonObject.put("reqState", "评估中 ");         // 待开发 归到此类
				jsonObject.put("backgroundColor", "#EEE8AA ");
			} else if ("05".equals(requirement.getReqState())) {
				jsonObject.put("reqState", "排期开发 ");      // 待开发 归到此类
				jsonObject.put("backgroundColor", "#FFE4E1");
			} else if ("06".equals(requirement.getReqState())) {
				jsonObject.put("reqState", "暂缓");
				jsonObject.put("backgroundColor", "#A9A9A9");
			} else if ("07".equals(requirement.getReqState())) {
				jsonObject.put("reqState", "开发中");
				jsonObject.put("backgroundColor", "#90EE90");
			} else if ("08".equals(requirement.getReqState())) {
				jsonObject.put("reqState", "已上线");     // 暂不涉及 归到此类
				jsonObject.put("backgroundColor", "#f5f5f5");
			}
			
			if (requirement.getReqScheduleStartDate() == null){
				jsonObject.put("reqScheduleStartDate", "");
			} else {
				jsonObject.put("reqScheduleStartDate", requirement.getReqScheduleStartDate());
			}
			
			jsonObject.put("reqContent", requirement.getReqContent());
			jsonObject.put("reqAuthor", requirement.getReqAuthor());
			jsonObject.put("reqBusDepart", requirement.getReqBusDepart());
			jsonObject.put("reqComment", requirement.getReqComment());
			jsonObject.put("reqID", requirement.getReqID());

			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("reqDTOsList", jsonArray);
		result.put("reqsTotalNum", totalNum);
		result.put("reqsTotalPage", totalPage);
		return JSONObject.fromObject(result).toString();
	}
	
	@Override
	public String deleteReq(Integer reqID, String reqNum) {
		int countReqNum = projectServiceCore.countReqNum(reqNum);
		if (countReqNum == 0) {
			requirementsServiceCore.deleteRequirement(reqID);
			return "0";
		} else {
			return "1";
		}
	}
	
	@Override
	public String selectReqByID(Integer reqID) {
		Requirements requirement = requirementsServiceCore.getRequirementByID(reqID);
		Map<String, String> result = new HashMap<String, String>(1);   
		result.put("reqNum", requirement.getReqNum());
		result.put("reqName", requirement.getReqName());
		result.put("reqState",  requirement.getReqState());
		result.put("reqAssessmentDate",  requirement.getReqAssessmentDate());
		result.put("reqScheduleStartDate",  requirement.getReqScheduleStartDate());
		result.put("reqStartDate", requirement.getReqStartDate());
		result.put("reqScheduleDate", requirement.getReqScheduleDate());
	    result.put("reqOrganizeType", requirement.getReqOrganizeType());
	    result.put("reqPriority", requirement.getReqPriority());
	    result.put("reqAssessment", requirement.getReqAssessment());
	    result.put("reqAuthor", requirement.getReqAuthor());
	    result.put("reqContent", requirement.getReqContent());
	    result.put("reqPerInCharge", requirement.getReqPerInCharge());
		result.put("reqMember", requirement.getReqMember());
		result.put("reqBusDepart", requirement.getReqBusDepart());
		result.put("reqComment", requirement.getReqComment());
		return JSONObject.fromObject(result).toString();      // 类似 JSON 的处理方式，采用Map返回结果
	}
	
	@Override
	public String updateReq(ReqDTO reqDTO) {
		Requirements requirement = new Requirements();
		requirement.setReqID(reqDTO.getReqID());
		
		requirement.setReqNum(reqDTO.getReqNum());
		requirement.setReqName(reqDTO.getReqName());
		
		if ("预研".equals(reqDTO.getReqState())) {
			requirement.setReqState("01");   
		} else if ("意向性".equals(reqDTO.getReqState())) {
			requirement.setReqState("02");   
		} else if ("待完善".equals(reqDTO.getReqState())) {
			requirement.setReqState("03");   
		} else if ("评估中".equals(reqDTO.getReqState())) {
			requirement.setReqState("04");   
		} else if ("排期开发".equals(reqDTO.getReqState())) {
			requirement.setReqState("05");   
		} else if ("暂缓".equals(reqDTO.getReqState())) {
			requirement.setReqState("06");   
		} else if ("开发中".equals(reqDTO.getReqState())) {
			requirement.setReqState("07");   
		} else if ("已上线".equals(reqDTO.getReqState())) {
			requirement.setReqState("08");   
		}
		
		requirement.setReqAssessmentDate(reqDTO.getReqAssessmentDate());
		requirement.setReqScheduleStartDate(reqDTO.getReqScheduleStartDate());
		requirement.setReqStartDate(reqDTO.getReqStartDate());
		requirement.setReqScheduleDate(reqDTO.getReqScheduleDate());
		
		if ("主办".equals(reqDTO.getReqOrganizeType())) {
			requirement.setReqOrganizeType("1");
		} else if ("辅办".equals(reqDTO.getReqOrganizeType()))  {
			requirement.setReqOrganizeType("2");
		}
		
		requirement.setReqPriority(reqDTO.getReqPriority());
		requirement.setReqContent(reqDTO.getReqContent());
		requirement.setReqPerInCharge(reqDTO.getReqPerInCharge());
		requirement.setReqMember(reqDTO.getReqMember());
		requirement.setReqAssessment(reqDTO.getReqAssessment());
		requirement.setReqAuthor(reqDTO.getReqAuthor());
		requirement.setReqBusDepart(reqDTO.getReqBusDepart());
		requirement.setReqComment(reqDTO.getReqComment());
		
		Date now = new Date();
		requirement.setReqModTime(now);
		requirement.setReqCreTime(null);
		requirement.setReqModifier("Admin");
		requirement.setReqCreator(null);
		
		return requirementsServiceCore.updateRequirement(requirement);
	}
	
	@Override
	public String saveReq(ReqDTO reqDTO) {
		Requirements requirement = new Requirements();
		requirement.setReqNum(reqDTO.getReqNum());
		requirement.setReqName(reqDTO.getReqName());
		
		if ("预研".equals(reqDTO.getReqState())) {
			requirement.setReqState("01");   
		} else if ("意向性".equals(reqDTO.getReqState())) {
			requirement.setReqState("02");   
		} else if ("待完善".equals(reqDTO.getReqState())) {
			requirement.setReqState("03");   
		} else if ("评估中".equals(reqDTO.getReqState())) {
			requirement.setReqState("04");   
		} else if ("排期开发".equals(reqDTO.getReqState())) {
			requirement.setReqState("05");   
		} else if ("暂缓".equals(reqDTO.getReqState())) {
			requirement.setReqState("06");   
		} else if ("开发中".equals(reqDTO.getReqState())) {
			requirement.setReqState("07");   
		}  else if ("已上线".equals(reqDTO.getReqState())) {
			requirement.setReqState("08");   
		}
		
		// 需求子状态
		requirement.setReqChildState("01");
		
		requirement.setReqAssessmentDate(reqDTO.getReqAssessmentDate());
		requirement.setReqScheduleStartDate(reqDTO.getReqScheduleStartDate());
		requirement.setReqStartDate(reqDTO.getReqStartDate());
		requirement.setReqScheduleDate(reqDTO.getReqScheduleDate());
		
		if ("主办".equals(reqDTO.getReqOrganizeType())) {
			requirement.setReqOrganizeType("1");
		} else if ("辅办".equals(reqDTO.getReqOrganizeType()))  {
			requirement.setReqOrganizeType("2");
		}
		
		requirement.setReqPriority(reqDTO.getReqPriority());
		requirement.setReqContent(reqDTO.getReqContent());
		requirement.setReqPerInCharge(reqDTO.getReqPerInCharge());
		requirement.setReqMember(reqDTO.getReqMember());
		requirement.setReqAssessment(reqDTO.getReqAssessment());
		requirement.setReqAuthor(reqDTO.getReqAuthor());
		requirement.setReqBusDepart(reqDTO.getReqBusDepart());
		requirement.setReqComment(reqDTO.getReqComment());
		
		Date now = new Date();
		requirement.setReqCreTime(now);
		requirement.setReqModTime(now);
		requirement.setReqCreator("Admin");
		requirement.setReqModifier("Admin");
		
		return requirementsServiceCore.insertRequirement(requirement);
	}
	
	@Override
	public boolean isHasReq(String reqNum) {
	   int count = requirementsServiceCore.countReqByReqNum(reqNum);
	   if (count == 0) {
		   return false;
	   } else {
		   return true;
	   }
	}
	
	@Override
	public String getPreResReqList(String reqNum, String reqName, String reqPerInCharge, int pageNum) {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = PagingParameters.PAGE_SIZE;
		int startIndex = 0; // 开始索引

		Map<String,String> condition = new HashMap<>();
		condition.put("reqNum", reqNum);
		condition.put("reqName", reqName);
		condition.put("reqPerInCharge", reqPerInCharge);
		condition.put("assessmentDateStart", null);
		condition.put("assessmentDateEnd", null);
		
		totalNum = requirementsServiceCore.getTotalNum(condition, "01");

		totalPage = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;

		if (totalNum > 0) {
			if (pageNum <= 1) {
				startIndex = 0;
			} else {
				startIndex = pageNum * pageSize - pageSize;
			}
		} else {
			totalPage = 1;
		}
		
		List<Requirements> requirementsList = new ArrayList<>();
		requirementsList = requirementsServiceCore.getRequirements(condition,  "01", startIndex, pageSize);

		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (Requirements requirement : requirementsList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("reqNum", requirement.getReqNum());
			jsonObject.put("reqName", requirement.getReqName());
			jsonObject.put("reqStartDate", requirement.getReqStartDate());
			
			if (requirement.getReqScheduleDate() == null){
				jsonObject.put("reqScheduleDate", "");
			} else {
				jsonObject.put("reqScheduleDate", requirement.getReqScheduleDate());
			}
			
			if ("1".equals(requirement.getReqOrganizeType())){
				jsonObject.put("reqOrganizeType", "主办");
			} else if ("2".equals(requirement.getReqOrganizeType())){
				jsonObject.put("reqOrganizeType", "辅办");
			} 
			
			jsonObject.put("reqPerInCharge", requirement.getReqPerInCharge());
			jsonObject.put("reqMember", requirement.getReqMember());
			
			if ("01".equals(requirement.getReqChildState())) {
				jsonObject.put("reqState", "预研");
			} 
			
			jsonObject.put("reqBusDepart", requirement.getReqBusDepart());
			jsonObject.put("reqComment", requirement.getReqComment());
			jsonObject.put("reqID", requirement.getReqID());

			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("reqDTOsList", jsonArray);
		result.put("reqsTotalNum", totalNum);
		result.put("reqsTotalPage", totalPage);
		return JSONObject.fromObject(result).toString();
	}

	@Override
	public String savePreResReq(PreResReqDTO preResReqDTO) {
		Requirements requirement = new Requirements();
		requirement.setReqNum(preResReqDTO.getReqNum());
		requirement.setReqName(preResReqDTO.getReqName());
		
		requirement.setReqState("01");   // 预研需求
		
		// 预研需求子状态
		requirement.setReqChildState("01");
		
		requirement.setReqStartDate(preResReqDTO.getReqStartDate());
		requirement.setReqScheduleDate(preResReqDTO.getReqScheduleDate());
		
		if ("主办".equals(preResReqDTO.getReqOrganizeType())) {
			requirement.setReqOrganizeType("1");
		} else if ("辅办".equals(preResReqDTO.getReqOrganizeType()))  {
			requirement.setReqOrganizeType("2");
		}
		
		requirement.setReqPerInCharge(preResReqDTO.getReqPerInCharge());
		requirement.setReqMember(preResReqDTO.getReqMember());
		requirement.setReqBusDepart(preResReqDTO.getReqBusDepart());
		requirement.setReqComment(preResReqDTO.getReqComment());
		
		Date now = new Date();
		requirement.setReqCreTime(now);
		requirement.setReqModTime(now);
		requirement.setReqCreator("Admin");
		requirement.setReqModifier("Admin");
		
		return requirementsServiceCore.insertRequirement(requirement);
	}
	
	@Override
	public String deletePreResReq(Integer reqID) {
		return requirementsServiceCore.deleteRequirement(reqID);
	}
	
	@Override
	public String selectPreResReqByID(Integer reqID) {
		Requirements requirement = requirementsServiceCore.getRequirementByID(reqID);
		Map<String, String> result = new HashMap<String, String>(1);   
		result.put("reqNum", requirement.getReqNum());
		result.put("reqName", requirement.getReqName());
		result.put("reqStartDate", requirement.getReqStartDate());
		result.put("reqScheduleDate", requirement.getReqScheduleDate());
		
		if ("1".equals(requirement.getReqOrganizeType())){
			result.put("reqOrganizeType", "主办");
		} else if ("2".equals(requirement.getReqOrganizeType())){
			result.put("reqOrganizeType", "辅办");
		} 
		
		result.put("reqPerInCharge", requirement.getReqPerInCharge());
		result.put("reqMember", requirement.getReqMember());
		
		if ("01".equals(requirement.getReqChildState())){
			result.put("reqChildState",  "预研");
		} 
		
		result.put("reqBusDepart", requirement.getReqBusDepart());
		result.put("reqComment", requirement.getReqComment());
		return JSONObject.fromObject(result).toString();      // 类似 JSON 的处理方式，采用Map返回结果
	}
	
	@Override
	public String updatePreResReq(PreResReqDTO preResReqDTO) {
		Requirements requirement = new Requirements();
		requirement.setReqID(preResReqDTO.getReqID());
		
		requirement.setReqNum(preResReqDTO.getReqNum());
		requirement.setReqName(preResReqDTO.getReqName());
		requirement.setReqStartDate(preResReqDTO.getReqStartDate());
		requirement.setReqScheduleDate(preResReqDTO.getReqScheduleDate());
		if ("主办".equals(preResReqDTO.getReqOrganizeType())) {
			requirement.setReqOrganizeType("1");
		} else if ("辅办".equals(preResReqDTO.getReqOrganizeType()))  {
			requirement.setReqOrganizeType("2");
		}
		requirement.setReqPerInCharge(preResReqDTO.getReqPerInCharge());
		requirement.setReqMember(preResReqDTO.getReqMember());
		// 预研需求子状态
		if ("预研".equals(preResReqDTO.getReqChildState())) {
			requirement.setReqChildState("01");
		}
		requirement.setReqBusDepart(preResReqDTO.getReqBusDepart());
		requirement.setReqComment(preResReqDTO.getReqComment());
		
		Date now = new Date();
		requirement.setReqModTime(now);
		requirement.setReqModifier("Admin");
		
		return requirementsServiceCore.updateRequirement(requirement);
	}
	
	@Override
	public String getIntentionReqList(String reqNum, String reqName, String reqPerInCharge, int pageNum) {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = PagingParameters.PAGE_SIZE;
		int startIndex = 0; // 开始索引

		Map<String,String> condition = new HashMap<>();
		condition.put("reqNum", reqNum);
		condition.put("reqName", reqName);
		condition.put("reqPerInCharge", reqPerInCharge);
		condition.put("assessmentDateStart", null);
		condition.put("assessmentDateEnd", null);
		totalNum = requirementsServiceCore.getTotalNum(condition, "02");

		totalPage = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;

		if (totalNum > 0) {
			if (pageNum <= 1) {
				startIndex = 0;
			} else {
				startIndex = pageNum * pageSize - pageSize;
			}
		} else {
			totalPage = 1;
		}
		
		List<Requirements> requirementsList = new ArrayList<>();
		requirementsList = requirementsServiceCore.getRequirements(condition, "02", startIndex, pageSize);

		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (Requirements requirement : requirementsList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("reqNum", requirement.getReqNum());
			jsonObject.put("reqName", requirement.getReqName());
			jsonObject.put("reqBusDepart", requirement.getReqBusDepart());
			
			if ("01".equals(requirement.getReqChildState())) {
				jsonObject.put("reqChildState", "等需求");
			} 
			
			jsonObject.put("reqPriority", requirement.getReqPriority());
			jsonObject.put("reqContent", requirement.getReqContent());
			jsonObject.put("reqPerInCharge", requirement.getReqPerInCharge());
			jsonObject.put("reqAssessment", requirement.getReqAssessment());
			jsonObject.put("reqID", requirement.getReqID());

			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("reqDTOsList", jsonArray);
		result.put("reqsTotalNum", totalNum);
		result.put("reqsTotalPage", totalPage);
		return JSONObject.fromObject(result).toString();
	}
	
	@Override
	public String saveIntentionReq(IntentionReqDTO intentionReqDTO) {
		Requirements requirement = new Requirements();
		requirement.setReqNum(intentionReqDTO.getReqNum());
		requirement.setReqName(intentionReqDTO.getReqName());
		requirement.setReqBusDepart(intentionReqDTO.getReqBusDepart());
		
		requirement.setReqState("02");   // 意向性需求
		
		// 意向性需求子状态
		requirement.setReqChildState("01");

		requirement.setReqPriority(intentionReqDTO.getReqPriority());
		requirement.setReqContent(intentionReqDTO.getReqContent());
		requirement.setReqPerInCharge(intentionReqDTO.getReqPerInCharge());
		requirement.setReqAssessment(intentionReqDTO.getReqAssessment());
		
		Date now = new Date();
		requirement.setReqCreTime(now);
		requirement.setReqModTime(now);
		requirement.setReqCreator("Admin");
		requirement.setReqModifier("Admin");
		
		return requirementsServiceCore.insertRequirement(requirement);
	}
	
	@Override
	public String deleteIntentionReq(Integer reqID) {
		return requirementsServiceCore.deleteRequirement(reqID);
	}
	
	@Override
	public String selectIntentionReqByID(Integer reqID) {
		Requirements requirement = requirementsServiceCore.getRequirementByID(reqID);
		Map<String, String> result = new HashMap<String, String>(1);   
		result.put("reqNum", requirement.getReqNum());
		result.put("reqName", requirement.getReqName());
		result.put("reqBusDepart", requirement.getReqBusDepart());
		result.put("reqPriority", requirement.getReqPriority());
		
		if ("01".equals(requirement.getReqChildState())) {
			result.put("reqChildState", "等需求");
		} 
		
		result.put("reqContent", requirement.getReqContent());
		result.put("reqPerInCharge", requirement.getReqPerInCharge());
		result.put("reqAssessment", requirement.getReqAssessment());
		
		return JSONObject.fromObject(result).toString();      // 类似 JSON 的处理方式，采用Map返回结果
	}
	
	@Override
	public String updateIntentionReq(IntentionReqDTO intentionReqDTO) {
		Requirements requirement = new Requirements();
		requirement.setReqID(intentionReqDTO.getReqID());
		
		requirement.setReqNum(intentionReqDTO.getReqNum());
		requirement.setReqName(intentionReqDTO.getReqName());
		requirement.setReqBusDepart(intentionReqDTO.getReqBusDepart());
		
		// 意向性需求子状态
		if ("等需求".equals(intentionReqDTO.getReqChildState())) {
			requirement.setReqChildState("01");
		} 
		
		requirement.setReqPriority(intentionReqDTO.getReqPriority());
		requirement.setReqContent(intentionReqDTO.getReqContent());
		requirement.setReqPerInCharge(intentionReqDTO.getReqPerInCharge());
		requirement.setReqAssessment(intentionReqDTO.getReqAssessment());

		Date now = new Date();
		requirement.setReqModTime(now);
		requirement.setReqModifier("Admin");
		
		return requirementsServiceCore.updateRequirement(requirement);
	}
	
	@Override
	public String getWaitPerfectReqList(String reqNum, String reqName, String reqPerInCharge, int pageNum) {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = PagingParameters.PAGE_SIZE;
		int startIndex = 0; // 开始索引

		Map<String,String> condition = new HashMap<>();
		condition.put("reqNum", reqNum);
		condition.put("reqName", reqName);
		condition.put("reqPerInCharge", reqPerInCharge);
		condition.put("assessmentDateStart", null);
		condition.put("assessmentDateEnd", null);
		totalNum = requirementsServiceCore.getTotalNum(condition, "03");

		totalPage = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;

		if (totalNum > 0) {
			if (pageNum <= 1) {
				startIndex = 0;
			} else {
				startIndex = pageNum * pageSize - pageSize;
			}
		} else {
			totalPage = 1;
		}
		
		List<Requirements> requirementsList = new ArrayList<>();
		requirementsList = requirementsServiceCore.getRequirements(condition, "03", startIndex, pageSize);

		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (Requirements requirement : requirementsList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("reqNum", requirement.getReqNum());
			jsonObject.put("reqName", requirement.getReqName());
			jsonObject.put("reqBusDepart", requirement.getReqBusDepart());
			
			if ("01".equals(requirement.getReqChildState())) {
				jsonObject.put("reqChildState", "待完善");
			}
			
			jsonObject.put("reqPriority", requirement.getReqPriority());
			jsonObject.put("reqPerInCharge", requirement.getReqPerInCharge());
			jsonObject.put("reqMember", requirement.getReqMember());
			jsonObject.put("reqComment", requirement.getReqComment());
			jsonObject.put("reqID", requirement.getReqID());

			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("reqDTOsList", jsonArray);
		result.put("reqsTotalNum", totalNum);
		result.put("reqsTotalPage", totalPage);
		return JSONObject.fromObject(result).toString();
	}
	
	@Override
	public String deleteWaitPerfectReq(Integer reqID) {
		return requirementsServiceCore.deleteRequirement(reqID);
	}
	
	@Override
	public String selectWaitPerfectReqByID(Integer reqID) {
		Requirements requirement = requirementsServiceCore.getRequirementByID(reqID);
		Map<String, String> result = new HashMap<String, String>(1);   
		result.put("reqNum", requirement.getReqNum());
		result.put("reqName", requirement.getReqName());
		result.put("reqBusDepart", requirement.getReqBusDepart());
		if ("01".equals(requirement.getReqChildState())) {
			result.put("reqChildState", "待完善");
		} 
		result.put("reqPriority", requirement.getReqPriority());
		result.put("reqPerInCharge", requirement.getReqPerInCharge());
		result.put("reqMember", requirement.getReqMember());
		result.put("reqComment", requirement.getReqComment());
		
		return JSONObject.fromObject(result).toString();      // 类似 JSON 的处理方式，采用Map返回结果
	}
	
	@Override
	public String saveWaitPerfectReq(WaitPerfectReqDTO returnedReqDTO) {
		Requirements requirement = new Requirements();
		requirement.setReqNum(returnedReqDTO.getReqNum());
		requirement.setReqName(returnedReqDTO.getReqName());
		requirement.setReqBusDepart(returnedReqDTO.getReqBusDepart());
		
		requirement.setReqState("03");   // 待完善需求
			
		// 待完善需求子状态
		if ("待完善".equals(returnedReqDTO.getReqChildState())) {
			requirement.setReqChildState("01");
		} 

		requirement.setReqPriority(returnedReqDTO.getReqPriority());
		requirement.setReqPerInCharge(returnedReqDTO.getReqPerInCharge());
		requirement.setReqMember(returnedReqDTO.getReqMember());
		requirement.setReqComment(returnedReqDTO.getReqComment());
		
		Date now = new Date();
		requirement.setReqCreTime(now);
		requirement.setReqModTime(now);
		requirement.setReqCreator("Admin");
		requirement.setReqModifier("Admin");
		
		return requirementsServiceCore.insertRequirement(requirement);
	}
	
	@Override
	public String updateWaitPerfectReq(WaitPerfectReqDTO returnedReqDTO) {
		Requirements requirement = new Requirements();
		requirement.setReqID(returnedReqDTO.getReqID());
		
		requirement.setReqNum(returnedReqDTO.getReqNum());
		requirement.setReqName(returnedReqDTO.getReqName());
        requirement.setReqBusDepart(returnedReqDTO.getReqBusDepart());
		
		requirement.setReqState("03");   // 待完善需求
			
		// 待完善需求子状态
		requirement.setReqChildState("01");

		requirement.setReqPriority(returnedReqDTO.getReqPriority());
		requirement.setReqPerInCharge(returnedReqDTO.getReqPerInCharge());
		requirement.setReqMember(returnedReqDTO.getReqMember());
		requirement.setReqComment(returnedReqDTO.getReqComment());
		
		Date now = new Date();
		requirement.setReqModTime(now);
		requirement.setReqModifier("Admin");
		
		return requirementsServiceCore.updateRequirement(requirement);
	}
	
	@Override
	public String getEstimatingReqList(String reqNum, String reqName, String reqPerInCharge, int pageNum) {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = PagingParameters.PAGE_SIZE;
		int startIndex = 0; // 开始索引

		Map<String,String> condition = new HashMap<>();
		condition.put("reqNum", reqNum);
		condition.put("reqName", reqName);
		condition.put("reqPerInCharge", reqPerInCharge);
		condition.put("assessmentDateStart", null);
		condition.put("assessmentDateEnd", null);
		totalNum = requirementsServiceCore.getTotalNum(condition, "04");

		totalPage = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;

		if (totalNum > 0) {
			if (pageNum <= 1) {
				startIndex = 0;
			} else {
				startIndex = pageNum * pageSize - pageSize;
			}
		} else {
			totalPage = 1;
		}
		
		List<Requirements> requirementsList = new ArrayList<>();
		requirementsList = requirementsServiceCore.getRequirements(condition, "04", startIndex, pageSize);

		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (Requirements requirement : requirementsList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("reqNum", requirement.getReqNum());
			jsonObject.put("reqName", requirement.getReqName());
			
			if ("01".equals(requirement.getReqChildState())) {
				jsonObject.put("reqChildState", "评估中");
			} 
			
			jsonObject.put("reqPriority", requirement.getReqPriority());
			jsonObject.put("reqContent", requirement.getReqContent());
			jsonObject.put("reqPerInCharge", requirement.getReqPerInCharge());
			jsonObject.put("reqMember", requirement.getReqMember());
			jsonObject.put("reqBusDepart", requirement.getReqBusDepart());
			jsonObject.put("reqID", requirement.getReqID());

			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("reqDTOsList", jsonArray);
		result.put("reqsTotalNum", totalNum);
		result.put("reqsTotalPage", totalPage);
		return JSONObject.fromObject(result).toString();
	}
	
	@Override
	public String deleteEstimatingReq(Integer reqID) {
		return requirementsServiceCore.deleteRequirement(reqID);
	}
	
	@Override
	public String selectEstimatingReqByID(Integer reqID) {
		Requirements requirement = requirementsServiceCore.getRequirementByID(reqID);
		Map<String, String> result = new HashMap<String, String>(1);   
		result.put("reqNum", requirement.getReqNum());
		result.put("reqName", requirement.getReqName());
		if ("01".equals(requirement.getReqChildState())) {
			result.put("reqChildState", "评估中");
		} 
		result.put("reqPriority", requirement.getReqPriority());
		result.put("reqPerInCharge", requirement.getReqPerInCharge());
		result.put("reqMember", requirement.getReqMember());
		result.put("reqContent", requirement.getReqContent());
		result.put("reqBusDepart", requirement.getReqBusDepart());
		return JSONObject.fromObject(result).toString();      // 类似 JSON 的处理方式，采用Map返回结果
	}
	
	@Override
	public String saveEstimatingReq(EstimatingReqDTO penDevelopReqDTO) {
		Requirements requirement = new Requirements();
		requirement.setReqNum(penDevelopReqDTO.getReqNum());
		requirement.setReqName(penDevelopReqDTO.getReqName());
		
		requirement.setReqState("04");   // 评估中需求
		
		// 评估中需求子状态
		requirement.setReqChildState("01");

		requirement.setReqPriority(penDevelopReqDTO.getReqPriority());
		requirement.setReqContent(penDevelopReqDTO.getReqContent());
		requirement.setReqPerInCharge(penDevelopReqDTO.getReqPerInCharge());
		requirement.setReqMember(penDevelopReqDTO.getReqMember());
		requirement.setReqBusDepart(penDevelopReqDTO.getReqBusDepart());
		
		Date now = new Date();
		requirement.setReqCreTime(now);
		requirement.setReqModTime(now);
		requirement.setReqCreator("Admin");
		requirement.setReqModifier("Admin");
		
		return requirementsServiceCore.insertRequirement(requirement);
	}
	
	@Override
	public String updateEstimatingReq(EstimatingReqDTO penDevelopReqDTO) {
		Requirements requirement = new Requirements();
		requirement.setReqID(penDevelopReqDTO.getReqID());
		
		requirement.setReqNum(penDevelopReqDTO.getReqNum());
		requirement.setReqName(penDevelopReqDTO.getReqName());
		
		// 评估中需求子状态
		if ("评估中".equals(penDevelopReqDTO.getReqChildState())) {
			requirement.setReqChildState("01");
		} 
		
		requirement.setReqPriority(penDevelopReqDTO.getReqPriority());
		requirement.setReqContent(penDevelopReqDTO.getReqContent());
		requirement.setReqPerInCharge(penDevelopReqDTO.getReqPerInCharge());
		requirement.setReqMember(penDevelopReqDTO.getReqMember());
		requirement.setReqBusDepart(penDevelopReqDTO.getReqBusDepart());
		
		Date now = new Date();
		requirement.setReqModTime(now);
		requirement.setReqModifier("Admin");
		
		return requirementsServiceCore.updateRequirement(requirement);
	}
	
	@Override
	public String getSchedulingDevelopList(String reqNum, String reqName, String reqPerInCharge, int pageNum) {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = PagingParameters.PAGE_SIZE;
		int startIndex = 0; // 开始索引

		Map<String,String> condition = new HashMap<>();
		condition.put("reqNum", reqNum);
		condition.put("reqName", reqName);
		condition.put("reqPerInCharge", reqPerInCharge);
		condition.put("assessmentDateStart", null);
		condition.put("assessmentDateEnd", null);
		totalNum = requirementsServiceCore.getTotalNum(condition, "05");

		totalPage = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;

		if (totalNum > 0) {
			if (pageNum <= 1) {
				startIndex = 0;
			} else {
				startIndex = pageNum * pageSize - pageSize;
			}
		} else {
			totalPage = 1;
		}
		
		List<Requirements> requirementsList = new ArrayList<>();
		requirementsList = requirementsServiceCore.getRequirements(condition, "05", startIndex, pageSize);

		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (Requirements requirement : requirementsList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("reqNum", requirement.getReqNum());
			jsonObject.put("reqName", requirement.getReqName());
			jsonObject.put("reqChildState", "排期开发");
			jsonObject.put("reqPriority", requirement.getReqPriority());
			
			if (requirement.getReqScheduleDate() == null){
				jsonObject.put("reqScheduleDate", "");
			} else {
				jsonObject.put("reqScheduleDate", requirement.getReqScheduleDate());
			}
			
			jsonObject.put("reqContent", requirement.getReqContent());
			jsonObject.put("reqPerInCharge", requirement.getReqPerInCharge());
			jsonObject.put("reqMember", requirement.getReqMember());
			jsonObject.put("reqBusDepart", requirement.getReqBusDepart());
			jsonObject.put("reqComment", requirement.getReqComment());
			jsonObject.put("reqID", requirement.getReqID());

			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("reqDTOsList", jsonArray);
		result.put("reqsTotalNum", totalNum);
		result.put("reqsTotalPage", totalPage);
		return JSONObject.fromObject(result).toString();
	}
	
	@Override
	public String getDeferReqList(String reqNum, String reqName, String reqPerInCharge, int pageNum) {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = PagingParameters.PAGE_SIZE;
		int startIndex = 0; // 开始索引

		Map<String,String> condition = new HashMap<>();
		condition.put("reqNum", reqNum);
		condition.put("reqName", reqName);
		condition.put("reqPerInCharge", reqPerInCharge);
		condition.put("assessmentDateStart", null);
		condition.put("assessmentDateEnd", null);
		totalNum = requirementsServiceCore.getTotalNum(condition, "06");

		totalPage = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;

		if (totalNum > 0) {
			if (pageNum <= 1) {
				startIndex = 0;
			} else {
				startIndex = pageNum * pageSize - pageSize;
			}
		} else {
			totalPage = 1;
		}
		
		List<Requirements> requirementsList = new ArrayList<>();
		requirementsList = requirementsServiceCore.getRequirements(condition, "06", startIndex, pageSize);

		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (Requirements requirement : requirementsList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("reqNum", requirement.getReqNum());
			jsonObject.put("reqName", requirement.getReqName());
			
			if ("01".equals(requirement.getReqChildState())) {
				jsonObject.put("reqChildState", "暂缓");
			} else if ("02".equals(requirement.getReqChildState())) {
				jsonObject.put("reqChildState", "完善需求");
			} else if ("03".equals(requirement.getReqChildState())) {
				jsonObject.put("reqChildState", "排期开发");
			} else if ("04".equals(requirement.getReqChildState())) {
				jsonObject.put("reqChildState", "合并到对公，已立项");
			} 
			
			jsonObject.put("reqPriority", requirement.getReqPriority());
			
			if (requirement.getReqScheduleDate() == null){
				jsonObject.put("reqScheduleDate", "");
			} else {
				jsonObject.put("reqScheduleDate", requirement.getReqScheduleDate());
			}
			
			jsonObject.put("reqContent", requirement.getReqContent());
			jsonObject.put("reqPerInCharge", requirement.getReqPerInCharge());
			jsonObject.put("reqMember", requirement.getReqMember());
			jsonObject.put("reqBusDepart", requirement.getReqBusDepart());
			jsonObject.put("reqComment", requirement.getReqComment());
			jsonObject.put("reqID", requirement.getReqID());

			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("reqDTOsList", jsonArray);
		result.put("reqsTotalNum", totalNum);
		result.put("reqsTotalPage", totalPage);
		return JSONObject.fromObject(result).toString();
	}
	
	@Override
	public String deleteDeferReq(Integer reqID) {
		return requirementsServiceCore.deleteRequirement(reqID);
	}
	
	@Override
	public String selectDeferReqByID(Integer reqID) {
		Requirements requirement = requirementsServiceCore.getRequirementByID(reqID);
		Map<String, String> result = new HashMap<String, String>(1);   
		result.put("reqNum", requirement.getReqNum());
		result.put("reqName", requirement.getReqName());
		if ("01".equals(requirement.getReqChildState())) {
			result.put("reqChildState", "暂缓");
		} else if ("02".equals(requirement.getReqChildState())) {
			result.put("reqChildState", "完善需求");
		} else if ("03".equals(requirement.getReqChildState())) {
			result.put("reqChildState", "排期开发");
		} else if ("04".equals(requirement.getReqChildState())) {
			result.put("reqChildState", "合并到对公，已立项");
		} 
		result.put("reqPriority", requirement.getReqPriority());
		result.put("reqScheduleDate", requirement.getReqScheduleDate());
		result.put("reqContent", requirement.getReqContent());
		result.put("reqPerInCharge", requirement.getReqPerInCharge());
		result.put("reqMember", requirement.getReqMember());
		result.put("reqBusDepart", requirement.getReqBusDepart());
		result.put("reqComment", requirement.getReqComment());
		
		return JSONObject.fromObject(result).toString();      // 类似 JSON 的处理方式，采用Map返回结果
	}
	
	@Override
	public String saveDeferReq(DeferReqDTO deferReqDTO) {
		Requirements requirement = new Requirements();
		requirement.setReqNum(deferReqDTO.getReqNum());
		requirement.setReqName(deferReqDTO.getReqName());
		
		requirement.setReqState("06");   // 暂缓需求
			
		// 暂缓需求子状态
		if ("暂缓".equals(deferReqDTO.getReqChildState())) {
			requirement.setReqChildState("01");
		} else if ("完善需求".equals(deferReqDTO.getReqChildState())) {
			requirement.setReqChildState("02");
		} else if ("排期开发".equals(deferReqDTO.getReqChildState())) {
			requirement.setReqChildState("03");
		} else if ("合并到对公，已立项".equals(deferReqDTO.getReqChildState())) {
			requirement.setReqChildState("04");
		} 

		requirement.setReqPriority(deferReqDTO.getReqPriority());
		requirement.setReqScheduleDate(deferReqDTO.getReqScheduleDate());
		requirement.setReqContent(deferReqDTO.getReqContent());
		requirement.setReqPerInCharge(deferReqDTO.getReqPerInCharge());
		requirement.setReqMember(deferReqDTO.getReqMember());
		requirement.setReqBusDepart(deferReqDTO.getReqBusDepart());
		requirement.setReqComment(deferReqDTO.getReqComment());
		
		Date now = new Date();
		requirement.setReqCreTime(now);
		requirement.setReqModTime(now);
		requirement.setReqCreator("Admin");
		requirement.setReqModifier("Admin");
		
		return requirementsServiceCore.insertRequirement(requirement);
	}
	
	@Override
	public String updateDeferReq(DeferReqDTO deferReqDTO) {
		Requirements requirement = new Requirements();
		requirement.setReqID(deferReqDTO.getReqID());
		
		requirement.setReqNum(deferReqDTO.getReqNum());
		requirement.setReqName(deferReqDTO.getReqName());
		
		// 暂缓需求子状态
		if ("暂缓".equals(deferReqDTO.getReqChildState())) {
			requirement.setReqChildState("01");
		} else if ("完善需求".equals(deferReqDTO.getReqChildState())) {
			requirement.setReqChildState("02");
		} else if ("排期开发".equals(deferReqDTO.getReqChildState())) {
			requirement.setReqChildState("03");
		} else if ("合并到对公，已立项".equals(deferReqDTO.getReqChildState())) {
			requirement.setReqChildState("04");
		} 
		
		requirement.setReqPriority(deferReqDTO.getReqPriority());
		requirement.setReqScheduleDate(deferReqDTO.getReqScheduleDate());
		requirement.setReqContent(deferReqDTO.getReqContent());
		requirement.setReqPerInCharge(deferReqDTO.getReqPerInCharge());
		requirement.setReqMember(deferReqDTO.getReqMember());
		requirement.setReqBusDepart(deferReqDTO.getReqBusDepart());
		requirement.setReqComment(deferReqDTO.getReqComment());
		
		Date now = new Date();
		requirement.setReqModTime(now);
		requirement.setReqModifier("Admin");
		
		return requirementsServiceCore.updateRequirement(requirement);
	}
	
	@Override
	public String getDevelopingReqList(String reqNum, String reqName, String reqPerInCharge, int pageNum) {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = PagingParameters.PAGE_SIZE;
		int startIndex = 0; // 开始索引

		Map<String,String> condition = new HashMap<>();
		condition.put("reqNum", reqNum);
		condition.put("reqName", reqName);
		condition.put("reqPerInCharge", reqPerInCharge);
		condition.put("assessmentDateStart", null);
		condition.put("assessmentDateEnd", null);
		totalNum = requirementsServiceCore.getTotalNum(condition, "07");

		totalPage = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;

		if (totalNum > 0) {
			if (pageNum <= 1) {
				startIndex = 0;
			} else {
				startIndex = pageNum * pageSize - pageSize;
			}
		} else {
			totalPage = 1;
		}
		
		List<Requirements> requirementsList = new ArrayList<>();
		requirementsList = requirementsServiceCore.getRequirements(condition, "07", startIndex, pageSize);

		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (Requirements requirement : requirementsList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("reqNum", requirement.getReqNum());
			jsonObject.put("reqName", requirement.getReqName());
			jsonObject.put("reqBusDepart", requirement.getReqBusDepart());
			
			if ("01".equals(requirement.getReqChildState())) {
				jsonObject.put("reqChildState", "开发中");
			}
			
			jsonObject.put("reqPriority", requirement.getReqPriority());
			jsonObject.put("reqPerInCharge", requirement.getReqPerInCharge());
			jsonObject.put("reqMember", requirement.getReqMember());
			jsonObject.put("reqComment", requirement.getReqComment());
			jsonObject.put("reqID", requirement.getReqID());

			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("reqDTOsList", jsonArray);
		result.put("reqsTotalNum", totalNum);
		result.put("reqsTotalPage", totalPage);
		return JSONObject.fromObject(result).toString();
	}
	
	@Override
	public String deleteDevelopingReq(Integer reqID) {
		return requirementsServiceCore.deleteRequirement(reqID);
	}
	
	@Override
	public String selectDevelopingReqByID(Integer reqID) {
		Requirements requirement = requirementsServiceCore.getRequirementByID(reqID);
		Map<String, String> result = new HashMap<String, String>(1);   
		result.put("reqNum", requirement.getReqNum());
		result.put("reqName", requirement.getReqName());
		result.put("reqBusDepart", requirement.getReqBusDepart());
		if ("01".equals(requirement.getReqChildState())) {
			result.put("reqChildState", "开发中");
		} 
		result.put("reqPriority", requirement.getReqPriority());
		result.put("reqPerInCharge", requirement.getReqPerInCharge());
		result.put("reqMember", requirement.getReqMember());
		result.put("reqComment", requirement.getReqComment());
		
		return JSONObject.fromObject(result).toString();      // 类似 JSON 的处理方式，采用Map返回结果
	}
	
	@Override
	public String updateDevelopingReq(DevelopingReqDTO developingReqDTO) {
		Requirements requirement = new Requirements();
		requirement.setReqID(developingReqDTO.getReqID());
		
		requirement.setReqNum(developingReqDTO.getReqNum());
		requirement.setReqName(developingReqDTO.getReqName());
        requirement.setReqBusDepart(developingReqDTO.getReqBusDepart());
		
		requirement.setReqState("07");   // 开发中需求
			
		// 开发中需求子状态
		if ("开发中".equals(developingReqDTO.getReqChildState())) {
			requirement.setReqChildState("01");
		} 

		requirement.setReqPriority(developingReqDTO.getReqPriority());
		requirement.setReqPerInCharge(developingReqDTO.getReqPerInCharge());
		requirement.setReqMember(developingReqDTO.getReqMember());
		requirement.setReqComment(developingReqDTO.getReqComment());
		
		Date now = new Date();
		requirement.setReqModTime(now);
		requirement.setReqModifier("Admin");
		
		return requirementsServiceCore.updateRequirement(requirement);
	}
	
	@Override
	public String getOnLinedReqList(String reqNum, String reqName, String reqPerInCharge, int pageNum) {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = PagingParameters.PAGE_SIZE;
		int startIndex = 0; // 开始索引

		Map<String,String> condition = new HashMap<>();
		condition.put("reqNum", reqNum);
		condition.put("reqName", reqName);
		condition.put("reqPerInCharge", reqPerInCharge);
		condition.put("assessmentDateStart", null);
		condition.put("assessmentDateEnd", null);
		totalNum = requirementsServiceCore.getTotalNum(condition, "08");

		totalPage = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;

		if (totalNum > 0) {
			if (pageNum <= 1) {
				startIndex = 0;
			} else {
				startIndex = pageNum * pageSize - pageSize;
			}
		} else {
			totalPage = 1;
		}
		
		List<Requirements> requirementsList = new ArrayList<>();
		requirementsList = requirementsServiceCore.getRequirements(condition, "08", startIndex, pageSize);

		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (Requirements requirement : requirementsList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			
			if (requirement.getReqAssessmentDate() == null){
				jsonObject.put("reqAssessmentDate", "");
			} else {
				jsonObject.put("reqAssessmentDate", requirement.getReqAssessmentDate());
			}
			
			jsonObject.put("reqNum", requirement.getReqNum());
			jsonObject.put("reqName", requirement.getReqName());
			jsonObject.put("reqState", "已上线");     

			if( n%2 ==0) {
				jsonObject.put("backgroundColor", "#f5f5f5");
			} else {
				jsonObject.put("backgroundColor", "#e0ffff");
			}
			
			if (requirement.getReqScheduleStartDate() == null){
				jsonObject.put("reqScheduleStartDate", "");
			} else {
				jsonObject.put("reqScheduleStartDate", requirement.getReqScheduleStartDate());
			}
			
			jsonObject.put("reqContent", requirement.getReqContent());
			jsonObject.put("reqAuthor", requirement.getReqAuthor());
			jsonObject.put("reqBusDepart", requirement.getReqBusDepart());
			jsonObject.put("reqComment", requirement.getReqComment());
			jsonObject.put("reqID", requirement.getReqID());

			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("reqDTOsList", jsonArray);
		result.put("reqsTotalNum", totalNum);
		result.put("reqsTotalPage", totalPage);
		return JSONObject.fromObject(result).toString();
	}
	
	public RequirementsServiceCore getRequirementsServiceCore() {
		return requirementsServiceCore;
	}

	public void setRequirementsServiceCore(RequirementsServiceCore requirementsServiceCore) {
		this.requirementsServiceCore = requirementsServiceCore;
	}

	public ProjectServiceCore getProjectServiceCore() {
		return projectServiceCore;
	}

	public void setProjectServiceCore(ProjectServiceCore projectServiceCore) {
		this.projectServiceCore = projectServiceCore;
	}

}
