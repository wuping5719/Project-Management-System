package com.cmb.pms.core.service;

import java.util.List;

import com.cmb.pms.core.model.RoleAuthority;

/**
 * @author WuPing
 */

public interface RoleAuthorityServiceCore {

    public String insertRoleAuthority(RoleAuthority roleAuthority);
    
    public List<Integer> getAuthorityIDs(Integer roleID);
    
    public String deleteRoleAuthByRoleID(Integer roleID);
    
    public List<Integer> getAuthIDsByRoleIDList(List<Integer> roleIDList);
}

