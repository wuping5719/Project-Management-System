package com.cmb.pms.client.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.cmb.pms.client.dto.EventTrackDTO;
import com.cmb.pms.client.service.EventTrackServiceClient;
import com.cmb.pms.core.service.EventTrackServiceCore;
import com.cmb.pms.core.model.EventTrack;

public class EventTrackServiceClientImpl implements EventTrackServiceClient {

	private EventTrackServiceCore eventTrackServiceCore;
	
	@Override
	public String getEventTrackLists(String eveTraReqName, String eveTraState,String eveTraPerInCharge,int pageNum) {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = 16;
		int startIndex = 0; // 开始索引

		totalNum = eventTrackServiceCore.getTotalNum(eveTraReqName, eveTraState,eveTraPerInCharge);

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
		
		List<EventTrack> eventTrackListTemp = eventTrackServiceCore.getEventTracks(eveTraReqName, eveTraState,eveTraPerInCharge, startIndex, pageSize);
		
		//将数据按照状态重新排序
		List<EventTrack> eventTrackList = new ArrayList<>();				
		for(int i=0;i<eventTrackListTemp.size();i++){
			eventTrackList.add(eventTrackListTemp.get(i));
			for(int j=i+1;j<eventTrackListTemp.size()&&(j>i);j++){
				if(eventTrackListTemp.get(j).getEveTraState().equals(eventTrackListTemp.get(i).getEveTraState())){
					
					eventTrackList.add(eventTrackListTemp.get(j));
					eventTrackListTemp.remove(j);
					j--;
				}
			}
		}
								
		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (EventTrack eventTrack : eventTrackList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("eveTraReqName", eventTrack.getEveTraReqName());
			
			if(eventTrack.getEveTraContent()!=null){
				jsonObject.put("eveTraContent", eventTrack.getEveTraContent().replace("<", "&lt;").replace(">", "&gt;"));
			}else{jsonObject.put("eveTraContent", "");
			}
			if(eventTrack.getEveTraState()!=null){
				jsonObject.put("eveTraState", eventTrack.getEveTraState());
			}else{jsonObject.put("eveTraState", "");
			}			
			if(eventTrack.getEveTraProgress()!=null){
				jsonObject.put("eveTraProgress", eventTrack.getEveTraProgress().replace("<", "&lt;").replace(">", "&gt;"));
			}else{jsonObject.put("eveTraProgress", "");
			}
			if(eventTrack.getEveTraPerInCharge()!=null){
				jsonObject.put("eveTraPerInCharge", eventTrack.getEveTraPerInCharge());
			}else{jsonObject.put("eveTraPerInCharge", "");
			}
			jsonObject.put("eveTraID", eventTrack.getEveTraID());

			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("eveTraDTOsList", jsonArray);
		result.put("eveTraTotalNum", totalNum);
		result.put("eveTraTotalPage", totalPage);
		return JSONObject.fromObject(result).toString();
	}
	
	@Override
	public String getFinishEventTrackLists(String eveTraReqName, String eveTraState,String eveTraPerInCharge,int pageNum) {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = 12;
		int startIndex = 0; // 开始索引

		totalNum = eventTrackServiceCore.getFinishTotalNum(eveTraReqName, eveTraState,eveTraPerInCharge);

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
		
		List<EventTrack> eventTrackListTemp = eventTrackServiceCore.getFinishEventTracks(eveTraReqName, eveTraState,eveTraPerInCharge, startIndex, pageSize);
		
		//将数据按照状态重新排序
		List<EventTrack> eventTrackList = new ArrayList<>();				
		for(int i=0;i<eventTrackListTemp.size();i++){
			eventTrackList.add(eventTrackListTemp.get(i));
			for(int j=i+1;j<eventTrackListTemp.size()&&(j>i);j++){
				if(eventTrackListTemp.get(j).getEveTraState().equals(eventTrackListTemp.get(i).getEveTraState())){
					
					eventTrackList.add(eventTrackListTemp.get(j));
					eventTrackListTemp.remove(j);
					j--;
				}
			}
		}
								
		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (EventTrack eventTrack : eventTrackList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("eveTraReqName", eventTrack.getEveTraReqName());
			
			if(eventTrack.getEveTraContent()!=null){
				jsonObject.put("eveTraContent", eventTrack.getEveTraContent().replace("<", "&lt;").replace(">", "&gt;"));
			}else{jsonObject.put("eveTraContent", "");
			}
			if(eventTrack.getEveTraState()!=null){
				jsonObject.put("eveTraState", eventTrack.getEveTraState());
			}else{jsonObject.put("eveTraState", "");
			}			
			if(eventTrack.getEveTraProgress()!=null){
				jsonObject.put("eveTraProgress", eventTrack.getEveTraProgress().replace("<", "&lt;").replace(">", "&gt;"));
			}else{jsonObject.put("eveTraProgress", "");
			}
			if(eventTrack.getEveTraPerInCharge()!=null){
				jsonObject.put("eveTraPerInCharge", eventTrack.getEveTraPerInCharge());
			}else{jsonObject.put("eveTraPerInCharge", "");
			}
			jsonObject.put("eveTraID", eventTrack.getEveTraID());

			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("eveTraDTOsList", jsonArray);
		result.put("eveTraTotalNum", totalNum);
		result.put("eveTraTotalPage", totalPage);
		return JSONObject.fromObject(result).toString();
	}

	@Override
	public String saveEventTrack(EventTrackDTO eventTrackDTO) {
		EventTrack eventTrack = new EventTrack();
		
		eventTrack.setEveTraReqName(eventTrackDTO.getEveTraReqName());
		eventTrack.setEveTraContent(eventTrackDTO.getEveTraContent());
		eventTrack.setEveTraState(eventTrackDTO.getEveTraState());
		eventTrack.setEveTraProgress(eventTrackDTO.getEveTraProgress());
		eventTrack.setEveTraPerInCharge(eventTrackDTO.getEveTraPerInCharge());

		eventTrack.setEveTraCreator("Admin");
		eventTrack.setEveTraModifier("Admin");
		Date now = new Date();
		eventTrack.setEveTraCreTime(now);
		eventTrack.setEveTraModTime(now);
		return  eventTrackServiceCore.insertEventTrack(eventTrack);
	}
	
	@Override
	public String deleteEventTrack(String eveTraID){
		return eventTrackServiceCore.deleteEventTrack(eveTraID);
	}
	
	@Override
	public String updateEventTrack(EventTrackDTO eventTrackDTO){		
		EventTrack eventTrack = eventTrackServiceCore.getEventTrackByID(eventTrackDTO.getEveTraID().toString());
        
        eventTrack.setEveTraID(eventTrackDTO.getEveTraID());
		eventTrack.setEveTraReqName(eventTrackDTO.getEveTraReqName());		
		eventTrack.setEveTraContent(eventTrackDTO.getEveTraContent());
		eventTrack.setEveTraProgress(eventTrackDTO.getEveTraProgress());
		eventTrack.setEveTraPerInCharge(eventTrackDTO.getEveTraPerInCharge());					
		eventTrack.setEveTraModifier("Admin");
		Date now = new Date();		
		eventTrack.setEveTraModTime(now);
		return eventTrackServiceCore.updateEventTrack(eventTrack);
		
	}

	public EventTrackServiceCore getEventTrackServiceCore() {
		return eventTrackServiceCore;
	}

	public void setEventTrackServiceCore(EventTrackServiceCore eventTrackServiceCore) {
		this.eventTrackServiceCore = eventTrackServiceCore;
	}	    
}
