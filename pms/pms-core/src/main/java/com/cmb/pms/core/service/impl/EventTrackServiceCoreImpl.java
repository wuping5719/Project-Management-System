package com.cmb.pms.core.service.impl;

import java.util.List;

import com.cmb.pms.core.service.EventTrackServiceCore;
import com.cmb.pms.core.dao.EventTrackDAO;
import com.cmb.pms.core.model.EventTrack;

public class EventTrackServiceCoreImpl implements EventTrackServiceCore {

	private EventTrackDAO eventTrackDAO;
	
	@Override
	public int getTotalNum(String eveTraReqName,String eveTraState,String eveTraPerInCharge) {
		return eventTrackDAO.selectTotalNum(eveTraReqName, eveTraState,eveTraPerInCharge);
	}
	
	@Override
	public int getFinishTotalNum(String eveTraReqName,String eveTraState,String eveTraPerInCharge) {
		return eventTrackDAO.selectFinishTotalNum(eveTraReqName, eveTraState,eveTraPerInCharge);
	}

	@Override
    public List<EventTrack> getEventTracks(String eveTraReqName,String eveTraState,String eveTraPerInCharge,
    	    int startIndex, int pageSize) {
    	return eventTrackDAO.selectEventTrack(eveTraReqName, eveTraState,eveTraPerInCharge, startIndex, pageSize);
    }
	
	@Override
    public List<EventTrack> getFinishEventTracks(String eveTraReqName,String eveTraState,String eveTraPerInCharge,
    	    int startIndex, int pageSize) {
    	return eventTrackDAO.selectFinishEventTrack(eveTraReqName, eveTraState,eveTraPerInCharge, startIndex, pageSize);
    }

	@Override
    public String insertEventTrack(EventTrack  eventTrack) {
		eventTrackDAO.insertSelective(eventTrack);
    	return "success";
    }
	
	@Override
	public String deleteEventTrack(String eveTraID){
		eventTrackDAO.deleteByPrimaryKey(Integer.valueOf(eveTraID));
    	return "success";
	}
	
	@Override
	public EventTrack getEventTrackByID(String eveTraID){		
		return eventTrackDAO.selectByPrimaryKey(Integer.valueOf(eveTraID));
	}
	
	@Override
	public String updateEventTrack(EventTrack eventTrack){
		eventTrackDAO.updateByPrimaryKeySelective(eventTrack);
		return "success";
	}

	public EventTrackDAO getEventTrackDAO() {
		return eventTrackDAO;
	}

	public void setEventTrackDAO(EventTrackDAO eventTrackDAO) {
		this.eventTrackDAO = eventTrackDAO;
	}		
}
