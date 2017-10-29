package com.cmb.pms.core.service;

import java.util.List;

import com.cmb.pms.core.model.EventTrack;

/**
 * @author ChenQian
 */

public interface EventTrackServiceCore {

	public int getTotalNum(String eveTraReqName,String eveTraState,String eveTraPerInCharge);
	
	public int getFinishTotalNum(String eveTraReqName,String eveTraState,String eveTraPerInCharge);

    public List<EventTrack> getEventTracks(String eveTraReqName,String eveTraState,String eveTraPerInCharge,
	    int startIndex, int pageSize);
    
    public List<EventTrack> getFinishEventTracks(String eveTraReqName,String eveTraState,String eveTraPerInCharge,
    	    int startIndex, int pageSize);
    
    public String insertEventTrack(EventTrack  eventTrack);
   
    public String deleteEventTrack(String eveTraID);
    
    public EventTrack getEventTrackByID(String eveTraID);
    
    public String updateEventTrack(EventTrack eventTrack);

}
