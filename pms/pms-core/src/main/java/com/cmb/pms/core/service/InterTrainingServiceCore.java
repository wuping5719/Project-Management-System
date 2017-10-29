package com.cmb.pms.core.service;

import java.util.List;

import com.cmb.pms.core.model.InterTraining;

/**
 * @author WuPing
 */

public interface InterTrainingServiceCore {

	public int getTotalNum(String traSpeaker, String traTime, String traContent);

    public List<InterTraining> getInterTrainings(String traSpeaker, String traTime, String traContent,
	    int startIndex, int pageSize);
    
    public String insertInterTraining(InterTraining  interTraining);
    
    public String deleteInterTraining(Integer traID);
    
    public InterTraining getInterTrainingByID(Integer traID);
    
    public String updateInterTraining(InterTraining  interTraining);

}
