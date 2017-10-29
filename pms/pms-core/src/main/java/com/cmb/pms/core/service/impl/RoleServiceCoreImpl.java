package com.cmb.pms.core.service.impl;

import java.util.List;

import com.cmb.pms.core.service.RoleServiceCore;
import com.cmb.pms.core.dao.RoleDAO;
import com.cmb.pms.core.model.Role;

public class RoleServiceCoreImpl implements RoleServiceCore {

	private RoleDAO roleDAO;

	@Override
	public Role searchRoleById(Integer roleID) {
		return roleDAO.selectByPrimaryKey(roleID);
	}

	@Override
	public String insertRole(Role role) {
		try {
			roleDAO.insertSelective(role);
			return "success";
		} catch(Exception e){
			e.printStackTrace();
			return "failure";
		}
	}

	@Override
	public int getTotalNum(String roleName, String roleType) {
		return roleDAO.selectTotalNum(roleName, roleType);
	}
	
	@Override
	public List<Role> getRoles(String roleName, String roleType, int startIndex, int pageSize) {
		return roleDAO.selectRoles(roleName, roleType, startIndex, pageSize);
	}
	
	@Override
	public String deleteRole(Integer roleID) {
		try {
			roleDAO.deleteByPrimaryKey(roleID);
			return "success";
		} catch(Exception e){
			e.printStackTrace();
			return "failure";
		}
	}
	
	@Override
	public String updateRole(Role  role) {
		try {
			roleDAO.updateByPrimaryKeySelective(role);
			return "success";
		} catch(Exception e){
			e.printStackTrace();
			return "failure";
		}
	}
	
	@Override
	public List<Role> getAllRoles() {
		return roleDAO.selectAllRoles();
	}
	
	public RoleDAO getRoleDAO() {
		return roleDAO;
	}

	public void setRoleDAO(RoleDAO roleDAO) {
		this.roleDAO = roleDAO;
	}
}
