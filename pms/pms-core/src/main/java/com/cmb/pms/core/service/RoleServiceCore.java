package com.cmb.pms.core.service;

import java.util.List;

import com.cmb.pms.core.model.Role;

/**
 * @author WuPing
 */

public interface RoleServiceCore {

    public Role searchRoleById(Integer roleID);
    
    public String insertRole(Role role);
    
    public int getTotalNum(String roleName, String roleType);

    public List<Role> getRoles(String roleName, String roleType, int startIndex, int pageSize);
    
    public String deleteRole(Integer roleID);
    
    public String updateRole(Role  role);
    
    public List<Role> getAllRoles();
}