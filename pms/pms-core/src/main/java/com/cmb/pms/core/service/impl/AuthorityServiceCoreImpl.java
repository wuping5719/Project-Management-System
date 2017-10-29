package com.cmb.pms.core.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.cmb.pms.core.service.AuthorityServiceCore;
import com.cmb.pms.core.dao.AuthorityDAO;
import com.cmb.pms.core.model.Authority;

public class AuthorityServiceCoreImpl implements AuthorityServiceCore {

	private AuthorityDAO authorityDAO;

	@Override
	public Authority searchAuthorityById(Integer authorityID) {
		return authorityDAO.selectByPrimaryKey(authorityID);
	}

	@Override
	public String insertAuthority(Authority authority) {
		try {
			authorityDAO.insertSelective(authority);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failure";
		}
	}

	@Override
	public int getTotalNum(String authName) {
		return authorityDAO.selectTotalNum(authName);
	}

	@Override
	public List<Authority> getAuthorities(String authName, int startIndex, int pageSize) {
		return authorityDAO.selectAuthorities(authName, startIndex, pageSize);
	}

	@Override
	public String deleteAuthority(Integer authorityID) {
		try {
			authorityDAO.deleteByPrimaryKey(authorityID);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failure";
		}
	}

	@Override
	public String updateAuthority(Authority authority) {
		try {
			authorityDAO.updateByPrimaryKeySelective(authority);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failure";
		}
	}

	@Override
	public List<Authority> getAllAuthorities() {
		return authorityDAO.selectAllAuthorities();
	}

	@Override
	public List<Authority> getAuthoritiesByAuthIDList(List<Integer> authIDList) {
		List<Authority> authList = new ArrayList<>();

		try {
			authList = authorityDAO.selectAuthoritiesByAuthIDList(authIDList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return authList;
	}

	public AuthorityDAO getAuthorityDAO() {
		return authorityDAO;
	}

	public void setAuthorityDAO(AuthorityDAO authorityDAO) {
		this.authorityDAO = authorityDAO;
	}
}