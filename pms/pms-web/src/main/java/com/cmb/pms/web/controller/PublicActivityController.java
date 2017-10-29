package com.cmb.pms.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmb.pms.client.dto.InterTrainingDTO;
import com.cmb.pms.client.dto.PublicActivityDTO;
import com.cmb.pms.client.service.InterTrainingServiceClient;
import com.cmb.pms.client.service.PublicActivityServiceClient;

/*
 * @Author WuPing
 */

@Controller
public class PublicActivityController {

	@Resource(name = "publicActivityServiceClient")
	private PublicActivityServiceClient publicActivityServiceClient;
	
	@Resource(name = "interTrainingServiceClient")
	private InterTrainingServiceClient interTrainingServiceClient;

	// ---------------  公共活动相关方法 --------------------------
	@RequestMapping(value = "loadPublicActivity.do", method = RequestMethod.GET)
	public String loadPublicActivity(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/pub_acts/public_activity";
	}
	
	@RequestMapping(value = "searchPublicActivities.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchPublicActivities(
			HttpServletRequest request, HttpServletResponse response) {
		String actContent = request.getParameter("actContent").trim(); // 活动内容及任务
		String actPerInCharge = request.getParameter("actPerInCharge").trim(); // 负责人
		String actProgress = request.getParameter("actProgress").trim(); // 进展情况
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号

		String result = publicActivityServiceClient.getPublicActivityList(
				actContent, actPerInCharge, actProgress, pageNum);

		return result;
	}

	// 新建公共活动
	@RequestMapping(value = "createPublicActivity.do", produces = "text/html;charset=UTF-8")
	public void createPublicActivity(HttpServletRequest request, HttpServletResponse response) {
		String newActContent = request.getParameter("newActContent").trim(); 
		String newActPerInCharge = request.getParameter("newActPerInCharge").trim(); 
		String newActProgress = request.getParameter("newActProgress").trim(); 
		
		PublicActivityDTO publicActivityDTO = new PublicActivityDTO();
		publicActivityDTO.setActContent(newActContent);
		publicActivityDTO.setActPerInCharge(newActPerInCharge);
		publicActivityDTO.setActProgress(newActProgress);
		publicActivityServiceClient.savePublicActivity(publicActivityDTO);
	}
	
	@RequestMapping(value = "deletePublicActivity.do", produces = "text/html;charset=UTF-8")
	public  void deletePublicActivity(HttpServletRequest request, HttpServletResponse response) {
		Integer actID = Integer.parseInt(request.getParameter("actID"));   // 主键

		publicActivityServiceClient.deletePublicActivity(actID);
	}
	
	@RequestMapping(value = "getPublicActivityByID.do", produces = "text/html;charset=UTF-8")
	public  @ResponseBody  String getPublicActivityByID(HttpServletRequest request, HttpServletResponse response) {
		Integer actID = Integer.parseInt(request.getParameter("actID"));   // 主键

		String result = publicActivityServiceClient.selectPublicActivityByID(actID);
		return result;
	}
	
	@RequestMapping(value = "updatePublicActivity.do", produces = "text/html;charset=UTF-8")
	public void updatePublicActivity(HttpServletRequest request, HttpServletResponse response) {
		Integer actID = Integer.parseInt(request.getParameter("actID"));   // 主键
		
		String newActContent = request.getParameter("newActContent").trim(); 
		String newActPerInCharge = request.getParameter("newActPerInCharge").trim(); 
		String newActProgress = request.getParameter("newActProgress").trim(); 
		
		PublicActivityDTO publicActivityDTO = new PublicActivityDTO();
		publicActivityDTO.setActID(actID);
		
		publicActivityDTO.setActContent(newActContent);
		publicActivityDTO.setActPerInCharge(newActPerInCharge);
		publicActivityDTO.setActProgress(newActProgress);
		
		publicActivityServiceClient.updatePublicActivity(publicActivityDTO);
	}
	
