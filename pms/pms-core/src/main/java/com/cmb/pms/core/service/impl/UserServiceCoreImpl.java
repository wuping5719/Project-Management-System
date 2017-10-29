package com.cmb.pms.core.service.impl;

import java.util.List;

import com.cmb.pms.core.service.UserServiceCore;
import com.cmb.pms.core.dao.UserDAO;
import com.cmb.pms.core.model.User;

public class UserServiceCoreImpl implements UserServiceCore {

	private UserDAO userDAO;

	@Override
	public User searchUserById(Integer id) {
		User user = userDAO.selectByPrimaryKey(id);
		return user;
	}

	@Override
	public User searchUserByUserWorkID(String userWorkID) {
		return userDAO.selectByUserWorkID(userWorkID);
	}

	@Override
	public String insertUser(User user) {
		try {
			userDAO.insertSelective(user);
			return "success";
		} catch(Exception e){
			e.printStackTrace();
			return "failure";
		}
	}

	@Override
	public int getTotalNum(String userName, String userWorkID) {
		return userDAO.selectTotalNum(userName, userWorkID);
	}
	
	@Override
	public List<User> getUsers(String userName, String userWorkID, int startIndex, int pageSize) {
		return userDAO.selectUsers(userName, userWorkID, startIndex, pageSize);
	}
	
	@Override
	public String deleteUser(Integer userID) {
		try {
			userDAO.deleteByPrimaryKey(userID);
			return "success";
		} catch(Exception e){
			e.printStackTrace();
			return "failure";
		}
	}
	
	@Override
	public String updateUser(User  user) {
		try {
			userDAO.updateByPrimaryKeySelective(user);
			return "success";
		} catch(Exception e){
			e.printStackTrace();
			return "failure";
		}
	}
	
	@Override
	public List<User> getAllUsers() {
		return userDAO.selectAllUsers();
	}
	
	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
}
