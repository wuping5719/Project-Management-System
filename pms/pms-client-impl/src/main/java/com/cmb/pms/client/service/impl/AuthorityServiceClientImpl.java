package com.cmb.pms.client.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.cmb.pms.client.dto.RoleDTO;
import com.cmb.pms.client.dto.AuthorityDTO;
import com.cmb.pms.client.service.AuthorityServiceClient;
import com.cmb.pms.client.util.PagingParameters;
import com.cmb.pms.core.service.RoleServiceCore;
import com.cmb.pms.core.service.AuthorityServiceCore;
import com.cmb.pms.core.service.RoleAuthorityServiceCore;
import com.cmb.pms.core.service.UserRoleServiceCore;
import com.cmb.pms.core.model.Role;
import com.cmb.pms.core.model.Authority;
import com.cmb.pms.core.model.RoleAuthority;
import com.cmb.pms.core.model.UserRole;

public class AuthorityServiceClientImpl implements AuthorityServiceClient {

	private RoleServiceCore roleServiceCore;

	private AuthorityServiceCore authorityServiceCore;
	
	private RoleAuthorityServiceCore roleAuthorityServiceCore;
	
	private UserRoleServiceCore userRoleServiceCore;
	
	@Override
	public String saveRole(RoleDTO roleDTO) {
		Role role = new Role();
		role.setRoleName(roleDTO.getRoleName());
		role.setRoleDescription(roleDTO.getRoleDescription());
		
		if ("室经理".equals(roleDTO.getRoleType())) {
			role.setRoleType("PM");
		} else if ("项目组长".equals(roleDTO.getRoleType())) {
			role.setRoleType("PL");
		} else if ("普通开发人员".equals(roleDTO.getRoleType())) {
			role.setRoleType("CD");
		} else {
			role.setRoleType("A");   // 管理员
		}

		role.setParentRoleID(roleDTO.getParentRoleID());
		
		Date now = new Date();
		role.setRoleCreTime(now);
		role.setRoleModTime(now);
		role.setRoleCreator("Admin");
		role.setRoleModifier("Admin");
		
		String result = roleServiceCore.insertRole(role);
		return result;
	}
	
