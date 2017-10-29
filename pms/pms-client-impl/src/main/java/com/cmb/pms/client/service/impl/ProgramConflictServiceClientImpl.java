package com.cmb.pms.client.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.cmb.pms.client.dto.ProgramConflictDTO;
import com.cmb.pms.client.service.ProgramConflictServiceClient;
import com.cmb.pms.core.service.ProgramConflictServiceCore;
import com.cmb.pms.core.model.ProgramConflict;
import com.cmb.pms.core.model.Project;

public class ProgramConflictServiceClientImpl implements ProgramConflictServiceClient {

	private ProgramConflictServiceCore programConflictServiceCore;
	
	@Override
	public String getProgramConflictLists(String conProName, String conProID,String conProjName,String conPerInCharge,int pageNum) {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = 16;
		int startIndex = 0; // 开始索引

		totalNum = programConflictServiceCore.getTotalNum(conProName, conProID,conProjName, conPerInCharge);

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
		
		List<ProgramConflict> programConflictListTemp = programConflictServiceCore.getProgramConflicts(conProName, conProID,conProjName, conPerInCharge, startIndex, pageSize);
		
		//将数据按照程序名重新排序并统计同名数量
		Map<String, Integer> nameAndCount = new HashMap<String, Integer>();
		List<ProgramConflict> programConflictList = new ArrayList<>();	
		int c=1;
		for(int i=0;i<programConflictListTemp.size();i++){
			programConflictList.add(programConflictListTemp.get(i));
			c=1;
			for(int j=i+1;j<programConflictListTemp.size()&&(j>i);j++){
				if(programConflictListTemp.get(j).getConProName().equals(programConflictListTemp.get(i).getConProName())){
					
					programConflictList.add(programConflictListTemp.get(j));
					programConflictListTemp.remove(j);
					j--;
					c++;
				}
			}
			nameAndCount.put(programConflictListTemp.get(i).getConProName(), c);
		}
		
		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (ProgramConflict programConflict : programConflictList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("conProName", programConflict.getConProName());
			jsonObject.put("conProID", programConflict.getConProID());
			if(programConflict.getConProjName()!=null){
				jsonObject.put("conProjName", programConflict.getConProjName());
			}else{jsonObject.put("conProjName", "");
			}
			if(programConflict.getConPerInCharge()!=null){
				jsonObject.put("conPerInCharge", programConflict.getConPerInCharge());
			}else{jsonObject.put("conPerInCharge", "");
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			if(programConflict.getConSTStaTime()!=null){
				jsonObject.put("conSTStaTime", sdf.format(programConflict.getConSTStaTime()));
			}else{jsonObject.put("conSTStaTime", "");
			}
			if(programConflict.getConUATStaTime()!=null){
				jsonObject.put("conUATStaTime", sdf.format(programConflict.getConUATStaTime()));
			}else{jsonObject.put("conUATStaTime", "");
			}
			if(programConflict.getConExOnlineDate()!=null){
				jsonObject.put("conExOnlineDate",sdf.format(programConflict.getConExOnlineDate()));
			}else{jsonObject.put("conExOnlineDate", "");
			}
			if(programConflict.getConSolution()!=null){
				jsonObject.put("conSolution", programConflict.getConSolution().replace(";", "<br>"));
			}else{jsonObject.put("conSolution", "");
			}
			jsonObject.put("nameCount", nameAndCount.get(programConflict.getConProName()));
			jsonObject.put("conID", programConflict.getConID());

			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("conDTOsList", jsonArray);
		result.put("consTotalNum", totalNum);
		result.put("consTotalPage", totalPage);
		return JSONObject.fromObject(result).toString();
	}

	@Override
	public String saveProgramConflict(ProgramConflictDTO programConflictDTO) {
		ProgramConflict programConflict = new ProgramConflict();		
		programConflict.setConProName(programConflictDTO.getConProName());
		programConflict.setConSolution(programConflictDTO.getConSolution());
		
		programConflict.setConCreator("Admin");
		programConflict.setConModifier("Admin");
		Date now = new Date();
		programConflict.setConCreTime(now);
		programConflict.setConModTime(now);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String projNums = programConflictDTO.getConProID();
		String[] projNumsArray = projNums.split(";");
		for(int i=0;i<projNumsArray.length;i++){
			String project = getConProject(projNumsArray[i].trim());

			JSONObject jsStr = JSONObject.fromObject(project);
			programConflict.setConProID(projNumsArray[i].trim());
			programConflict.setConProjName(jsStr.get("conProjName").toString());
			programConflict.setConPerInCharge(jsStr.get("conPerInCharge").toString());
			String st = jsStr.get("conSTStaTime").toString();
			String uat = jsStr.get("conUATStaTime").toString();
			String online = jsStr.get("conExOnlineDate").toString();
			if (!"".equals(st.trim())) {
				try {					
					programConflict.setConSTStaTime(sdf.parse(st.trim()));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			if (!"".equals(uat.trim())) {
				try {					
					programConflict.setConUATStaTime(sdf.parse(uat.trim()));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			if (!"".equals(online.trim())) {
				try {					
					programConflict.setConExOnlineDate(sdf.parse(online.trim()));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			programConflictServiceCore.insertProgramConflict(programConflict);
		}
		return  "success";
	}
	
	@Override
	public String deleteProgramConflict(String conID){
		return programConflictServiceCore.deleteProgramConflict(conID);
	}
	
	@Override
	public String updateProgramConflict(ProgramConflictDTO programConflictDTO){		
        ProgramConflict programConflict = programConflictServiceCore.getProgramConflictByID(programConflictDTO.getConID().toString());
        
        programConflict.setConID(programConflictDTO.getConID());
		programConflict.setConProName(programConflictDTO.getConProName());				
		programConflict.setConProID(programConflictDTO.getConProID());
		programConflict.setConProjName(programConflictDTO.getConProjName());
		programConflict.setConPerInCharge(programConflictDTO.getConPerInCharge());
		programConflict.setConSTStaTime(programConflictDTO.getConSTStaTime());
		programConflict.setConUATStaTime(programConflictDTO.getConUATStaTime());
		programConflict.setConExOnlineDate(programConflictDTO.getConExOnlineDate());
		programConflict.setConSolution(programConflictDTO.getConSolution());				
		programConflict.setConModifier("Admin");
		Date now = new Date();		
		programConflict.setConModTime(now);
		return programConflictServiceCore.updateProgramConflict(programConflict);
		
	}
	
	@Override
	public String getConProject(String conProID){
		Project project = new Project();
		
		project = programConflictServiceCore.getConProject(conProID);
				
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("conProID", conProID);	
		jsonObject.put("conProjName", project.getProjName());	
		if(project.getProjPerInCharge()!=null){
			jsonObject.put("conPerInCharge", project.getProjPerInCharge());
		}else{jsonObject.put("conPerInCharge", "");
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(project.getProjSTStartDate()!=null){
			jsonObject.put("conSTStaTime", sdf.format(project.getProjSTStartDate()));
		}else{jsonObject.put("conSTStaTime", "");
		}
		if(project.getProjUATStartDate()!=null){
			jsonObject.put("conUATStaTime", sdf.format(project.getProjUATStartDate()));
		}else{jsonObject.put("conUATStaTime", "");
		}
		if(project.getProjOnlineDate()!=null){
			jsonObject.put("conExOnlineDate",sdf.format(project.getProjOnlineDate()));
		}else{jsonObject.put("conExOnlineDate", "");
		}

		return jsonObject.toString();
	}
	
	@Override
	public String getConProjNumber(){
		List<String> projNumbers = programConflictServiceCore.getConProjNumber();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("conProjNumber", projNumbers);
		return JSONObject.fromObject(jsonObject).toString();
	}
	
	public ProgramConflictServiceCore getPublicActivityServiceCore() {
		return programConflictServiceCore;
	}

	public void setProgramConflictServiceCore(
			ProgramConflictServiceCore programConflictServiceCore) {
		this.programConflictServiceCore = programConflictServiceCore;
	}

}
