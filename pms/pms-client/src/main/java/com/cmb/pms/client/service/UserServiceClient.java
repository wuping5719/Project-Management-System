
package com.cmb.pms.client.service;

import com.cmb.pms.client.dto.UserDTO;

/**
 * @author WuPing
 */

public interface UserServiceClient {

    public UserDTO getUserById(Integer userID);
     
    public UserDTO getUserByUserWorkID(String userWorkID);
    
    public String saveUser(UserDTO userDTO);
    
    public String getUserList(String userName, String userWorkID, int pageNum);
    
	public String deleteUser(Integer userID);
	
	public String selectUserByID(Integer userID);
	
	public String updateUser(UserDTO userDTO);
}