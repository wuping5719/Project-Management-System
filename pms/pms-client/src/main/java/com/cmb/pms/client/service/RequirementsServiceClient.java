package com.cmb.pms.client.service;

import java.util.Map;

import com.cmb.pms.client.dto.DevelopingReqDTO;
import com.cmb.pms.client.dto.EstimatingReqDTO;
import com.cmb.pms.client.dto.PreResReqDTO;
import com.cmb.pms.client.dto.IntentionReqDTO;
import com.cmb.pms.client.dto.DeferReqDTO;
import com.cmb.pms.client.dto.ReqDTO;
import com.cmb.pms.client.dto.WaitPerfectReqDTO;

/**
 * @author WuPing
 */

public interface RequirementsServiceClient {

	/************           需求列表                      *****************/
	public String getReqList(Map<String,String> condition, int pageNum);
    
	public String deleteReq(Integer reqID, String reqNum);
	
	public String selectReqByID(Integer reqID);
	
	public String saveReq(ReqDTO reqDTO);
	
	public String updateReq(ReqDTO reqDTO);
	
	public boolean isHasReq(String reqNum);
	
	/************           预研需求                      *****************/
	public String getPreResReqList(String reqNum, String reqName, String reqPerInCharge, int pageNum);
	
	public String savePreResReq(PreResReqDTO preeResReqDTO);
	
	public String deletePreResReq(Integer reqID);
	
	public String selectPreResReqByID(Integer reqID);
	
	public String updatePreResReq(PreResReqDTO preResReqDTO);
	
	/************           意向性需求                      *****************/
	public String getIntentionReqList(String reqNum, String reqName, String reqPerInCharge, int pageNum);
	
	public String saveIntentionReq(IntentionReqDTO intentionReqDTO);
	
	public String deleteIntentionReq(Integer reqID);
	
	public String selectIntentionReqByID(Integer reqID);
	
	public String updateIntentionReq(IntentionReqDTO intentionReqDTO);
	
	/************      待完善需求        *****************/
	public String getWaitPerfectReqList(String reqNum, String reqName, String reqPerInCharge, int pageNum);

	public String deleteWaitPerfectReq(Integer reqID);

	public String selectWaitPerfectReqByID(Integer reqID);

	public String saveWaitPerfectReq(WaitPerfectReqDTO returnedReqDTO);

	public String updateWaitPerfectReq(WaitPerfectReqDTO returnedReqDTO);
	
	/************            评估中需求                      *****************/
	public String getEstimatingReqList(String reqNum, String reqName, String reqPerInCharge, int pageNum);
	
	public String deleteEstimatingReq(Integer reqID);
	
	public String selectEstimatingReqByID(Integer reqID);
	
	public String saveEstimatingReq(EstimatingReqDTO penDevelopReqDTO);
	
	public String updateEstimatingReq(EstimatingReqDTO penDevelopReqDTO);
	
	/************            排期开发需求                      *****************/
	public String getSchedulingDevelopList(String reqNum, String reqName, String reqPerInCharge, int pageNum);
	 
	
	/************            暂缓需求                      *****************/
   public String getDeferReqList(String reqNum, String reqName, String reqPerInCharge, int pageNum);
	
	public String deleteDeferReq(Integer reqID);
	
	public String selectDeferReqByID(Integer reqID);
	
	public String saveDeferReq(DeferReqDTO deferReqDTO);
	
	public String updateDeferReq(DeferReqDTO deferReqDTO);
	
	/************          开发中需求       *****************/
	public String getDevelopingReqList(String reqNum, String reqName, String reqPerInCharge, int pageNum);

	public String deleteDevelopingReq(Integer reqID);

	public String selectDevelopingReqByID(Integer reqID);

	public String updateDevelopingReq(DevelopingReqDTO developingReqDTO);
	
	/************           已上线需求                      *****************/
	public String getOnLinedReqList(String reqNum, String reqName, String reqPerInCharge, int pageNum);
}