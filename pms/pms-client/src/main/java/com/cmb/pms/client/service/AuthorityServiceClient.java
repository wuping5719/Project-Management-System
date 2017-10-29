package com.cmb.pms.client.service;

import java.util.Set;

import com.cmb.pms.client.dto.AuthorityDTO;
import com.cmb.pms.client.dto.RoleDTO;

/**
 * @author WuPing
 */

public interface AuthorityServiceClient {

	// ---------------- 角色相关 -------------
    public String saveRole(RoleDTO roleDTO);
    
    public String getRoleList(String roleName, String roleType, int pageNum);
    
	public String deleteRole(Integer roleID);
	
	public String selectRoleByID(Integer roleID);
	
	public String updateRole(RoleDTO roleDTO);
	
	public String getAllRoles(Integer parentRoleID, Integer roleID);
	
	// ---------------- 权限相关 -------------
	public String getAuthList(String authName, int pageNum);
	
	public String saveAuth(AuthorityDTO authorityDTO);
	
    public String deleteAuth(Integer authorityID);
	
    public String selectAuthByID(Integer authorityID);
	
	public String updateAuth(AuthorityDTO authorityDTO);
	
	public String getAllAuths(Integer parentAuthID, Integer authorityID);
	
	public Set<String> getURLResources(Integer userID);
	
	// ---------------- 角色权限 -------------
	public String getRoleAuthsTree(Integer roleID);
	
	public String setRoleAuth(Integer roleID, String authIDStr);
	
	// ---------------- 用户角色 -------------
    public String getUserRolesTree(Integer userID);
	
	public String setUserRole(Integer userID, String roleIDStr);
}
