package com.cmb.pms.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cmb.pms.core.model.EventTrack;

public interface EventTrackDAO {

    int deleteByPrimaryKey(Integer eveTraID);

    int insert(EventTrack record);

    int insertSelective(EventTrack record);

    EventTrack selectByPrimaryKey(Integer eveTraID);

    int updateByPrimaryKeySelective(EventTrack record);

    int updateByPrimaryKey(EventTrack record);
    
    int selectTotalNum(@Param("eveTraReqName") String eveTraReqName,
    		@Param("eveTraState") String eveTraState,
    		@Param("eveTraPerInCharge") String eveTraPerInCharge);

	List<EventTrack> selectEventTrack(@Param("eveTraReqName") String eveTraReqName,
			@Param("eveTraState") String eveTraState,
			@Param("eveTraPerInCharge") String eveTraPerInCharge,
			@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
	
	int selectFinishTotalNum(@Param("eveTraReqName") String eveTraReqName,
    		@Param("eveTraState") String eveTraState,
    		@Param("eveTraPerInCharge") String eveTraPerInCharge);

	List<EventTrack> selectFinishEventTrack(@Param("eveTraReqName") String eveTraReqName,
			@Param("eveTraState") String eveTraState,
			@Param("eveTraPerInCharge") String eveTraPerInCharge,
			@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
}