package com.cmb.pms.client.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.cmb.pms.client.dto.InterTrainingDTO;
import com.cmb.pms.client.service.InterTrainingServiceClient;
import com.cmb.pms.client.util.PagingParameters;
import com.cmb.pms.core.service.InterTrainingServiceCore;
import com.cmb.pms.core.model.InterTraining;

public class InterTrainingServiceClientImpl implements InterTrainingServiceClient {

	private InterTrainingServiceCore interTrainingServiceCore;

	@SuppressWarnings("deprecation")
	@Override
	public String getInterTrainingList(String traSpeaker, String traTime, String traContent, int pageNum)  {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = PagingParameters.PAGE_SIZE;
		int startIndex = 0; // 开始索引

		totalNum = interTrainingServiceCore.getTotalNum(traSpeaker, traTime, traContent);

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
		
		List<InterTraining> interTrainingList = new ArrayList<>();
		interTrainingList = interTrainingServiceCore.getInterTrainings(traSpeaker, traTime, traContent, startIndex, pageSize);

		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (InterTraining interTraining : interTrainingList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("traSegment", interTraining.getTraSegment());
			jsonObject.put("traTime", interTraining.getTraTime().toLocaleString());
			jsonObject.put("traContent", interTraining.getTraContent());
			jsonObject.put("traSpeaker", interTraining.getTraSpeaker());
			jsonObject.put("traParticipant", interTraining.getTraParticipant());
			jsonObject.put("traID", interTraining.getTraID());
			
			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("traDTOsList", jsonArray);
		result.put("trasTotalNum", totalNum);
		result.put("trasTotalPage", totalPage);
		return JSONObject.fromObject(result).toString();
	}

	@Override
	public String saveInterTraining(InterTrainingDTO interTrainingDTO) {
		InterTraining interTraining = new InterTraining();
		interTraining.setTraSegment(interTrainingDTO.getTraSegment());
		interTraining.setTraContent(interTrainingDTO.getTraContent());
		interTraining.setTraTime(interTrainingDTO.getTraTime());
		interTraining.setTraSpeaker(interTrainingDTO.getTraSpeaker());
		interTraining.setTraParticipant(interTrainingDTO.getTraParticipant());
		return interTrainingServiceCore.insertInterTraining(interTraining);
	}
	
	@SuppressWarnings("deprecation")
	@Override
	public String selectInterTrainingByID(Integer traID) {
		InterTraining interTraining =  interTrainingServiceCore.getInterTrainingByID(traID);
		Map<String, String> result = new HashMap<String, String>(1);   
		result.put("traSegment", interTraining.getTraSegment());
		result.put("traTime", interTraining.getTraTime().toLocaleString());
		result.put("traContent",  interTraining.getTraContent());
		result.put("traSpeaker",  interTraining.getTraSpeaker());
		result.put("traParticipant",  interTraining.getTraParticipant());
		return JSONObject.fromObject(result).toString();      // 类似 JSON 的处理方式，采用Map返回结果
	}
	
	@Override
	public String updateInterTraining(InterTrainingDTO interTrainingDTO) {
		InterTraining interTraining = new InterTraining();
		interTraining.setTraID(interTrainingDTO.getTraID());
		
		interTraining.setTraSegment(interTrainingDTO.getTraSegment());
		interTraining.setTraContent(interTrainingDTO.getTraContent());
		interTraining.setTraTime(interTrainingDTO.getTraTime());
		interTraining.setTraSpeaker(interTrainingDTO.getTraSpeaker());
		interTraining.setTraParticipant(interTrainingDTO.getTraParticipant());
		
		return interTrainingServiceCore.updateInterTraining(interTraining);
	}
	
	@Override
	public String deleteInterTraining(Integer traID) {
		return interTrainingServiceCore.deleteInterTraining(traID);
	}
	
	public InterTrainingServiceCore getInterTrainingServiceCore() {
		return interTrainingServiceCore;
	}

	public void setInterTrainingServiceCore(
			InterTrainingServiceCore interTrainingServiceCore) {
		this.interTrainingServiceCore = interTrainingServiceCore;
	}

}
