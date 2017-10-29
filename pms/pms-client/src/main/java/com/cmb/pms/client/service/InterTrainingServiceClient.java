package com.cmb.pms.client.service;

import com.cmb.pms.client.dto.InterTrainingDTO;

/**
 * @author WuPing
 */

public interface InterTrainingServiceClient {

	public String getInterTrainingList(String traSpeaker, String traTime, String traContent, int pageNum);
	
	public String saveInterTraining(InterTrainingDTO interTrainingDTO);
	
    public String deleteInterTraining(Integer traID);
	
	public String selectInterTrainingByID(Integer traID);
	
	public String updateInterTraining(InterTrainingDTO interTrainingDTO);
}