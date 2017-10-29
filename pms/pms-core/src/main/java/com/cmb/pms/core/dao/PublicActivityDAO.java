package com.cmb.pms.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cmb.pms.core.model.PublicActivity;

public interface PublicActivityDAO {

	int deleteByPrimaryKey(Integer actID);

	int insert(PublicActivity record);

	int insertSelective(PublicActivity record);

	PublicActivity selectByPrimaryKey(Integer actID);

	int updateByPrimaryKeySelective(PublicActivity record);

	int updateByPrimaryKey(PublicActivity record);

	int selectTotalNum(@Param("actContent") String actContent,
			@Param("actPerInCharge") String actPerInCharge, @Param("actProgress") String actProgress);

	List<PublicActivity> selectPublicActivities(@Param("actContent") String actContent,
			@Param("actPerInCharge") String actPerInCharge, @Param("actProgress") String actProgress,
			@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
}