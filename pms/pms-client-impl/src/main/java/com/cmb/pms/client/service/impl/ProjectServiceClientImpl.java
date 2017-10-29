package com.cmb.pms.client.service.impl;

import java.text.SimpleDateFormat;
import java.text.DecimalFormat;    
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.cmb.pms.client.dto.ProjectDTO;
import com.cmb.pms.client.service.ProjectServiceClient;
import com.cmb.pms.core.service.ProjectServiceCore;
import com.cmb.pms.core.model.Project;

public class ProjectServiceClientImpl implements ProjectServiceClient {

	private ProjectServiceCore projectServiceCore;
	
	@Override
	public String getProjectLists(String projNumber, String projReqNum,String projName,String projPerInCharge,String projState,int pageNum) {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = 16;
		int startIndex = 0; // 开始索引

		totalNum = projectServiceCore.getTotalNum(projNumber, projReqNum,projName, projPerInCharge,projState);

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
		
		List<Project> projectListTemp = projectServiceCore.getProjects(projNumber, projReqNum,projName, projPerInCharge,projState, startIndex, pageSize);
		
		//将数据按照程序名重新排序
		List<Project> projectList = new ArrayList<>();				
		for(int i=0;i<projectListTemp.size();i++){
			projectList.add(projectListTemp.get(i));
			for(int j=i+1;j<projectListTemp.size()&&(j>i);j++){
				if(projectListTemp.get(j).getProjNumber().equals(projectListTemp.get(i).getProjNumber())){
					
					projectList.add(projectListTemp.get(j));
					projectListTemp.remove(j);
					j--;
				}
			}
		}
								
		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (Project project : projectList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("projNumber", project.getProjNumber());
			jsonObject.put("projReqNum", project.getProjReqNum().replace(";", "<br>"));
			jsonObject.put("projName", project.getProjName());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				if(project.getProjStartDate()!=null){
					jsonObject.put("projStartDate", sdf.format(project.getProjStartDate()));
				}else{jsonObject.put("projStartDate", "");
				}
				if(project.getProjSTEndDate()!=null){
					jsonObject.put("projSTEndDate", sdf.format(project.getProjSTEndDate()));
				}else{jsonObject.put("projSTEndDate", "");
				}
				if(project.getProjOnlineDate()!=null){
					jsonObject.put("projOnlineDate", sdf.format(project.getProjOnlineDate()));
				}else{jsonObject.put("projOnlineDate", "");
				}
				if(project.getProjExpEndDate()!=null){
					jsonObject.put("projExpEndDate", sdf.format(project.getProjExpEndDate()));
				}else{jsonObject.put("projExpEndDate", "");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(project.getProjDependID()!=null){
				jsonObject.put("projDependID", project.getProjDependID());
			}else{jsonObject.put("projDependID", "");
			}
			if(project.getProjCurState()!=null&&!project.getProjCurState().equals("")){
				String state = project.getProjCurState();
				String curState = "";
				switch (state) {
				case "01": curState = "预研中";					
					break;
				case "02": curState = "已完成预研";
				    break;
				case "11": curState = "设计中";					
				    break;
			    case "12": curState = "开发中";
			        break;
			    case "13": curState = "联调中";					
					break;
				case "14": curState = "ST测试";
				    break;
				case "15": curState = "UAT测试";					
				    break;
			    case "16": curState = "已完成";
		        	break;
			    case "17": curState = "等待上线";
	        	    break;
			    case "21": curState = "暂缓";
	        	    break;
				default:
					curState = "错误状态";
					break;
				}
				jsonObject.put("projCurState",curState);
			}else{jsonObject.put("projCurState", "");
			}
			if(project.getProjOrganizeType()!=null&&!project.getProjOrganizeType().equals("")){
				String type = project.getProjOrganizeType();
				String organizeType = "";
				if(type.equals("1")){
					organizeType = "主办";
				}else if(type.equals("2")){
					organizeType = "辅办";
				}else{
					organizeType = "错误";
				}
				jsonObject.put("projOrganizeType", organizeType);
			}else{jsonObject.put("projOrganizeType", "");
			}
			if(project.getProjPerInCharge()!=null){
				jsonObject.put("projPerInCharge", project.getProjPerInCharge());
			}else{jsonObject.put("projPerInCharge", "");
			}
			if(project.getProjFuncPoint()!=null){
				DecimalFormat df=new DecimalFormat(".00");
				jsonObject.put("projFuncPoint", df.format(project.getProjFuncPoint()));
			}else{jsonObject.put("projFuncPoint", "");
			}
			if(project.getProjMember()!=null){
				jsonObject.put("projMember",project.getProjMember());
			}else{jsonObject.put("projMember", "");
			}
			if(project.getProjCouBusiness()!=null){
				jsonObject.put("projCouBusiness",project.getProjCouBusiness());
			}else{jsonObject.put("projCouBusiness", "");
			}
			if(project.getProjRemark()!=null){
				jsonObject.put("projRemark", project.getProjRemark());
			}else{jsonObject.put("projRemark", "");
			}
			
			jsonObject.put("projID", project.getProjID());

			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("projDTOsList", jsonArray);
		result.put("projTotalNum", totalNum);
		result.put("projTotalPage", totalPage);
		return JSONObject.fromObject(result).toString();
	}
	
	@Override
	public String getFinishProjectLists(Map<String,String> serchCondition, int pageNum) {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = 30;
		int startIndex = 0; // 开始索引

		totalNum = projectServiceCore.getFinishTotalNum(serchCondition);

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
		
		List<Project> projectListTemp = projectServiceCore.getFinishProjects(serchCondition, startIndex, pageSize);
		
		//将数据按照项目编号重新排序
		List<Project> projectList = new ArrayList<>();				
		for(int i=0;i<projectListTemp.size();i++){
			projectList.add(projectListTemp.get(i));
			for(int j=i+1;j<projectListTemp.size()&&(j>i);j++){
				if(projectListTemp.get(j).getProjNumber().equals(projectListTemp.get(i).getProjNumber())){
					
					projectList.add(projectListTemp.get(j));
					projectListTemp.remove(j);
					j--;
				}
			}
		}
								
		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (Project project : projectList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("projNumber", project.getProjNumber());
			jsonObject.put("projReqNum", project.getProjReqNum());
			jsonObject.put("projName", project.getProjName());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				if(project.getProjStartDate()!=null){
					jsonObject.put("projStartDate", sdf.format(project.getProjStartDate()));
				}else{jsonObject.put("projStartDate", "");
				}
				if(project.getProjSTEndDate()!=null){
					jsonObject.put("projSTEndDate", sdf.format(project.getProjSTEndDate()));
				}else{jsonObject.put("projSTEndDate", "");
				}
				if(project.getProjOnlineDate()!=null){
					jsonObject.put("projOnlineDate", sdf.format(project.getProjOnlineDate()));
				}else{jsonObject.put("projOnlineDate", "");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(project.getProjDependID()!=null){
				jsonObject.put("projDependID", project.getProjDependID());
			}else{jsonObject.put("projDependID", "");
			}
			if(project.getProjCurState()!=null&&!project.getProjCurState().equals("")){
				String state = project.getProjCurState();
				String curState = "";
				switch (state) {
				case "01": curState = "预研中";					
					break;
				case "02": curState = "已完成预研";
				    break;
				case "11": curState = "设计中";					
				    break;
			    case "12": curState = "开发中";
			        break;
			    case "13": curState = "联调中";					
					break;
				case "14": curState = "ST测试";
				    break;
				case "15": curState = "UAT测试";					
				    break;
			    case "16": curState = "已完成";
		        	break;
			    case "17": curState = "等待上线";
	        	    break;
			    case "21": curState = "暂缓";
	        	    break;
				default:
					curState = "错误状态";
					break;
				}
				jsonObject.put("projCurState",curState);
			}else{jsonObject.put("projCurState", "");
			}
			if(project.getProjOrganizeType()!=null&&!project.getProjOrganizeType().equals("")){
				String type = project.getProjOrganizeType();
				String organizeType = "";
				if(type.equals("1")){
					organizeType = "主办";
				}else if(type.equals("2")){
					organizeType = "辅办";
				}else{
					organizeType = "错误";
				}
				jsonObject.put("projOrganizeType", organizeType);
			}else{jsonObject.put("projOrganizeType", "");
			}
			if(project.getProjPerInCharge()!=null){
				jsonObject.put("projPerInCharge", project.getProjPerInCharge());
			}else{jsonObject.put("projPerInCharge", "");
			}
			if(project.getProjFuncPoint()!=null){
				DecimalFormat df=new DecimalFormat(".00");
				jsonObject.put("projFuncPoint", df.format(project.getProjFuncPoint()));
			}else{jsonObject.put("projFuncPoint", "");
			}
			if(project.getProjMember()!=null){
				jsonObject.put("projMember",project.getProjMember());
			}else{jsonObject.put("projMember", "");
			}
			if(project.getProjCouBusiness()!=null){
				jsonObject.put("projCouBusiness",project.getProjCouBusiness());
			}else{jsonObject.put("projCouBusiness", "");
			}
			if(project.getProjRemark()!=null){
				jsonObject.put("projRemark", project.getProjRemark());
			}else{jsonObject.put("projRemark", "");
			}
			
			jsonObject.put("projID", project.getProjID());

			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("projDTOsList", jsonArray);
		result.put("projTotalNum", totalNum);
		result.put("projTotalPage", totalPage);
		return JSONObject.fromObject(result).toString();
	}
	
	@Override
	public String getProject(String projNumber){
		Project project = projectServiceCore.getProjectByProjNum(projNumber);
		JSONObject jsonObject = new JSONObject();		
		jsonObject.put("projNumber", project.getProjNumber());
		jsonObject.put("projReqNum", project.getProjReqNum());
		jsonObject.put("projName", project.getProjName());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if(project.getProjStartDate()!=null){
				jsonObject.put("projStartDate", sdf.format(project.getProjStartDate()));
			}else{jsonObject.put("projStartDate", "");
			}
			if(project.getProjSTEndDate()!=null){
				jsonObject.put("projSTEndDate", sdf.format(project.getProjSTEndDate()));
			}else{jsonObject.put("projSTEndDate", "");
			}
			if(project.getProjOnlineDate()!=null){
				jsonObject.put("projOnlineDate", sdf.format(project.getProjOnlineDate()));
			}else{jsonObject.put("projOnlineDate", "");
			}
			if(project.getProjExpEndDate()!=null){
				jsonObject.put("projExpEndDate", sdf.format(project.getProjExpEndDate()));
			}else{jsonObject.put("projExpEndDate", "");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(project.getProjDependID()!=null){
			jsonObject.put("projDependID", project.getProjDependID());
		}else{jsonObject.put("projDependID", "");
		}
		if(project.getProjCurState()!=null&&!project.getProjCurState().equals("")){
			String state = project.getProjCurState();
			String curState = "";
			switch (state) {
			case "01": curState = "预研中";					
				break;
			case "02": curState = "已完成预研";
			    break;
			case "11": curState = "设计中";					
			    break;
		    case "12": curState = "开发中";
		        break;
		    case "13": curState = "联调中";					
				break;
			case "14": curState = "ST测试";
			    break;
			case "15": curState = "UAT测试";					
			    break;
		    case "16": curState = "已完成";
	        	break;
		    case "17": curState = "等待上线";
        	    break;
		    case "21": curState = "暂缓";
        	    break;
			default:
				curState = "错误状态";
				break;
			}
			jsonObject.put("projCurState",curState);
		}else{jsonObject.put("projCurState", "");
		}
		if(project.getProjOrganizeType()!=null&&!project.getProjOrganizeType().equals("")){
			String type = project.getProjOrganizeType();
			String organizeType = "";
			if(type.equals("1")){
				organizeType = "主办";
			}else if(type.equals("2")){
				organizeType = "辅办";
			}else{
				organizeType = "错误";
			}
			jsonObject.put("projOrganizeType", organizeType);
		}else{jsonObject.put("projOrganizeType", "");
		}
		if(project.getProjPerInCharge()!=null){
			jsonObject.put("projPerInCharge", project.getProjPerInCharge());
		}else{jsonObject.put("projPerInCharge", "");
		}
		if(project.getProjFuncPoint()!=null){
			DecimalFormat df=new DecimalFormat(".00");
			jsonObject.put("projFuncPoint", df.format(project.getProjFuncPoint()));
		}else{jsonObject.put("projFuncPoint", "");
		}
		if(project.getProjMember()!=null){
			jsonObject.put("projMember",project.getProjMember());
		}else{jsonObject.put("projMember", "");
		}
		if(project.getProjCouBusiness()!=null){
			jsonObject.put("projCouBusiness",project.getProjCouBusiness());
		}else{jsonObject.put("projCouBusiness", "");
		}
		if(project.getProjRemark()!=null){
			jsonObject.put("projRemark", project.getProjRemark());
		}else{jsonObject.put("projRemark", "");
		}
		
		jsonObject.put("projID", project.getProjID());
		return JSONObject.fromObject(jsonObject).toString();
	}

	@Override
	public String saveProject(ProjectDTO projectDTO) {
		Project project = new Project();
		
		project.setProjNumber(projectDTO.getProjNumber());
		project.setProjReqNum(projectDTO.getProjReqNum());
		project.setProjName(projectDTO.getProjName());
		project.setProjStartDate(projectDTO.getProjStartDate());
		project.setProjSTEndDate(projectDTO.getProjSTEndDate());
		project.setProjOnlineDate(projectDTO.getProjOnlineDate());
		project.setProjExpEndDate(projectDTO.getProjExpEndDate());
		project.setProjDependID(projectDTO.getProjDependID());
		project.setProjCurState(projectDTO.getProjCurState());
		project.setProjOrganizeType(projectDTO.getProjOrganizeType());
		project.setProjPerInCharge(projectDTO.getProjPerInCharge());
		project.setProjFuncPoint(projectDTO.getProjFuncPoint());
		project.setProjCouBusiness(projectDTO.getProjCouBusiness());
		project.setProjRemark(projectDTO.getProjRemark());
		project.setProjMember(projectDTO.getProjMember());
		project.setProjCreator("Admin");
		project.setProjModifier("Admin");
		Date now = new Date();
		project.setProjCreTime(now);
		project.setProjModTime(now);
		return  projectServiceCore.insertProject(project);
	}
	
	@Override
	public String deleteProject(String projID){
		return projectServiceCore.deleteProject(projID);
	}
	
	@Override
	public String updateProject(ProjectDTO projectDTO){		
        Project project = projectServiceCore.getProjectByID(projectDTO.getProjID().toString());
        
        project.setProjNumber(projectDTO.getProjNumber());
		project.setProjReqNum(projectDTO.getProjReqNum());
		project.setProjName(projectDTO.getProjName());
		project.setProjStartDate(projectDTO.getProjStartDate());
		project.setProjSTEndDate(projectDTO.getProjSTEndDate());
		project.setProjOnlineDate(projectDTO.getProjOnlineDate());
		project.setProjExpEndDate(projectDTO.getProjExpEndDate());
		project.setProjDependID(projectDTO.getProjDependID());
		project.setProjCurState(projectDTO.getProjCurState());
		project.setProjOrganizeType(projectDTO.getProjOrganizeType());
		project.setProjPerInCharge(projectDTO.getProjPerInCharge());
		project.setProjFuncPoint(projectDTO.getProjFuncPoint());
		project.setProjCouBusiness(projectDTO.getProjCouBusiness());
		project.setProjRemark(projectDTO.getProjRemark());	
		project.setProjMember(projectDTO.getProjMember());	
		project.setProjModifier("Admin");
		Date now = new Date();		
		project.setProjModTime(now);
		return projectServiceCore.updateProject(project);
		
	}	
	
	@Override
	public String getProjReqNum(){
		List<String> projReqNums = projectServiceCore.getProjReqNum();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("ProjReqNums", projReqNums);
		return JSONObject.fromObject(jsonObject).toString();
	}

	public ProjectServiceCore getProjectServiceCore() {
		return projectServiceCore;
	}

	public void setProjectServiceCore(ProjectServiceCore projectServiceCore) {
		this.projectServiceCore = projectServiceCore;
	}
}
