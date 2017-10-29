package com.cmb.pms.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cmb.pms.core.model.User;

public interface UserDAO {
    int deleteByPrimaryKey(Integer userID);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userID);
    
    User selectByUserWorkID(String userWorkID);

    int updateByPrimaryKeySelective(User record);

    int selectTotalNum(@Param("userName") String userName, @Param("userWorkID") String userWorkID);

	List<User> selectUsers(@Param("userName") String userName, @Param("userWorkID") String userWorkID,
			@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
	
	List<User> selectAllUsers();
}