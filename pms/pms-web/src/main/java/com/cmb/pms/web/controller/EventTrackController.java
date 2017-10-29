package com.cmb.pms.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmb.pms.client.dto.EventTrackDTO;
import com.cmb.pms.client.service.EventTrackServiceClient;

/*
 * @Author ChenQian
 */

@Controller
public class EventTrackController {
	
	@Resource(name = "eventTrackServiceClient")
	private EventTrackServiceClient eventTrackServiceClient;

	// 新添加的页面加载方法，用于权限，By WuPing
	// --------------- 开始 --------------------------
	@RequestMapping(value = "loadEventTrack.do", method = RequestMethod.GET)
	public String loadEventTrack(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/event_track";
	}

	@RequestMapping(value = "loadEventTrackFinish.do", method = RequestMethod.GET)
	public String loadEventTrackFinish(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/event_track_finish";
	}
	// --------------- 结束 --------------------------
		
	@RequestMapping(value = "searchEventTracks.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchEventTracks(
			HttpServletRequest request, HttpServletResponse response) {
		String eveTraReqName = request.getParameter("eveTraReqName"); // 需求名字
		String eveTraState = request.getParameter("eveTraState"); // 状态
		String eveTraPerInCharge = request.getParameter("eveTraPerInCharge"); // 负责人      		
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号

		return eventTrackServiceClient.getEventTrackLists(
				eveTraReqName, eveTraState,eveTraPerInCharge, pageNum);
	}
	
	//查询已解决事项
	@RequestMapping(value = "searchFinishEventTracks.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchFinishEventTracks(
			HttpServletRequest request, HttpServletResponse response) {
		String eveTraReqName = request.getParameter("eveTraReqName"); // 需求名字
		//String eveTraState = request.getParameter("eveTraState"); // 状态
		String eveTraState = "已解决"; // 状态
		String eveTraPerInCharge = request.getParameter("eveTraPerInCharge"); // 负责人      		
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号

		return eventTrackServiceClient.getFinishEventTrackLists(
				eveTraReqName, eveTraState,eveTraPerInCharge, pageNum);
	}
	
	// 新建冲突程序
	@RequestMapping(value = "createEventTrack.do", produces = "text/html;charset=UTF-8")
	public void createEventTrack(HttpServletRequest request, HttpServletResponse response) {
		String newEveTraReqName = request.getParameter("newEveTraReqName").trim(); 
		String newEveTraContent = request.getParameter("newEveTraContent").trim();
		if(newEveTraContent!=null){
			newEveTraContent = newEveTraContent.trim();
		}
		String newEveTraState = request.getParameter("newEveTraState").trim();
		if(newEveTraState!=null){
			newEveTraState = newEveTraState.trim();
		}
		String newEveTraProgress = request.getParameter("newEveTraProgress").trim();
		if(newEveTraProgress!=null){
			newEveTraProgress = newEveTraProgress.trim();
		}
		String newEveTraPerInCharge = request.getParameter("newEveTraPerInCharge").trim(); 		
		if(newEveTraPerInCharge!=null){
			newEveTraPerInCharge = newEveTraPerInCharge.trim();
		}
		EventTrackDTO eventTrackDTO = new EventTrackDTO();
				
		eventTrackDTO.setEveTraReqName(newEveTraReqName);
		eventTrackDTO.setEveTraContent(newEveTraContent);
		eventTrackDTO.setEveTraState(newEveTraState);
		eventTrackDTO.setEveTraProgress(newEveTraProgress);
		eventTrackDTO.setEveTraPerInCharge(newEveTraPerInCharge);
		eventTrackServiceClient.saveEventTrack(eventTrackDTO);
	}
	
	// 删除冲突程序
	@RequestMapping(value = "deleteEventTrack.do", produces = "text/html;charset=UTF-8")
	public void deleteEventTrack(HttpServletRequest request, HttpServletResponse response) {
		String deleteEveTraID = request.getParameter("deleteEveTraID"); 						
		eventTrackServiceClient.deleteEventTrack(deleteEveTraID);
	}	
	
	//更新冲突程序
	@RequestMapping(value = "updateEventTrack.do", produces = "text/html;charset=UTF-8")
	public void updateEventTrack(HttpServletRequest request, HttpServletResponse response) {
		String eveTraID = request.getParameter("eveTraID");
		String updateEveTraReqName = request.getParameter("updateEveTraReqName"); 
		String updateEveTraContent = request.getParameter("updateEveTraContent");
		String updateEveTraState = request.getParameter("updateEveTraState"); 
		String updateEveTraProgress = request.getParameter("updateEveTraProgress");
		String updateEveTraPerInCharge = request.getParameter("updateEveTraPerInCharge"); 		
		
		EventTrackDTO eventTrackDTO = new EventTrackDTO();			
		eventTrackDTO.setEveTraID(Integer.valueOf(eveTraID));
		eventTrackDTO.setEveTraReqName(updateEveTraReqName);
		eventTrackDTO.setEveTraContent(updateEveTraContent);
		eventTrackDTO.setEveTraState(updateEveTraState);
		eventTrackDTO.setEveTraProgress(updateEveTraProgress);
		eventTrackDTO.setEveTraPerInCharge(updateEveTraPerInCharge);
		eventTrackServiceClient.updateEventTrack(eventTrackDTO);
	}	
}
