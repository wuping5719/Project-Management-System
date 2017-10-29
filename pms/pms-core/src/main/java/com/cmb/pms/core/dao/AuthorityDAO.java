package com.cmb.pms.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cmb.pms.core.model.Authority;

public interface AuthorityDAO {
    int deleteByPrimaryKey(Integer authorityID);

    int insert(Authority record);

    int insertSelective(Authority record);

    Authority selectByPrimaryKey(Integer authorityID);

    int updateByPrimaryKeySelective(Authority record);

    int updateByPrimaryKey(Authority record);
    
    int selectTotalNum(@Param("authName") String authName);

	List<Authority> selectAuthorities(@Param("authName") String authName, 
			@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
	
	List<Authority> selectAllAuthorities();
	
	List<Authority> selectAuthoritiesByAuthIDList(List<Integer> authIDList);
}