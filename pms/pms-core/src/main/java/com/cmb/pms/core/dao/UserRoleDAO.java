package com.cmb.pms.core.dao;

import java.util.List;

import com.cmb.pms.core.model.UserRole;

public interface UserRoleDAO {
	
    int deleteByPrimaryKey(Integer userToRoleID);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(Integer userToRoleID);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
    
    List<UserRole> selectUserRoles(Integer userID);
    
    int deleteUserRoleByUserID(Integer userID);
}