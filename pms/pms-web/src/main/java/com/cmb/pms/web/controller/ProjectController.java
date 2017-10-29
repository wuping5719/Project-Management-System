package com.cmb.pms.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmb.pms.client.dto.ProjectDTO;
import com.cmb.pms.client.service.ProjectServiceClient;

/*
 * @Author ChenQian
 */

@Controller
public class ProjectController {
	@Resource(name = "projectServiceClient")
	private ProjectServiceClient projectServiceClient;

	// 新添加的页面加载方法，用于权限，By WuPing
	//  --------------- 开始 --------------------------
	@RequestMapping(value = "loadProject.do", method = RequestMethod.GET)
	public String loadProject(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/project";
	}

	@RequestMapping(value = "loadProjectFinish.do", method = RequestMethod.GET)
	public String loadProjectFinish(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/project_finish";
	}
	
	@RequestMapping(value = "loadProjectBeforehand.do", method = RequestMethod.GET)
	public String loadProjectBeforehand(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/project_beforehand";
	}
	//  --------------- 结束 --------------------------	
		
	@RequestMapping(value = "searchProjects.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchProjects(
			HttpServletRequest request, HttpServletResponse response) {
		String projNumber = request.getParameter("projNumber"); // 项目编号
		String projReqNum = request.getParameter("projReqNum"); // 需求编号
		String projName = request.getParameter("projName"); //项目名称
		String projPerInCharge = request.getParameter("projPerInCharge"); // 负责人
		String projState = request.getParameter("projState"); // 负责人
		
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号

		return projectServiceClient.getProjectLists(projNumber, projReqNum,projName,projPerInCharge,projState, pageNum);		
	}
	
	@RequestMapping(value = "searchFinishProjects.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchFinishProjects(
			HttpServletRequest request, HttpServletResponse response) {
		String projNumber = request.getParameter("projNumber"); // 项目编号
		String projReqNum = request.getParameter("projReqNum"); // 需求编号
		String projName = request.getParameter("projName"); //项目名称
		String projPerInCharge = request.getParameter("projPerInCharge"); // 负责人				
		String projOnlineStart = request.getParameter("projOnlineStart"); // 上线时间上限
		String projOnlineEnd = request.getParameter("projOnlineEnd"); // 上线时间下限	
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号
		
		Map<String,String> serchCondition = new HashMap<String,String>();

		serchCondition.put("projNumber",projNumber);
		serchCondition.put("projReqNum",projReqNum);
		serchCondition.put("projName",projName);
		serchCondition.put("projPerInCharge",projPerInCharge);
		serchCondition.put("projOnlineStart",projOnlineStart);
		serchCondition.put("projOnlineEnd",projOnlineEnd);
		return projectServiceClient.getFinishProjectLists(serchCondition, pageNum);

	}
	
	//根据项目编号查询项目
	@RequestMapping(value = "searchProject.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchProject(
			HttpServletRequest request, HttpServletResponse response) {
		String projNumber = request.getParameter("projNumber"); // 项目编号		
		return projectServiceClient.getProject(projNumber);		
	}
	
