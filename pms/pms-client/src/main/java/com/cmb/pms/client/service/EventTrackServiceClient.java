package com.cmb.pms.client.service;

import com.cmb.pms.client.dto.EventTrackDTO;

/**
 * @author ChenQian
 */

public interface EventTrackServiceClient {
	
    public String getEventTrackLists(String eveTraReqName, String eveTraState,String eveTraPerInCharge,int pageNum);
    
    public String getFinishEventTrackLists(String eveTraReqName, String eveTraState,String eveTraPerInCharge,int pageNum);
    
	public String saveEventTrack(EventTrackDTO eventTrackDTO);
	
	public String deleteEventTrack(String eveTraID);
	
	public String updateEventTrack(EventTrackDTO eventTrackDTO);		
}
