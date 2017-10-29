package com.cmb.pms.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cmb.pms.client.dto.RoleDTO;
import com.cmb.pms.client.dto.UserDTO;
import com.cmb.pms.client.dto.AuthorityDTO;
import com.cmb.pms.client.service.AuthorityServiceClient;
import com.cmb.pms.client.service.UserServiceClient;
import com.cmb.pms.web.utils.DecriptUtil;

/*
 * @Author WuPing
 */

@Controller
public class AuthorityController {

	@Resource(name = "userServiceClient")
	private UserServiceClient userServiceClient;
	
	@Resource(name = "authorityServiceClient")
	private AuthorityServiceClient authorityServiceClient;

	//------------------   用户相关方法 --------------------------------
	@RequestMapping(value = "loadUsersList.do", method = RequestMethod.GET)
	public String loadUsersList(HttpServletRequest request, HttpServletResponse response) {
		return "pages/auths/users_list";
	}
	
	// 用户注册
	@RequestMapping(value = "userRegister.do", produces = "text/html;charset=UTF-8")
	public void userRegister(HttpServletRequest request, HttpServletResponse response) {
		String userWorkID = request.getParameter("username").trim();  // 用户名(登录名, 默认为工号)
		String password = request.getParameter("password").trim();  // 密码
		String fullname = request.getParameter("fullname").trim();  // 姓名
		String telephone = request.getParameter("telephone").trim();  // 手机
		String email = request.getParameter("email").trim();  // 邮箱

		UserDTO userDTO = new UserDTO();
		userDTO.setUserWorkID(userWorkID);
		userDTO.setUserName(fullname);
		userDTO.setUserPassword(password);
		userDTO.setUserMobile(telephone);
		userDTO.setUserEmail(email);
		
		userDTO.setUserPass(DecriptUtil.MD5(userWorkID).toUpperCase());

        userServiceClient.saveUser(userDTO);
	}

	@RequestMapping(value = "searchUsers.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchUsers(HttpServletRequest request, HttpServletResponse response) {
		String userName = request.getParameter("fullName").trim();      // 注意清除空格，否则影响查询
		String userWorkID = request.getParameter("userWorkID").trim(); 
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号

		String result = userServiceClient.getUserList(userName, userWorkID, pageNum);
	
		return result;
	}
	
	@RequestMapping(value = "deleteUser.do", produces = "text/html;charset=UTF-8")
	public  void deleteUser(HttpServletRequest request, HttpServletResponse response) {
		Integer userID = Integer.parseInt(request.getParameter("userID"));   // 主键

		userServiceClient.deleteUser(userID);
	}
	
	@RequestMapping(value = "getUserByID.do", produces = "text/html;charset=UTF-8")
	public  @ResponseBody  String getUserByID(HttpServletRequest request, HttpServletResponse response) {
		Integer userID = Integer.parseInt(request.getParameter("userID"));   // 主键
		
		return userServiceClient.selectUserByID(userID);
	}
	
	@RequestMapping(value = "updateUser.do", produces = "text/html;charset=UTF-8")
	public void updateUser(HttpServletRequest request, HttpServletResponse response) {
		Integer userID = Integer.parseInt(request.getParameter("userID"));   // 主键
		
		String userWorkID = request.getParameter("strUserWorkID").trim();  // 用户名(登录名, 默认为工号)
		String fullname = request.getParameter("strUserName").trim();  // 姓名
		String mobile = request.getParameter("strUserMobile").trim();  // 手机
		String email = request.getParameter("strUserEmail").trim();  // 邮箱
		String groupName = request.getParameter("strGroupName").trim();  
		String devRoom = request.getParameter("strDevRoom").trim(); 
		
		UserDTO userDTO = new UserDTO();
		userDTO.setUserID(userID);
		
		userDTO.setUserWorkID(userWorkID);
		userDTO.setUserName(fullname);
		userDTO.setUserMobile(mobile);
		userDTO.setUserEmail(email);
		userDTO.setGroupName(groupName);
		userDTO.setDevRoom(devRoom);
		
		userServiceClient.updateUser(userDTO);
	}
	
	//------------------   角色相关方法 --------------------------------
	@RequestMapping(value = "loadRolesList.do", method = RequestMethod.GET)
	public String loadRolesList(HttpServletRequest request, HttpServletResponse response) {
		return "pages/auths/roles_list";
	}
	
