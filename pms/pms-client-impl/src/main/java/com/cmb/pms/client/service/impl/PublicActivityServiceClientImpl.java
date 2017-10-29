package com.cmb.pms.client.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.cmb.pms.client.dto.PublicActivityDTO;
import com.cmb.pms.client.service.PublicActivityServiceClient;
import com.cmb.pms.client.util.PagingParameters;
import com.cmb.pms.core.service.PublicActivityServiceCore;
import com.cmb.pms.core.model.PublicActivity;

public class PublicActivityServiceClientImpl implements PublicActivityServiceClient {

	private PublicActivityServiceCore publicActivityServiceCore;

	@Override
	public String getPublicActivityList(String actContent,
			String actPerInCharge, String actProgress, int pageNum) {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = PagingParameters.PAGE_SIZE;
		int startIndex = 0; // 开始索引

		totalNum = publicActivityServiceCore.getTotalNum(actContent, actPerInCharge, actProgress);

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
		
		List<PublicActivity> publicActivityList = new ArrayList<>();
		publicActivityList = publicActivityServiceCore.getPublicActivities(actContent, actPerInCharge, actProgress, startIndex, pageSize);

		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (PublicActivity publicActivity : publicActivityList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("actContent", publicActivity.getActContent());
			jsonObject.put("actPerInCharge", publicActivity.getActPerInCharge());
			jsonObject.put("actProgress", publicActivity.getActProgress());
			jsonObject.put("actID", publicActivity.getActID());

			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("actDTOsList", jsonArray);
		result.put("actsTotalNum", totalNum);
		result.put("actsTotalPage", totalPage);
		return JSONObject.fromObject(result).toString();
	}

	@Override
	public String savePublicActivity(PublicActivityDTO publicActivityDTO) {
		PublicActivity publicActivity = new PublicActivity();
		publicActivity.setActContent(publicActivityDTO.getActContent());
		publicActivity.setActPerInCharge(publicActivityDTO.getActPerInCharge());
		publicActivity.setActProgress(publicActivityDTO.getActProgress());
		publicActivity.setActCreator("Admin");
		publicActivity.setActModifier("Admin");
		Date now = new Date();
		publicActivity.setActCreTime(now);
		publicActivity.setActModTime(now);
		return  publicActivityServiceCore.insertPublicActivity(publicActivity);
	}
	
	@Override
	public String selectPublicActivityByID(Integer actID) {
		PublicActivity publicActivity = publicActivityServiceCore.getPublicActivityByID(actID);
		Map<String, String> result = new HashMap<String, String>(1);   
		result.put("actContent", publicActivity.getActContent());
		result.put("actPerInCharge", publicActivity.getActPerInCharge());
		result.put("actProgress",  publicActivity.getActProgress());
		return JSONObject.fromObject(result).toString();      // 类似 JSON 的处理方式，采用Map返回结果
	}
	
	@Override
	public String updatePublicActivity(PublicActivityDTO publicActivityDTO) {
		PublicActivity publicActivity = new PublicActivity();
		publicActivity.setActID(publicActivityDTO.getActID());
		
		publicActivity.setActContent(publicActivityDTO.getActContent());
		publicActivity.setActPerInCharge(publicActivityDTO.getActPerInCharge());
		publicActivity.setActProgress(publicActivityDTO.getActProgress());

		publicActivity.setActModifier("Admin");
		Date now = new Date();
		publicActivity.setActModTime(now);
		
		return publicActivityServiceCore.updatePublicActivity(publicActivity);
	}
	
	@Override
	public String deletePublicActivity(Integer actID) {
		return publicActivityServiceCore.deletePublicActivity(actID);
	}
	
	public PublicActivityServiceCore getPublicActivityServiceCore() {
		return publicActivityServiceCore;
	}

	public void setPublicActivityServiceCore(
			PublicActivityServiceCore publicActivityServiceCore) {
		this.publicActivityServiceCore = publicActivityServiceCore;
	}

}
