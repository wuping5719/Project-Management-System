package com.cmb.pms.core.dao;

/*modified by ChenQian*/

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.cmb.pms.core.model.ProgramConflict;

public interface ProgramConflictDAO {

    int deleteByPrimaryKey(Integer conID);
    
    int deleteByProjNumber(String projNumber);

    int insert(ProgramConflict record);

    int insertSelective(ProgramConflict record);

    ProgramConflict selectByPrimaryKey(Integer conID);

    int updateByPrimaryKeySelective(ProgramConflict record);
    
    int updateByProName(ProgramConflict record);
    

    int updateByPrimaryKey(ProgramConflict record);
    
    List<ProgramConflict> selectByProjNumber(String projNumber);
    
    int selectTotalNum(@Param("conProName") String conProName,@Param("conProID") String conProID,@Param("conProjName") String conProjName,
			@Param("conPerInCharge") String conPerInCharge);

	List<ProgramConflict> selectProgramConflict(@Param("conProName") String conProName,@Param("conProID") String conProID,
			@Param("conProjName") String conProjName,@Param("conPerInCharge") String conPerInCharge,
			@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
}