	// 查询角色列表信息
	@RequestMapping(value = "searchRoles.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchRoles(HttpServletRequest request, HttpServletResponse response) {
		String roleName = request.getParameter("roleName").trim();      // 注意清除空格，否则影响查询
		String roleType = request.getParameter("roleType").trim(); 
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号

		String result = authorityServiceClient.getRoleList(roleName, roleType, pageNum);
	
		return result;
	}
	
	@RequestMapping(value = "deleteRole.do", produces = "text/html;charset=UTF-8")
	public  void deleteRole(HttpServletRequest request, HttpServletResponse response) {
		Integer roleID = Integer.parseInt(request.getParameter("roleID"));   // 主键

		authorityServiceClient.deleteRole(roleID);
	}
	
	@RequestMapping(value = "getRoleByID.do", produces = "text/html;charset=UTF-8")
	public  @ResponseBody  String getRoleByID(HttpServletRequest request, HttpServletResponse response) {
		Integer roleID = Integer.parseInt(request.getParameter("roleID"));   // 主键
		
		return authorityServiceClient.selectRoleByID(roleID);
	}
	
	@RequestMapping(value = "createRole.do", produces = "text/html;charset=UTF-8")
	public void createRole(HttpServletRequest request, HttpServletResponse response) {
		String newRoleName = request.getParameter("newRoleName").trim();  
		String newRoleType = request.getParameter("newRoleType").trim(); 
		String newRoleDescription = request.getParameter("newRoleDescription").trim();  
		Integer parentRoleID = Integer.parseInt(request.getParameter("parentRoleID"));   

		RoleDTO roleDTO = new RoleDTO();
		roleDTO.setRoleName(newRoleName);
		roleDTO.setRoleDescription(newRoleDescription);
		roleDTO.setRoleType(newRoleType);
		roleDTO.setParentRoleID(parentRoleID);
		
		authorityServiceClient.saveRole(roleDTO);
	}
	
	@RequestMapping(value = "updateRole.do", produces = "text/html;charset=UTF-8")
	public void updateRole(HttpServletRequest request, HttpServletResponse response) {
		Integer roleID = Integer.parseInt(request.getParameter("roleID"));   // 主键
		
		String newRoleName = request.getParameter("newRoleName").trim();  
		String newRoleType = request.getParameter("newRoleType").trim(); 
		String newRoleDescription = request.getParameter("newRoleDescription").trim();  
		Integer parentRoleID = Integer.parseInt(request.getParameter("parentRoleID"));   

		RoleDTO roleDTO = new RoleDTO();
		roleDTO.setRoleID(roleID);
		roleDTO.setRoleName(newRoleName);
		roleDTO.setRoleDescription(newRoleDescription);
		roleDTO.setRoleType(newRoleType);
		roleDTO.setParentRoleID(parentRoleID);
		
		authorityServiceClient.updateRole(roleDTO);
	}
	
	@RequestMapping(value = "initRolesTree.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String initRolesTree(HttpServletRequest request,
			HttpServletResponse response) {
		Integer parentRoleID = Integer.parseInt(request.getParameter("parentRoleID"));  
		Integer roleID = Integer.parseInt(request.getParameter("roleID"));  
		String ztreeNodes = authorityServiceClient.getAllRoles(parentRoleID, roleID);
		return ztreeNodes;
	}
	
	//------------------   权限相关方法 --------------------------------
	@RequestMapping(value = "loadAuthoritiesList.do", method = RequestMethod.GET)
	public String loadAuthoritiesList(HttpServletRequest request, HttpServletResponse response) {
		return "pages/auths/authorities_list";
	}
	
	// 查询权限列表信息
	@RequestMapping(value = "searchAuths.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchAuths(HttpServletRequest request, HttpServletResponse response) {
		String authName = request.getParameter("authName").trim(); // 注意清除空格，否则影响查询
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号

		String result = authorityServiceClient.getAuthList(authName, pageNum);

		return result;
	}
	
	@RequestMapping(value = "deleteAuth.do", produces = "text/html;charset=UTF-8")
	public  void deleteAuth(HttpServletRequest request, HttpServletResponse response) {
		Integer authorityID = Integer.parseInt(request.getParameter("authorityID"));   // 主键

		authorityServiceClient.deleteAuth(authorityID);
	}
	