	// ---------------  内部培训相关方法 --------------------------
	@RequestMapping(value = "loadInterTraining.do", method = RequestMethod.GET)
	public String loadInterTraining(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/pub_acts/inter_training";
	}
	
	@RequestMapping(value = "searchInterTrainings.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchInterTrainings(HttpServletRequest request, HttpServletResponse response) {
		String traSpeaker = request.getParameter("traSpeaker"); // 主讲人
		String traTime = request.getParameter("traTime"); // 培训时间
		String traContent = request.getParameter("traContent"); // 培训内容
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号

		String result = interTrainingServiceClient.getInterTrainingList(traSpeaker, traTime, traContent, pageNum);

		return result;
	}

	// 新建内部培训
	@RequestMapping(value = "createInterTraining.do", produces = "text/html;charset=UTF-8")
	public void createInterTraining(HttpServletRequest request, HttpServletResponse response) {
		String newTraSegment = request.getParameter("newTraSegment").trim();
		String newTraTime = request.getParameter("newTraTime").trim();
		String newTraContent = request.getParameter("newTraContent").trim();
		String newTraSpeaker = request.getParameter("newTraSpeaker").trim();
		String newTraParticipant = request.getParameter("newTraParticipant").trim();

		InterTrainingDTO interTrainingDTO = new InterTrainingDTO();
		interTrainingDTO.setTraSegment(newTraSegment);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date traTime = null;
		if (!"".equals(newTraTime.trim())) {
			try {
				traTime = sdf.parse(newTraTime.trim());
				interTrainingDTO.setTraTime(traTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		interTrainingDTO.setTraContent(newTraContent);
		interTrainingDTO.setTraSpeaker(newTraSpeaker);
		interTrainingDTO.setTraParticipant(newTraParticipant);
		
		interTrainingServiceClient.saveInterTraining(interTrainingDTO);
	}
	
	@RequestMapping(value = "deleteInterTraining.do", produces = "text/html;charset=UTF-8")
	public  void deleteInterTraining(HttpServletRequest request, HttpServletResponse response) {
		Integer traID = Integer.parseInt(request.getParameter("traID"));   // 主键

		interTrainingServiceClient.deleteInterTraining(traID);
	}
	
	@RequestMapping(value = "getInterTrainingByID.do", produces = "text/html;charset=UTF-8")
	public  @ResponseBody  String getInterTrainingByID(HttpServletRequest request, HttpServletResponse response) {
		Integer traID = Integer.parseInt(request.getParameter("traID"));   // 主键

		String result = interTrainingServiceClient.selectInterTrainingByID(traID);
		return result;
	}
	
	@RequestMapping(value = "updateInterTraining.do", produces = "text/html;charset=UTF-8")
	public void updateInterTraining(HttpServletRequest request, HttpServletResponse response) {
		Integer traID = Integer.parseInt(request.getParameter("traID"));   // 主键
		
		String newTraSegment = request.getParameter("newTraSegment").trim();
		String newTraTime = request.getParameter("newTraTime").trim();
		String newTraContent = request.getParameter("newTraContent").trim();
		String newTraSpeaker = request.getParameter("newTraSpeaker").trim();
		String newTraParticipant = request.getParameter("newTraParticipant").trim();

		InterTrainingDTO interTrainingDTO = new InterTrainingDTO();
		interTrainingDTO.setTraID(traID);
		
		interTrainingDTO.setTraSegment(newTraSegment);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date traTime = null;
		if (!"".equals(newTraTime.trim())) {
			try {
				traTime = sdf.parse(newTraTime.trim());
				interTrainingDTO.setTraTime(traTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		interTrainingDTO.setTraContent(newTraContent);
		interTrainingDTO.setTraSpeaker(newTraSpeaker);
		interTrainingDTO.setTraParticipant(newTraParticipant);
		
		interTrainingServiceClient.updateInterTraining(interTrainingDTO);
	}
}
