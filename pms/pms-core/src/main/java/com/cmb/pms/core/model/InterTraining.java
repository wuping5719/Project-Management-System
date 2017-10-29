package com.cmb.pms.core.model;

import java.util.Date;

public class InterTraining {
    private Integer traID; // 系统生成，Primary Key

    private String traSegment;  // 节次

    private Date traTime;  // 培训时间

    private String traContent;  // 培训内容

    private String traSpeaker;  // 主讲人
    
    private String traParticipant;  // 参与人

	public Integer getTraID() {
		return traID;
	}

	public void setTraID(Integer traID) {
		this.traID = traID;
	}

	public String getTraSegment() {
		return traSegment;
	}

	public void setTraSegment(String traSegment) {
		this.traSegment = traSegment;
	}

	public Date getTraTime() {
		return traTime;
	}

	public void setTraTime(Date traTime) {
		this.traTime = traTime;
	}

	public String getTraContent() {
		return traContent;
	}

	public void setTraContent(String traContent) {
		this.traContent = traContent;
	}

	public String getTraSpeaker() {
		return traSpeaker;
	}

	public void setTraSpeaker(String traSpeaker) {
		this.traSpeaker = traSpeaker;
	}

	public String getTraParticipant() {
		return traParticipant;
	}

	public void setTraParticipant(String traParticipant) {
		this.traParticipant = traParticipant;
	}

}