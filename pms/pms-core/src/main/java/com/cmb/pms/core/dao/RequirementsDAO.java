package com.cmb.pms.core.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cmb.pms.core.model.Requirements;

public interface RequirementsDAO {

    int deleteByPrimaryKey(Integer reqID);

    int insert(Requirements record);

    int insertSelective(Requirements record);

    Requirements selectByPrimaryKey(Integer reqID);

    int updateByPrimaryKeySelective(Requirements record);

    int updateByPrimaryKey(Requirements record);
    
    List<String> selectReqNumber();
    
    int selectTotalNum(@Param("reqNum") String reqNum, 
    		@Param("reqName") String reqName, 
			@Param("reqPerInCharge") String reqPerInCharge, 
			@Param("assessmentDateStart") Date assessmentDateStart,
			@Param("assessmentDateEnd") Date assessmentDateEnd, 
			@Param("reqState") String reqState);

	List<Requirements> selectRequirements(@Param("reqNum") String reqNum, 
			@Param("reqName") String reqName, 
			@Param("reqPerInCharge") String reqPerInCharge, 
			@Param("assessmentDateStart") Date assessmentDateStart,
			@Param("assessmentDateEnd") Date assessmentDateEnd,
			@Param("reqState") String reqState,
			@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
	
	 int countReqByReqNum(@Param("reqNum") String reqNum);
}