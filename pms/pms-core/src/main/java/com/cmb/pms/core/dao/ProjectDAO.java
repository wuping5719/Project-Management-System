package com.cmb.pms.core.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cmb.pms.core.model.Project;

public interface ProjectDAO {
    int deleteByPrimaryKey(Integer proID);

    int insert(Project record);

    int insertSelective(Project record);

    Project selectByPrimaryKey(Integer proID);

    int updateByPrimaryKeySelective(Project record);

    int updateByPrimaryKey(Project record);
    
    Project selectByProjNumber(String projNumber);
    
    List<String> selectProjNumber();
    
    int selectTotalNum(@Param("projNumber") String projNumber,@Param("projReqNum") String projReqNum,@Param("projName") String projName,
			@Param("projPerInCharge") String projPerInCharge,@Param("projState") String projState);

	List<Project> selectProject(@Param("projNumber") String projNumber,@Param("projReqNum") String projReqNum,
			@Param("projName") String projName,@Param("projPerInCharge") String projPerInCharge,@Param("projState") String projState,
			@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
	
	int selectFinishTotalNum(@Param("projNumber") String projNumber,@Param("projReqNum") String projReqNum,@Param("projName") String projName,
			@Param("projPerInCharge") String projPerInCharge,@Param("projOnlineStart") Date projOnlineStart,@Param("projOnlineEnd") Date projOnlineEnd);

	List<Project> selectFinishProject(@Param("projNumber") String projNumber,@Param("projReqNum") String projReqNum,
			@Param("projName") String projName,@Param("projPerInCharge") String projPerInCharge,
			@Param("projOnlineStart") Date projOnlineStart,@Param("projOnlineEnd") Date projOnlineEnd,
			@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
	
	int selectByReqNum(@Param("projReqNum") String projReqNum);
}