	@RequestMapping(value = "getAuthByID.do", produces = "text/html;charset=UTF-8")
	public  @ResponseBody  String getAuthByID(HttpServletRequest request, HttpServletResponse response) {
		Integer authorityID = Integer.parseInt(request.getParameter("authorityID"));   // 主键
		
		return authorityServiceClient.selectAuthByID(authorityID);
	}
	
	@RequestMapping(value = "createAuth.do", produces = "text/html;charset=UTF-8")
	public void createAuth(HttpServletRequest request, HttpServletResponse response) {
		String newAuthName = request.getParameter("newAuthName").trim();  
		String newAuthDescription = request.getParameter("newAuthDescription").trim(); 
		String newAuthURL = request.getParameter("newAuthURL").trim(); 
		Integer parentAuthID = Integer.parseInt(request.getParameter("parentAuthID"));   

		AuthorityDTO authorityDTO = new AuthorityDTO();
		authorityDTO.setAuthName(newAuthName);
		authorityDTO.setAuthDescription(newAuthDescription);
		authorityDTO.setAuthURL(newAuthURL);
		authorityDTO.setParentAuthID(parentAuthID);
		
		authorityServiceClient.saveAuth(authorityDTO);
	}
	
	@RequestMapping(value = "updateAuth.do", produces = "text/html;charset=UTF-8")
	public void updateAuth(HttpServletRequest request, HttpServletResponse response) {
		Integer authorityID = Integer.parseInt(request.getParameter("authorityID"));   // 主键
		
		String newAuthName = request.getParameter("newAuthName").trim();  
		String newAuthDescription = request.getParameter("newAuthDescription").trim(); 
		String newAuthURL = request.getParameter("newAuthURL").trim(); 
		Integer parentAuthID = Integer.parseInt(request.getParameter("parentAuthID"));   

		AuthorityDTO authorityDTO = new AuthorityDTO();
		authorityDTO.setAuthorityID(authorityID);
		authorityDTO.setAuthName(newAuthName);
		authorityDTO.setAuthDescription(newAuthDescription);
		authorityDTO.setAuthURL(newAuthURL);
		authorityDTO.setParentAuthID(parentAuthID);
		
		authorityServiceClient.updateAuth(authorityDTO);
	}
	
	@RequestMapping(value = "initAuthsTree.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String initAuthsTree(HttpServletRequest request, HttpServletResponse response) {
		Integer parentAuthID = Integer.parseInt(request.getParameter("parentAuthID"));  
		Integer authorityID = Integer.parseInt(request.getParameter("authorityID"));  
		String ztreeNodes = authorityServiceClient.getAllAuths(parentAuthID, authorityID);
		return ztreeNodes;
	}
	
	// ---------------- 角色权限 -------------
	@RequestMapping(value = "initRoleAuthsTree.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String initRoleAuthsTree(HttpServletRequest request, HttpServletResponse response) {
		Integer roleID = Integer.parseInt(request.getParameter("roleID"));  
		return authorityServiceClient.getRoleAuthsTree(roleID);
	}
	
	@RequestMapping(value = "setRoleAuth.do", produces = "text/html;charset=UTF-8")
	public void setRoleAuth(HttpServletRequest request, HttpServletResponse response) {
		Integer roleID = Integer.parseInt(request.getParameter("roleID"));   
		String authIDStr = request.getParameter("authIDStr").toString();   

		authorityServiceClient.setRoleAuth(roleID, authIDStr);
	}
	
	// ---------------- 用户角色 -------------
	@RequestMapping(value = "initUserRolesTree.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String initUserRolesTree(HttpServletRequest request, HttpServletResponse response) {
		Integer userID = Integer.parseInt(request.getParameter("userID"));  
		return authorityServiceClient.getUserRolesTree(userID);
	}
	
	@RequestMapping(value = "setUserRole.do", produces = "text/html;charset=UTF-8")
	public void setUserRole(HttpServletRequest request, HttpServletResponse response) {
		Integer userID = Integer.parseInt(request.getParameter("userID"));   
		String roleIDStr = request.getParameter("roleIDStr").toString();   

		authorityServiceClient.setUserRole(userID, roleIDStr);
	}
}
