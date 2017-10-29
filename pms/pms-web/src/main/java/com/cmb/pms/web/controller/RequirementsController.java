package com.cmb.pms.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmb.pms.client.dto.ReqDTO;
import com.cmb.pms.client.service.RequirementsServiceClient;

/*
 * @Author WuPing
 */

@Controller
public class RequirementsController {

	@Resource(name = "requirementsServiceClient")
	private RequirementsServiceClient requirementsServiceClient;

	/************           需求列表                      *****************/
	@RequestMapping(value = "loadReqsList.do", method = RequestMethod.GET)
	public String loadReqsList(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/reqs/reqs_list";
	}
	
	@RequestMapping(value = "searchReqs.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchReqs(HttpServletRequest request, HttpServletResponse response) {
		String reqNum = request.getParameter("reqNum").trim();      // 注意清除空格，否则影响查询
		String reqName = request.getParameter("reqName").trim(); 
		String reqPerInCharge = request.getParameter("reqPerInCharge").trim(); 
		String assessmentDateStart = request.getParameter("assessmentDateStart").trim(); 
		String assessmentDateEnd = request.getParameter("assessmentDateEnd").trim(); 
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号

		Map<String,String> condition = new HashMap<>();
		condition.put("reqNum", reqNum);
		condition.put("reqName", reqName);
		condition.put("reqPerInCharge", reqPerInCharge);
		condition.put("assessmentDateStart", assessmentDateStart);
		condition.put("assessmentDateEnd", assessmentDateEnd);
		
		String result = requirementsServiceClient.getReqList(condition, pageNum);
	
		return result;
	}
	
	@RequestMapping(value = "deleteReq.do", produces = "text/html;charset=UTF-8")
	public  @ResponseBody String deleteReq(HttpServletRequest request, HttpServletResponse response) {
		Integer reqID = Integer.parseInt(request.getParameter("reqID"));   // 主键
		String reqNum = request.getParameter("reqNum").trim();   
		
		return requirementsServiceClient.deleteReq(reqID, reqNum);
	}
	
	@RequestMapping(value = "getReqByID.do", produces = "text/html;charset=UTF-8")
	public  @ResponseBody  String getReqByID(HttpServletRequest request, HttpServletResponse response) {
		Integer reqID = Integer.parseInt(request.getParameter("reqID"));   // 主键

		String result = requirementsServiceClient.selectReqByID(reqID);
		return result;
	}
	
	@RequestMapping(value = "isHasReq.do", produces = "text/html;charset=UTF-8")
	public  @ResponseBody  String isHasReq(HttpServletRequest request, HttpServletResponse response) {
		String newReqNum = request.getParameter("newReqNum").trim();

		if (requirementsServiceClient.isHasReq(newReqNum)) {
			return "1";
		}
		return "0";
	}
	
	@RequestMapping(value = "createReq.do", produces = "text/html;charset=UTF-8")
	public void createReq(HttpServletRequest request, HttpServletResponse response) {
		String newReqNum = request.getParameter("newReqNum").trim();
		String newReqName = request.getParameter("newReqName").trim();
		String newReqState = request.getParameter("newReqState").trim();
		String newReqAssessmentDate = request.getParameter("newReqAssessmentDate").trim();
		String newReqScheduleStartDate = request.getParameter("newReqScheduleStartDate").trim();
		String newReqScheduleDate = request.getParameter("newReqScheduleDate").trim();
		String newReqStartDate = request.getParameter("newReqStartDate").trim();
		String newReqOrganizeType = request.getParameter("newReqOrganizeType").trim();
		String newReqPriority = request.getParameter("newReqPriority").trim();
		String newReqContent = request.getParameter("newReqContent").trim();
		String newReqPerInCharge = request.getParameter("newReqPerInCharge").trim();
		String newReqMember = request.getParameter("newReqMember").trim();
		String newReqAssessment = request.getParameter("newReqAssessment").trim();
		String newReqAuthor = request.getParameter("newReqAuthor").trim();
		String newReqBusDepart = request.getParameter("newReqBusDepart").trim();
		String newReqComment = request.getParameter("newReqComment").trim();

		ReqDTO reqDTO = new ReqDTO();
		reqDTO.setReqNum(newReqNum);
		reqDTO.setReqName(newReqName);
		reqDTO.setReqState(newReqState);
		reqDTO.setReqAssessmentDate(newReqAssessmentDate);
		reqDTO.setReqScheduleStartDate(newReqScheduleStartDate);
		reqDTO.setReqScheduleDate(newReqScheduleDate);
		reqDTO.setReqStartDate(newReqStartDate);
		reqDTO.setReqOrganizeType(newReqOrganizeType);
		reqDTO.setReqPriority(newReqPriority);
		reqDTO.setReqContent(newReqContent);
		reqDTO.setReqPerInCharge(newReqPerInCharge);
		reqDTO.setReqMember(newReqMember);
		reqDTO.setReqAssessment(newReqAssessment);
		reqDTO.setReqAuthor(newReqAuthor);
		reqDTO.setReqBusDepart(newReqBusDepart);
		reqDTO.setReqComment(newReqComment);
		
		requirementsServiceClient.saveReq(reqDTO);
	}
	
