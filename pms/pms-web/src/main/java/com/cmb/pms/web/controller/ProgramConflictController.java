package com.cmb.pms.web.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmb.pms.client.dto.ProgramConflictDTO;
import com.cmb.pms.client.service.ProgramConflictServiceClient;

import net.sf.json.JSONObject;
/*
 * @Author ChenQian
 */

@Controller
public class ProgramConflictController {
	@Resource(name = "programConflictServiceClient")
	private ProgramConflictServiceClient programConflictServiceClient;

	// 新添加的页面加载方法，用于权限，By WuPing
	// --------------- 开始 --------------------------
	@RequestMapping(value = "loadProgramConflict.do", method = RequestMethod.GET)
	public String loadProgramConflict(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/program_conflict";
	}
	// --------------- 结束 --------------------------
		
	@RequestMapping(value = "searchProgramConflicts.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchProgramConflicts(
			HttpServletRequest request, HttpServletResponse response) {
		String conProName = request.getParameter("conProName"); // 冲突程序名
		String conProID = request.getParameter("conProID"); // 项目编号
		String conProjName = request.getParameter("conProjName"); // 项目名
		String conPerInCharge = request.getParameter("conPerInCharge"); // 负责人	
/*		String conSolution = request.getParameter("conSolution"); // 解决方案
		String conSTStaTime = request.getParameter("conSTStaTime"); // ST开始时间
		String conUATStaTime = request.getParameter("conUATStaTime"); // UAT开始时间
		String conExOnlineTime = request.getParameter("conExOnlineTime"); // 预计上线时间
*/        		
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号		 
		return programConflictServiceClient.getProgramConflictLists(conProName, conProID,conProjName,conPerInCharge, pageNum);
	}
	
	// 新建冲突程序
	@RequestMapping(value = "createProgramConflict.do", produces = "text/html;charset=UTF-8")
	public void createProgramConflict(HttpServletRequest request, HttpServletResponse response) {
		String newConProName = request.getParameter("newConProName").trim(); 
		String newConProID = request.getParameter("newConProID").trim();
		String newConSolution = request.getParameter("newConSolution").trim();
				
		ProgramConflictDTO programConflictDTO = new ProgramConflictDTO();	
		
		programConflictDTO.setConProName(newConProName);
		programConflictDTO.setConProID(newConProID);	
		programConflictDTO.setConSolution(newConSolution);	
		programConflictServiceClient.saveProgramConflict(programConflictDTO);
	}
	
	// 删除冲突程序
	@RequestMapping(value = "deleteProgramConflict.do", produces = "text/html;charset=UTF-8")
	public void deleteProgramConflict(HttpServletRequest request, HttpServletResponse response) {
		String deleteConID = request.getParameter("deleteConID"); 						
		programConflictServiceClient.deleteProgramConflict(deleteConID);
	}	
	
	//更新冲突程序
	@RequestMapping(value = "updateProgramConflict.do", produces = "text/html;charset=UTF-8")
	public void updateProgramConflict(HttpServletRequest request, HttpServletResponse response) {
		String conID = request.getParameter("conID");
		String updateConProName = request.getParameter("updateConProName"); 
		String updateConSolution = request.getParameter("updateConSolution"); 
		String updateNewConProID = request.getParameter("updateNewConProID");
					
		ProgramConflictDTO programConflictDTO = new ProgramConflictDTO();	

		programConflictDTO.setConID(Integer.valueOf(conID));
		programConflictDTO.setConProName(updateConProName);	
		programConflictDTO.setConSolution(updateConSolution);		
		programConflictServiceClient.updateProgramConflict(programConflictDTO);
		if(updateNewConProID.trim()!=null&&!"".equals(updateNewConProID.trim())){
			ProgramConflictDTO newProgramConflictDTO = new ProgramConflictDTO();				
			newProgramConflictDTO.setConProName(updateConProName);
			newProgramConflictDTO.setConProID(updateNewConProID.trim());	
			newProgramConflictDTO.setConSolution(updateConSolution);	
			programConflictServiceClient.saveProgramConflict(newProgramConflictDTO);
		}				
	}
	
	@RequestMapping(value = "searchConProject.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchConProject(
			HttpServletRequest request, HttpServletResponse response) {		
		String conProID = request.getParameter("conProID").trim(); // 项目编号		
		return programConflictServiceClient.getConProject(conProID);
	}
	
	@RequestMapping(value = "serchConProjNumber.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String serchConProjNumber(
			HttpServletRequest request, HttpServletResponse response) {							
		return programConflictServiceClient.getConProjNumber();
	}	
	
	@RequestMapping(value = "getAutoSolution.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String getAutoSolution(
			HttpServletRequest request, HttpServletResponse response) {
		String conProIDs = request.getParameter("conProjNumber").trim(); // 项目编号
		String[] myProIDs = conProIDs.split(";");
		Map<String, String> myMap = new HashMap<String, String>();
		for(int i=0;i<myProIDs.length;i++){
			JSONObject jsStr = JSONObject.fromObject(programConflictServiceClient.getConProject(myProIDs[i]));			
			myMap.put(jsStr.getString("conProID"), jsStr.getString("conExOnlineDate"));
		}
		
		//将项目按照上线时间排序
        List<Map.Entry<String, String>> list = new ArrayList<Map.Entry<String, String>>(myMap.entrySet());
        // 通过比较器来实现排序
        Collections.sort(list, new Comparator<Map.Entry<String, String>>() {
            @Override
            public int compare(Map.Entry<String, String> o1, Map.Entry<String, String> o2) {
                // 降序排序
                return o2.getValue().compareTo(o1.getValue());
            }
        });
        String solution = "";  
        boolean flag=false;
        String preKey = "";
        for(Map.Entry<String, String> li:list){
        	if(!flag){
        		solution +=li.getKey();
        	}else{
        		solution +=preKey+"在"+li.getKey()+"基础上更改\n";
        		preKey = li.getKey();
        	}
        	flag=true;
        }         
        
        JSONObject result =  new JSONObject();
        result.put("solution", solution);

		return result.toString();
	}
	
}
