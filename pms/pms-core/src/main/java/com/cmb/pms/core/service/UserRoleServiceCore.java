package com.cmb.pms.core.service;

import java.util.List;

import com.cmb.pms.core.model.UserRole;

/**
 * @author WuPing
 */

public interface UserRoleServiceCore {

    public String insertUserRole(UserRole userRole);
    
    public List<Integer> getRoleIDs(Integer userID);
    
    public String deleteUserRoleByUserID(Integer userID);
    
}