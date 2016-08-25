package com.cn.ninezero.dao;

import java.util.List;

import com.cn.ninezero.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	int checkUserName(String userName);

	int checkUserPass(User userlogin);

	User getUserByUserName(String userName);

	List<User> getRoleUserList(String roleId);

	long getAdminUserCount(User user);

	List<User> getAdminUserList(User user);

	

	
}