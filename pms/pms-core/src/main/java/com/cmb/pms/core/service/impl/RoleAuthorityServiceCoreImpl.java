package com.cmb.pms.core.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.cmb.pms.core.service.RoleAuthorityServiceCore;
import com.cmb.pms.core.dao.RoleAuthorityDAO;
import com.cmb.pms.core.model.RoleAuthority;

public class RoleAuthorityServiceCoreImpl implements RoleAuthorityServiceCore {

	private RoleAuthorityDAO roleAuthorityDAO;

	@Override
	public String insertRoleAuthority(RoleAuthority roleAuthority) {
		try {
			roleAuthorityDAO.insertSelective(roleAuthority);
			return "success";
		} catch(Exception e){
			e.printStackTrace();
			return "failure";
		}
	}

	@Override
	public List<Integer> getAuthorityIDs(Integer roleID) {
		List<RoleAuthority>  roleAuthorityList = roleAuthorityDAO.selectRoleAuthorities(roleID);
		List<Integer> authorityIDList = new ArrayList<>();
		for (RoleAuthority roleAuthority : roleAuthorityList) {
			 authorityIDList.add(roleAuthority.getAuthorityID());
		}
		return authorityIDList;
	}
	
	@Override
	public String deleteRoleAuthByRoleID(Integer roleID) {
		try {
			roleAuthorityDAO.deleteRoleAuthByRoleID(roleID);
			return "success";
		} catch(Exception e){
			e.printStackTrace();
			return "failure";
		}
	}
	
	@Override
	public List<Integer> getAuthIDsByRoleIDList(List<Integer> roleIDList) {
		List<Integer> authIDList = new ArrayList<>();
		
		try {
			List<RoleAuthority>  roleAuthList = roleAuthorityDAO.selectRoleAuthsByRoleIDList(roleIDList);
			
			for (RoleAuthority roleAuthority : roleAuthList) {
				authIDList.add(roleAuthority.getAuthorityID());
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return authIDList;
	}
	
	public RoleAuthorityDAO getRoleAuthorityDAO() {
		return roleAuthorityDAO;
	}

	public void setRoleAuthorityDAO(RoleAuthorityDAO roleAuthorityDAO) {
		this.roleAuthorityDAO = roleAuthorityDAO;
	}
}
