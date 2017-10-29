package com.cmb.pms.core.service;

import java.util.List;

import com.cmb.pms.core.model.User;

/**
 * @author WuPing
 */

public interface UserServiceCore {

    public User searchUserById(Integer userID);
    
    public User searchUserByUserWorkID(String userWorkID);
    
    public String insertUser(User user);
    
    public int getTotalNum(String userName, String userWorkID);

    public List<User> getUsers(String userName, String userWorkID, int startIndex, int pageSize);
    
    public String deleteUser(Integer userID);
    
    public String updateUser(User  user);
    
    public List<User> getAllUsers();
}
