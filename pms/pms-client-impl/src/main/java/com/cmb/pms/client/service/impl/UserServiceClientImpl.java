package com.cmb.pms.client.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.cmb.pms.client.dto.UserDTO;
import com.cmb.pms.client.service.UserServiceClient;
import com.cmb.pms.client.util.PagingParameters;
import com.cmb.pms.core.service.UserServiceCore;
import com.cmb.pms.core.model.User;

public class UserServiceClientImpl implements UserServiceClient {

	private UserServiceCore userServiceCore;

	@Override
	public UserDTO getUserById(Integer userID) {
		UserDTO userDTO = new UserDTO();
		User user = userServiceCore.searchUserById(userID);
		userDTO.setUserID(user.getUserID());
		userDTO.setUserWorkID(user.getUserWorkID());
		userDTO.setUserName(user.getUserName());
		userDTO.setUserPassword(user.getUserPassword());
		userDTO.setUserMobile(user.getUserMobile());
		userDTO.setUserEmail(user.getUserEmail());
		return userDTO;
	}

	@Override
	public UserDTO getUserByUserWorkID(String userWorkID) {
		UserDTO userDTO = new UserDTO();
		User user = userServiceCore.searchUserByUserWorkID(userWorkID);
		userDTO.setUserID(user.getUserID());
		userDTO.setUserWorkID(user.getUserWorkID());
		userDTO.setUserName(user.getUserName());
		userDTO.setUserPassword(user.getUserPassword());
		userDTO.setUserMobile(user.getUserMobile());
		userDTO.setUserEmail(user.getUserEmail());
		return userDTO;
	}
	
	@Override
	public String saveUser(UserDTO userDTO) {
		User user = new User();
		user.setUserName(userDTO.getUserName());
		user.setUserWorkID(userDTO.getUserWorkID());
		user.setUserPassword(userDTO.getUserPassword());
		user.setUserPass(userDTO.getUserPass());
		user.setUserEmail(userDTO.getUserEmail());
		user.setUserMobile(userDTO.getUserMobile());
		
		user.setGroupName("风险");
		user.setDevRoom("对公信贷室");
		
		Date now = new Date();
		user.setUserCreTime(now);
		user.setUserModTime(now);
		user.setUserCreator("Admin");
		user.setUserModifier("Admin");
		
		String result = userServiceCore.insertUser(user);
		return result;
	}
	
	@Override
	public String getUserList(String userName, String userWorkID, int pageNum) {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = PagingParameters.PAGE_SIZE;
		int startIndex = 0; // 开始索引

		totalNum = userServiceCore.getTotalNum(userName, userWorkID);

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
		
		List<User> usersList = new ArrayList<>();
		usersList = userServiceCore.getUsers(userName, userWorkID, startIndex, pageSize);

		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (User user : usersList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("userWorkID", user.getUserWorkID());
			jsonObject.put("userName", user.getUserName());
			jsonObject.put("userMobile", user.getUserMobile());
			jsonObject.put("userEmail", user.getUserEmail());
			jsonObject.put("groupName", user.getGroupName());
			jsonObject.put("devRoom", user.getDevRoom());
			jsonObject.put("userID", user.getUserID());

			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("userDTOsList", jsonArray);
		result.put("usersTotalNum", totalNum);
		result.put("usersTotalPage", totalPage);
		return JSONObject.fromObject(result).toString();
	}
	
	@Override
	public String deleteUser(Integer userID) {
		return userServiceCore.deleteUser(userID);
	}
	
	@Override
	public String selectUserByID(Integer userID) {
		User user = userServiceCore.searchUserById(userID);
		Map<String, String> result = new HashMap<String, String>(1);   
		result.put("userWorkID", user.getUserWorkID());
		result.put("userName", user.getUserName());
		result.put("userMobile", user.getUserMobile());
		result.put("userEmail", user.getUserEmail());
		result.put("groupName", user.getGroupName());
		result.put("devRoom", user.getDevRoom());
		
		return JSONObject.fromObject(result).toString();      // 类似 JSON 的处理方式，采用Map返回结果
	}
	
	@Override
	public String updateUser(UserDTO userDTO) {
		User user = new User();
		user.setUserID(userDTO.getUserID());
		
		user.setUserName(userDTO.getUserName());
		user.setUserWorkID(userDTO.getUserWorkID());
		user.setUserEmail(userDTO.getUserEmail());
		user.setUserMobile(userDTO.getUserMobile());
		
		user.setGroupName(userDTO.getGroupName());
		user.setDevRoom(userDTO.getDevRoom());
		
		Date now = new Date();
		user.setUserModTime(now);
		user.setUserModifier("Admin");
		
		return userServiceCore.updateUser(user);
	}
	
	public UserServiceCore getUserServiceCore() {
		return userServiceCore;
	}

	public void setUserServiceCore(UserServiceCore userServiceCore) {
		this.userServiceCore = userServiceCore;
	}

}
