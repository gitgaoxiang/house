 package com.cn.ninezero.service;  
  
import java.util.List;

import com.cn.ninezero.pojo.User;
  
public interface UserService {  
    public User getUserById(int userId);  
    
    public int checkUserName(String userName);
    
    public int checkUserPass(User userlogin);

	public User getUserByUserName(String userName);

	public List<User> getRoleUserList(String roleId);

	public long getUserCount(User user) throws Exception;

	public List<com.cn.ninezero.pojo.User> getUserList(User user) throws Exception;
	
	public void deleteByPrimaryKey(int userId);
}