	@Override
	public String getRoleList(String roleName, String roleType, int pageNum) {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = PagingParameters.PAGE_SIZE;
		int startIndex = 0; // 开始索引

		String roleTypePar = null;
		if ("室经理".equals(roleType)) {
			roleTypePar = "PM";
		} else if ("项目组长".equals(roleType)) {
			roleTypePar = "PL";
		} else if ("普通开发人员".equals(roleType)) {
			roleTypePar = "CD";
		} else if ("管理员".equals(roleType)) {
			roleTypePar = "A";  
		}
		
		totalNum = roleServiceCore.getTotalNum(roleName, roleTypePar);

		totalPage = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;

		if (totalNum > 0) {
			if (pageNum <= 1) {
				startIndex = 0;
			} else {
				startIndex = pageNum * pageSize - pageSize;
			}
		} else {
			totalPage = 1;
		}
		
		List<Role> rolesList = new ArrayList<>();
		rolesList = roleServiceCore.getRoles(roleName, roleTypePar, startIndex, pageSize);
		
		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (Role role : rolesList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("roleName", role.getRoleName());
			
			if ("PM".equals(role.getRoleType())) {
				jsonObject.put("roleType", "室经理");
			} else if ("PL".equals(role.getRoleType())) {
				jsonObject.put("roleType", "项目组长");
			} else if ("CD".equals(role.getRoleType())) {
				jsonObject.put("roleType", "普通开发人员");
			} else {
				jsonObject.put("roleType", "管理员");
			}
			
			jsonObject.put("roleDescription", role.getRoleDescription());
			jsonObject.put("roleID", role.getRoleID());

			if(n == 1 ) {
				jsonObject.put("backgroundColor", "#A9A9A9");
			} else {
				if (n % 2 == 0) {
					jsonObject.put("backgroundColor", "#e0ffff");
				} else {
					jsonObject.put("backgroundColor", "#F5F5F5");
				}
			}
			
			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("roleDTOsList", jsonArray);
		result.put("rolesTotalNum", totalNum);
		result.put("rolesTotalPage", totalPage);
		
		return JSONObject.fromObject(result).toString();
	}
	
	@Override
	public String deleteRole(Integer roleID) {
		return roleServiceCore.deleteRole(roleID);
	}
	
	@Override
	public String selectRoleByID(Integer roleID) {
		Role role = roleServiceCore.searchRoleById(roleID);
		Map<String, String> result = new HashMap<String, String>(1);   
		result.put("roleName", role.getRoleName());
		result.put("roleDescription", role.getRoleDescription());
		result.put("roleType", role.getRoleType());
		result.put("parentRoleID", role.getParentRoleID().toString());
		
		return JSONObject.fromObject(result).toString();      // 类似 JSON 的处理方式，采用Map返回结果
	}
	
	@Override
	public String updateRole(RoleDTO roleDTO) {
		Role role = new Role();
		role.setRoleID(roleDTO.getRoleID());
		
		role.setRoleName(roleDTO.getRoleName());
		role.setRoleDescription(roleDTO.getRoleDescription());
		
		if ("室经理".equals(roleDTO.getRoleType())) {
			role.setRoleType("PM");
		} else if ("项目组长".equals(roleDTO.getRoleType())) {
			role.setRoleType("PL");
		} else if ("普通开发人员".equals(roleDTO.getRoleType())) {
			role.setRoleType("CD");
		} else {
			role.setRoleType("A");   // 管理员
		}

		role.setParentRoleID(roleDTO.getParentRoleID());
		
		Date now = new Date();
		role.setRoleModTime(now);
		role.setRoleCreTime(null);
		role.setRoleModifier("Admin");
		role.setRoleCreator(null);
		
		return roleServiceCore.updateRole(role);
	}
	
	@Override
	public String getAllRoles(Integer parentRoleID, Integer roleID) {
		List<Role> roleList = new ArrayList<>();
		roleList = roleServiceCore.getAllRoles();
		JSONArray jsonNodes = new JSONArray();
		for (Role role : roleList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", role.getRoleID());
			jsonObject.put("pId", role.getParentRoleID());
			jsonObject.put("name", role.getRoleName());
			if (role.getRoleID() == parentRoleID) {
				jsonObject.put("checked", true);
			}
			if(roleID != role.getRoleID() || role.getParentRoleID() == 0) {
				jsonNodes.add(jsonObject);
			}
			
		}
		return jsonNodes.toString();
	}
	
	@Override
	public String saveAuth(AuthorityDTO authorityDTO) {
		Authority authority = new Authority();
		authority.setAuthName(authorityDTO.getAuthName());
		authority.setAuthDescription(authorityDTO.getAuthDescription());
		authority.setAuthURL(authorityDTO.getAuthURL());
		authority.setParentAuthID(authorityDTO.getParentAuthID());

		Date now = new Date();
		authority.setAuthCreTime(now);
		authority.setAuthModTime(now);
		authority.setAuthCreator("Admin");
		authority.setAuthModifier("Admin");
		
		String result = authorityServiceCore.insertAuthority(authority);
		return result;
	}
	
	@Override
	public String getAuthList(String authName, int pageNum) {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = PagingParameters.PAGE_SIZE;
		int startIndex = 0; // 开始索引

		totalNum = authorityServiceCore.getTotalNum(authName);

		totalPage = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;

		if (totalNum > 0) {
			if (pageNum <= 1) {
				startIndex = 0;
			} else {
				startIndex = pageNum * pageSize - pageSize;
			}
		} else {
			totalPage = 1;
		}
		
		List<Authority> authList = new ArrayList<>();
		authList = authorityServiceCore.getAuthorities(authName, startIndex, pageSize);
		
		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (Authority authority : authList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("authName", authority.getAuthName());
			jsonObject.put("authDescription", authority.getAuthDescription());
			jsonObject.put("authURL", authority.getAuthURL());
			jsonObject.put("authorityID", authority.getAuthorityID());

			if(n == 1 ) {
				jsonObject.put("backgroundColor", "#A9A9A9");
			} else {
				if (n % 2 == 0) {
					jsonObject.put("backgroundColor", "#e0ffff");
				} else {
					jsonObject.put("backgroundColor", "#F5F5F5");
				}
			}
			
			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("authDTOsList", jsonArray);
		result.put("authsTotalNum", totalNum);
		result.put("authsTotalPage", totalPage);
		
		return JSONObject.fromObject(result).toString();
	}
	
	@Override
	public String deleteAuth(Integer authorityID) {
		return authorityServiceCore.deleteAuthority(authorityID);
	}
	
	@Override
	public String selectAuthByID(Integer authorityID) {
		Authority authority = authorityServiceCore.searchAuthorityById(authorityID);
		Map<String, String> result = new HashMap<String, String>(1);   
		result.put("authName", authority.getAuthName());
		result.put("authDescription", authority.getAuthDescription());
		result.put("authURL", authority.getAuthURL());
		result.put("parentAuthID", authority.getParentAuthID().toString());
		
		return JSONObject.fromObject(result).toString();      // 类似 JSON 的处理方式，采用Map返回结果
	}
	
	@Override
	public String updateAuth(AuthorityDTO authorityDTO) {
		Authority authority = new Authority();
		authority.setAuthorityID(authorityDTO.getAuthorityID());
		
		authority.setAuthName(authorityDTO.getAuthName());
		authority.setAuthDescription(authorityDTO.getAuthDescription());
		authority.setAuthURL(authorityDTO.getAuthURL());
		authority.setParentAuthID(authorityDTO.getParentAuthID());
		
		Date now = new Date();
		authority.setAuthModTime(now);
		authority.setAuthModifier("Admin");
		
		return authorityServiceCore.updateAuthority(authority);
	}
	
	@Override
	public String getAllAuths(Integer parentAuthID, Integer authorityID) {
		List<Authority> authList = new ArrayList<>();
		authList = authorityServiceCore.getAllAuthorities();
		JSONArray jsonNodes = new JSONArray();
		for (Authority authority : authList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", authority.getAuthorityID());
			jsonObject.put("pId", authority.getParentAuthID());
			jsonObject.put("name", authority.getAuthName());
			if (authority.getAuthorityID() == parentAuthID) {
				jsonObject.put("checked", true);
			}

		    jsonNodes.add(jsonObject);
		}
		return jsonNodes.toString();
	}
	
	@Override
	public String getRoleAuthsTree(Integer roleID) {
		List<Authority> authList = new ArrayList<>();
		authList = authorityServiceCore.getAllAuthorities();
		
		List<Integer> authorityIDList = roleAuthorityServiceCore.getAuthorityIDs(roleID);
		
		JSONArray jsonNodes = new JSONArray();
		for (Authority authority : authList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", authority.getAuthorityID());
			jsonObject.put("pId", authority.getParentAuthID());
			jsonObject.put("name", authority.getAuthName());

			if(authorityIDList.contains(authority.getAuthorityID())) {
				jsonObject.put("checked", true);
			}

		    jsonNodes.add(jsonObject);
		}
		return jsonNodes.toString();
	}
	
	@Override
	public String setRoleAuth(Integer roleID, String authIDStr) {
		try {
			roleAuthorityServiceCore.deleteRoleAuthByRoleID(roleID);
		} catch (Exception e) {
			e.printStackTrace();
			return "failure";
		}

		if("".equals(authIDStr)) {
			return "success";
		} else {
			String[] authIDStrArray = authIDStr.split(",");

			Date now = new Date();
			String adminStr = "Admin";

			for (int i = 0; i < authIDStrArray.length; i++) {
				Integer tempAuthID = Integer.parseInt(authIDStrArray[i]);

				RoleAuthority roleAuthority = new RoleAuthority();
				roleAuthority.setRoleID(roleID);
				roleAuthority.setAuthorityID(tempAuthID);
				roleAuthority.setCreateTime(now);
				roleAuthority.setModifyTime(now);
				roleAuthority.setCreator(adminStr);
				roleAuthority.setModifier(adminStr);

				try {
					roleAuthorityServiceCore.insertRoleAuthority(roleAuthority);
				} catch (Exception e) {
					e.printStackTrace();
					return "failure";
				}
			}
		}
		
		return "success";
	}
	
	@Override
	public String getUserRolesTree(Integer userID) {
		List<Role> roleList = new ArrayList<>();
		roleList = roleServiceCore.getAllRoles();
		
		List<Integer> roleIDList = userRoleServiceCore.getRoleIDs(userID);
		
		JSONArray jsonNodes = new JSONArray();
		for (Role role : roleList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", role.getRoleID());
			jsonObject.put("pId", role.getParentRoleID());
			jsonObject.put("name", role.getRoleName());

			if(roleIDList.contains(role.getRoleID())) {
				jsonObject.put("checked", true);
			}

		    jsonNodes.add(jsonObject);
		}
		return jsonNodes.toString();
	}
	
	@Override
	public String setUserRole(Integer userID, String roleIDStr) {
		try {
			userRoleServiceCore.deleteUserRoleByUserID(userID);
		} catch (Exception e) {
			e.printStackTrace();
			return "failure";
		}

		if("".equals(roleIDStr)) {
			return "success";
		} else {
			String[] roleIDStrArray = roleIDStr.split(",");

			Date now = new Date();
			String adminStr = "Admin";

			for (int i = 0; i < roleIDStrArray.length; i++) {
				Integer tempRoleID = Integer.parseInt(roleIDStrArray[i]);

				UserRole userRole = new UserRole();
				userRole.setUserID(userID);
				userRole.setRoleID(tempRoleID);
				userRole.setCreator(adminStr);
				userRole.setModifier(adminStr);
				userRole.setCreateTime(now);
				userRole.setModifyTime(now);
				
				try {
					userRoleServiceCore.insertUserRole(userRole);
				} catch (Exception e) {
					e.printStackTrace();
					return "failure";
				}
			}
		}
		
		return "success";
	}
	
	@Override
	public Set<String> getURLResources(Integer userID) {
		Set<String> urlResSet = new HashSet<>();  
		List<Integer> roleIDList = userRoleServiceCore.getRoleIDs(userID);
		
		List<Integer> authIDList = roleAuthorityServiceCore.getAuthIDsByRoleIDList(roleIDList);

		List<Authority> authList  = authorityServiceCore.getAuthoritiesByAuthIDList(authIDList);
		for (int k=0; k<authList.size(); k++) {
			if (!urlResSet.contains(authList.get(k).getAuthURL())) {
				urlResSet.add(authList.get(k).getAuthURL());
			}
		}
		
		return urlResSet;
	}
	
	public RoleServiceCore getRoleServiceCore() {
		return roleServiceCore;
	}

	public void setRoleServiceCore(RoleServiceCore roleServiceCore) {
		this.roleServiceCore = roleServiceCore;
	}

	public AuthorityServiceCore getAuthorityServiceCore() {
		return authorityServiceCore;
	}

	public void setAuthorityServiceCore(AuthorityServiceCore authorityServiceCore) {
		this.authorityServiceCore = authorityServiceCore;
	}

	public RoleAuthorityServiceCore getRoleAuthorityServiceCore() {
		return roleAuthorityServiceCore;
	}

	public void setRoleAuthorityServiceCore(RoleAuthorityServiceCore roleAuthorityServiceCore) {
		this.roleAuthorityServiceCore = roleAuthorityServiceCore;
	}
	
	public UserRoleServiceCore getUserRoleServiceCore() {
		return userRoleServiceCore;
	}

	public void setUserRoleServiceCore(UserRoleServiceCore userRoleServiceCore) {
		this.userRoleServiceCore = userRoleServiceCore;
	}
}
