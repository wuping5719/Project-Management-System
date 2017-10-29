package com.cmb.pms.core.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.cmb.pms.core.service.UserRoleServiceCore;
import com.cmb.pms.core.dao.UserRoleDAO;
import com.cmb.pms.core.model.UserRole;

public class UserRoleServiceCoreImpl implements UserRoleServiceCore {

	private UserRoleDAO userRoleDAO;

	@Override
	public String insertUserRole(UserRole userRole) {
		try {
			userRoleDAO.insertSelective(userRole);
			return "success";
		} catch(Exception e){
			e.printStackTrace();
			return "failure";
		}
	}

	@Override
	public List<Integer> getRoleIDs(Integer userID) {
		List<UserRole>  userRoleList = userRoleDAO.selectUserRoles(userID);
		List<Integer> roleIDList = new ArrayList<>();
		for (UserRole userRole : userRoleList) {
			roleIDList.add(userRole.getRoleID());
		}
		return roleIDList;
	}
	
	@Override
	public String deleteUserRoleByUserID(Integer userID) {
		try {
			userRoleDAO.deleteUserRoleByUserID(userID);
			return "success";
		} catch(Exception e){
			e.printStackTrace();
			return "failure";
		}
	}

	public UserRoleDAO getUserRoleDAO() {
		return userRoleDAO;
	}

	public void setUserRoleDAO(UserRoleDAO userRoleDAO) {
		this.userRoleDAO = userRoleDAO;
	}
}