	@RequestMapping(value = "updateReq.do", produces = "text/html;charset=UTF-8")
	public void updateReq(HttpServletRequest request, HttpServletResponse response) {
		Integer reqID = Integer.parseInt(request.getParameter("reqID"));   // 主键
		
		String newReqNum = request.getParameter("newReqNum").trim();
		String newReqName = request.getParameter("newReqName").trim();
		String newReqState = request.getParameter("newReqState").trim();
		String newReqAssessmentDate = request.getParameter("newReqAssessmentDate").trim();
		String newReqScheduleStartDate = request.getParameter("newReqScheduleStartDate").trim();
		String newReqScheduleDate = request.getParameter("newReqScheduleDate").trim();
		String newReqStartDate = request.getParameter("newReqStartDate").trim();
		String newReqOrganizeType = request.getParameter("newReqOrganizeType").trim();
		String newReqPriority = request.getParameter("newReqPriority").trim();
		String newReqContent = request.getParameter("newReqContent").trim();
		String newReqPerInCharge = request.getParameter("newReqPerInCharge").trim();
		String newReqMember = request.getParameter("newReqMember").trim();
		String newReqAssessment = request.getParameter("newReqAssessment").trim();
		String newReqAuthor = request.getParameter("newReqAuthor").trim();
		String newReqBusDepart = request.getParameter("newReqBusDepart").trim();
		String newReqComment = request.getParameter("newReqComment").trim();

		ReqDTO reqDTO = new ReqDTO();
		reqDTO.setReqID(reqID);
		
		reqDTO.setReqNum(newReqNum);
		reqDTO.setReqName(newReqName);
		reqDTO.setReqState(newReqState);
		reqDTO.setReqAssessmentDate(newReqAssessmentDate);
		reqDTO.setReqScheduleStartDate(newReqScheduleStartDate);
		reqDTO.setReqScheduleDate(newReqScheduleDate);
		reqDTO.setReqStartDate(newReqStartDate);
		reqDTO.setReqOrganizeType(newReqOrganizeType);
		reqDTO.setReqPriority(newReqPriority);
		reqDTO.setReqContent(newReqContent);
		reqDTO.setReqPerInCharge(newReqPerInCharge);
		reqDTO.setReqMember(newReqMember);
		reqDTO.setReqAssessment(newReqAssessment);
		reqDTO.setReqAuthor(newReqAuthor);
		reqDTO.setReqBusDepart(newReqBusDepart);
		reqDTO.setReqComment(newReqComment);
		
		requirementsServiceClient.updateReq(reqDTO);
	}
	
	 /************           预研需求                      *****************/
	@RequestMapping(value = "loadPreResearchReqs.do", method = RequestMethod.GET)
	public String loadPreResearchReqs(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/reqs/pre_research_reqs";
	}
	
	@RequestMapping(value = "searchPreResReqs.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchPreResReqs(
			HttpServletRequest request, HttpServletResponse response) {
		String reqNum = request.getParameter("reqNum").trim();      // 注意清除空格，否则影响查询
		String reqName = request.getParameter("reqName").trim(); 
		String reqPerInCharge = request.getParameter("reqPerInCharge").trim(); 
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号

		String result = requirementsServiceClient.getPreResReqList(
				reqNum, reqName, reqPerInCharge, pageNum);
	
		return result;
	}

	 /************           意向性需求                      *****************/
	@RequestMapping(value = "loadIntentionalityReqs.do", method = RequestMethod.GET)
	public String loadIntentionalityReqs(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/reqs/intentionality_reqs";
	}
	
	@RequestMapping(value = "searchIntentionReqs.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchIntentionReqs(
			HttpServletRequest request, HttpServletResponse response) {
		String reqNum = request.getParameter("reqNum").trim();      // 注意清除空格，否则影响查询
		String reqName = request.getParameter("reqName").trim(); 
		String reqPerInCharge = request.getParameter("reqPerInCharge").trim(); 
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号

		String result = requirementsServiceClient.getIntentionReqList(reqNum, reqName, reqPerInCharge, pageNum);
	
		return result;
	}
	
