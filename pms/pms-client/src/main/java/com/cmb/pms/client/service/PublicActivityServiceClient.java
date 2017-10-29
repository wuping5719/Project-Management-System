package com.cmb.pms.client.service;

import com.cmb.pms.client.dto.PublicActivityDTO;

/**
 * @author WuPing
 */

public interface PublicActivityServiceClient {

	public String getPublicActivityList(String actContent, String actPerInCharge, String actProgress, int pageNum);
	
	public String savePublicActivity(PublicActivityDTO publicActivityDTO);
	
    public String deletePublicActivity(Integer actID);
	
	public String selectPublicActivityByID(Integer actID);
	
	public String updatePublicActivity(PublicActivityDTO publicActivityDTO);
}