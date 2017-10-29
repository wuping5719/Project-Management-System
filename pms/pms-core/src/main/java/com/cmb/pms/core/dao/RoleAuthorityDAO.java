package com.cmb.pms.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cmb.pms.core.model.RoleAuthority;

public interface RoleAuthorityDAO {

    int deleteByPrimaryKey(Integer roleAuthID);

    int insert(RoleAuthority record);

    int insertSelective(RoleAuthority record);

    RoleAuthority selectByPrimaryKey(Integer roleAuthID);

    int updateByPrimaryKeySelective(RoleAuthority record);

    int updateByPrimaryKey(RoleAuthority record);
    
    List<RoleAuthority> selectRoleAuthorities(@Param("roleID") int roleID);
    
    int deleteRoleAuthByRoleID(Integer roleID);
    
    List<RoleAuthority> selectRoleAuthsByRoleIDList(List<Integer> roleIDList);
}