	/************           待完善需求                      *****************/
	@RequestMapping(value = "loadWaitPerfectReqs.do", method = RequestMethod.GET)
	public String loadWaitPerfectReqs(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/reqs/wait_perfect_reqs";
	}
	
	@RequestMapping(value = "searchWaitPerfectReqs.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchWaitPerfectReqs(HttpServletRequest request, HttpServletResponse response) {
		String reqNum = request.getParameter("reqNum").trim();      // 注意清除空格，否则影响查询
		String reqName = request.getParameter("reqName").trim(); 
		String reqPerInCharge = request.getParameter("reqPerInCharge").trim(); 
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号

		String result = requirementsServiceClient.getWaitPerfectReqList(reqNum, reqName, reqPerInCharge, pageNum);
	
		return result;
	}
	
	/************            评估中需求                      *****************/
	@RequestMapping(value = "loadEstimatingReqs.do", method = RequestMethod.GET)
	public String loadEstimatingReqs(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/reqs/estimating _reqs";
	}
	
	@RequestMapping(value = "searchEstimatingReqs.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchEstimatingReqs(
			HttpServletRequest request, HttpServletResponse response) {
		String reqNum = request.getParameter("reqNum").trim();      // 注意清除空格，否则影响查询
		String reqName = request.getParameter("reqName").trim(); 
		String reqPerInCharge = request.getParameter("reqPerInCharge").trim(); 
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号

		String result = requirementsServiceClient.getEstimatingReqList(reqNum, reqName, reqPerInCharge, pageNum);
	
		return result;
	}
	
	/************            排期开发需求                      *****************/
	@RequestMapping(value = "loadSchedulDevReqs.do", method = RequestMethod.GET)
	public String loadSchedulDevReqs(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/reqs/schedul_dev_reqs";
	}
	
	@RequestMapping(value = "searchSchedulDevReqs.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchSchedulDevReqs(
			HttpServletRequest request, HttpServletResponse response) {
		String reqNum = request.getParameter("reqNum").trim();      // 注意清除空格，否则影响查询
		String reqName = request.getParameter("reqName").trim(); 
		String reqPerInCharge = request.getParameter("reqPerInCharge").trim(); 
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号

		String result = requirementsServiceClient.getSchedulingDevelopList(reqNum, reqName, reqPerInCharge, pageNum);
	
		return result;
	}
	
	/************           暂缓需求                      *****************/
	@RequestMapping(value = "loadDeferReqs.do", method = RequestMethod.GET)
	public String loadDeferReqs(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/reqs/defer_reqs";
	}
	
	@RequestMapping(value = "searchDeferReqs.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchDeferReqs(HttpServletRequest request, HttpServletResponse response) {
		String reqNum = request.getParameter("reqNum").trim();      // 注意清除空格，否则影响查询
		String reqName = request.getParameter("reqName").trim(); 
		String reqPerInCharge = request.getParameter("reqPerInCharge").trim(); 
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号

		String result = requirementsServiceClient.getDeferReqList(reqNum, reqName, reqPerInCharge, pageNum);
	
		return result;
	}
	
	/************           开发中需求                      *****************/
	@RequestMapping(value = "loadDevelopingReqs.do", method = RequestMethod.GET)
	public String loadDevelopingReqs(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/reqs/developing_reqs";
	}
	
	@RequestMapping(value = "searchDevelopingReqs.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchDevelopingReqs(HttpServletRequest request, HttpServletResponse response) {
		String reqNum = request.getParameter("reqNum").trim();      // 注意清除空格，否则影响查询
		String reqName = request.getParameter("reqName").trim(); 
		String reqPerInCharge = request.getParameter("reqPerInCharge").trim(); 
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号

		String result = requirementsServiceClient.getDevelopingReqList(reqNum, reqName, reqPerInCharge, pageNum);
	
		return result;
	}
	
	/************          已上线需求                      *****************/
	@RequestMapping(value = "loadOnLinedReqs.do", method = RequestMethod.GET)
	public String loadOnLinedReqs(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/reqs/on_lined_reqs";
	}
	
	@RequestMapping(value = "searchOnLinedReqs.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchOnLinedReqs(HttpServletRequest request, HttpServletResponse response) {
		String reqNum = request.getParameter("reqNum").trim();      // 注意清除空格，否则影响查询
		String reqName = request.getParameter("reqName").trim(); 
		String reqPerInCharge = request.getParameter("reqPerInCharge").trim(); 
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号

		String result = requirementsServiceClient.getOnLinedReqList(reqNum, reqName, reqPerInCharge, pageNum);
	
		return result;
	}
}
