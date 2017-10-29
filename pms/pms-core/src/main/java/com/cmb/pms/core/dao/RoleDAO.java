package com.cmb.pms.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cmb.pms.core.model.Role;

public interface RoleDAO {
    int deleteByPrimaryKey(Integer roleID);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleID);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    int selectTotalNum(@Param("roleName") String roleName, @Param("roleType") String roleType);

	List<Role> selectRoles(@Param("roleName") String roleName, @Param("roleType") String roleType,
			@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
	
	List<Role> selectAllRoles();
}