	// 新建冲突程序
	@RequestMapping(value = "createProject.do", produces = "text/html;charset=UTF-8")
	public void createProject(HttpServletRequest request, HttpServletResponse response) {
		String newProjNumber = request.getParameter("newProjNumber"); 
		String newProjReqNum = request.getParameter("newProjReqNum");
		String newProjName = request.getParameter("newProjName"); 
		String newProjStartDate = request.getParameter("newProjStartDate");
		String newProjSTEndDate = request.getParameter("newProjSTEndDate"); 		
		String newProjOnlineDate = request.getParameter("newProjOnlineDate"); 
		String newProjExpEndDate = request.getParameter("newProjExpEndDate");
		String newProjDependID = request.getParameter("newProjDependID");
		String newProjCurState = request.getParameter("newProjCurState");		
		String newProjOrganizeType = request.getParameter("newProjOrganizeType");
		String newProjPerInCharge = request.getParameter("newProjPerInCharge"); 		
		String newProjFuncPoint = request.getParameter("newProjFuncPoint"); 
		String newProjCouBusiness = request.getParameter("newProjCouBusiness");
		String newProjMember = request.getParameter("newProjMember");
		String newProjRemark = request.getParameter("newProjRemark");
	
		ProjectDTO projectDTO = new ProjectDTO();
		
		//String to Date格式转换
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date projStartDate = null;
		Date projSTEndDate = null;
		Date projOnlineDate = null;
		Date projExpEndDate = null;
		if (newProjStartDate!=null&&!"".equals(newProjStartDate.trim())) {
			try {
				projStartDate = sdf.parse(newProjStartDate.trim());
				projectDTO.setProjStartDate(projStartDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (newProjSTEndDate!=null&&!"".equals(newProjSTEndDate.trim())) {
			try {
				projSTEndDate = sdf.parse(newProjSTEndDate.trim());
				projectDTO.setProjSTEndDate(projSTEndDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (newProjOnlineDate!=null&&!"".equals(newProjOnlineDate.trim())) {
			try {
				projOnlineDate = sdf.parse(newProjOnlineDate.trim());
				projectDTO.setProjOnlineDate(projOnlineDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (newProjExpEndDate!=null&&!"".equals(newProjExpEndDate.trim())) {
			try {
				projExpEndDate = sdf.parse(newProjExpEndDate.trim());
				projectDTO.setProjExpEndDate(projExpEndDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		projectDTO.setProjNumber(newProjNumber);
		projectDTO.setProjReqNum(newProjReqNum);
		projectDTO.setProjName(newProjName);
		projectDTO.setProjDependID(newProjDependID);
		projectDTO.setProjCurState(newProjCurState);
		projectDTO.setProjOrganizeType(newProjOrganizeType);
		projectDTO.setProjPerInCharge(newProjPerInCharge);
		if(newProjFuncPoint!=null&&!"".equals(newProjFuncPoint.trim())){
			projectDTO.setProjFuncPoint(Float.parseFloat(newProjFuncPoint));
		}
		projectDTO.setProjCouBusiness(newProjCouBusiness);
		projectDTO.setProjMember(newProjMember);
		projectDTO.setProjRemark(newProjRemark);
		projectServiceClient.saveProject(projectDTO);
	}
	
	// 删除冲突程序
	@RequestMapping(value = "deleteProject.do", produces = "text/html;charset=UTF-8")
	public void deleteProject(HttpServletRequest request, HttpServletResponse response) {
		String deleteProjID = request.getParameter("deleteProjID"); 						
		projectServiceClient.deleteProject(deleteProjID);
	}	
	
	//更新冲突程序
	@RequestMapping(value = "updateProject.do", produces = "text/html;charset=UTF-8")
	public void updateProject(HttpServletRequest request, HttpServletResponse response) {
		String projID = request.getParameter("projID");
		String updateProjNumber = request.getParameter("updateProjNumber").trim(); 
		String updateProjReqNum = request.getParameter("updateProjReqNum").trim();
		String updateProjName = request.getParameter("updateProjName").trim(); 
		String updateProjStartDate = request.getParameter("updateProjStartDate");
		String updateProjSTEndDate = request.getParameter("updateProjSTEndDate"); 		
		String updateProjOnlineDate = request.getParameter("updateProjOnlineDate");  
		String updateProjExpEndDate = request.getParameter("updateProjExpEndDate"); 
		String updateProjDependID = request.getParameter("updateProjDependID");
		String updateProjCurState = request.getParameter("updateProjCurState").trim();		
		String updateProjOrganizeType = request.getParameter("updateProjOrganizeType").trim();
		String updateProjPerInCharge = request.getParameter("updateProjPerInCharge").trim(); 		
		String updateProjFuncPoint = request.getParameter("updateProjFuncPoint"); 
		String updateProjCouBusiness = request.getParameter("updateProjCouBusiness").trim();
		String updateProjMember = request.getParameter("updateProjMember").trim(); 
		String updateProjRemark = request.getParameter("updateProjRemark").trim();
		
		
		ProjectDTO projectDTO = new ProjectDTO();	
		//String to Date格式转换
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date projStartDate = null;
		Date projSTEndDate = null;
		Date projOnlineDate = null;
		Date projExpEndDate = null;
		if (updateProjStartDate!=null&&!"".equals(updateProjStartDate.trim())) {
			try {
				projStartDate = sdf.parse(updateProjStartDate.trim());
				projectDTO.setProjStartDate(projStartDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (updateProjSTEndDate!=null&&!"".equals(updateProjSTEndDate.trim())) {
			try {
				projSTEndDate = sdf.parse(updateProjSTEndDate.trim());
				projectDTO.setProjSTEndDate(projSTEndDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (updateProjOnlineDate!=null&&!"".equals(updateProjOnlineDate.trim())) {
			try {
				projOnlineDate = sdf.parse(updateProjOnlineDate.trim());
				projectDTO.setProjOnlineDate(projOnlineDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (updateProjExpEndDate!=null&&!"".equals(updateProjExpEndDate.trim())) {
			try {
				projExpEndDate = sdf.parse(updateProjExpEndDate.trim());
				projectDTO.setProjExpEndDate(projExpEndDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		projectDTO.setProjID(Integer.valueOf(projID));
		projectDTO.setProjNumber(updateProjNumber);
		projectDTO.setProjReqNum(updateProjReqNum);
		projectDTO.setProjName(updateProjName);
		projectDTO.setProjDependID(updateProjDependID);				
		projectDTO.setProjCurState(updateProjCurState);
		projectDTO.setProjOrganizeType(updateProjOrganizeType);
		projectDTO.setProjPerInCharge(updateProjPerInCharge);
		if(updateProjFuncPoint!=null&&!updateProjFuncPoint.equals("")){
			try {
				projectDTO.setProjFuncPoint(Float.parseFloat(updateProjFuncPoint));
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		projectDTO.setProjCouBusiness(updateProjCouBusiness);
		projectDTO.setProjMember(updateProjMember);	
		projectDTO.setProjRemark(updateProjRemark);		
		
		projectServiceClient.updateProject(projectDTO);
	}	
	
	@RequestMapping(value = "serchProjReqNum.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String serchProjReqNum(
			HttpServletRequest request, HttpServletResponse response) {							
		return projectServiceClient.getProjReqNum();
	}	
}
