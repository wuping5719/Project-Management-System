package com.cmb.pms.core.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cmb.pms.core.model.InterTraining;

public interface InterTrainingDAO {

    int deleteByPrimaryKey(Integer traID);

    int insert(InterTraining record);

    int insertSelective(InterTraining record);

    InterTraining selectByPrimaryKey(Integer traID);

    int updateByPrimaryKeySelective(InterTraining record);

    int updateByPrimaryKey(InterTraining record);
    
    int selectTotalNum(@Param("traSpeaker") String traSpeaker,
			@Param("traTime") Date traTime, @Param("traContent") String traContent);

	List<InterTraining> selectInterTrainings(@Param("traSpeaker") String traSpeaker,
			@Param("traTime") Date traTime, @Param("traContent") String traContent,
			@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
}