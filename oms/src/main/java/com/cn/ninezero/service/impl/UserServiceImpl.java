package com.cn.ninezero.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.ninezero.dao.UserMapper;
import com.cn.ninezero.pojo.User;
import com.cn.ninezero.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper userDao;

	
	public User getUserById(int userId) {
		// TODO Auto-generated method stub
		return this.userDao.selectByPrimaryKey(userId);
	}

	public int checkUserName(String userName) {
		// TODO Auto-generated method stub
		return this.userDao.checkUserName(userName);
	}
	
	public int checkUserPass(User userlogin) {
		// TODO Auto-generated method stub
		return this.userDao.checkUserPass(userlogin);
	}
	public User getUserByUserName(String userName){
		return this.userDao.getUserByUserName(userName);
	}
	/**
	 * 获取角色用户列表
	 */
	public List<User> getRoleUserList(String roleId) {
		// 返回角色用户列表
		return userDao.getRoleUserList(roleId);
	}
	public List<User> getUserList(User user) throws Exception {
		// 用户一览
		List<User> listUser = null;
		try {
			
				listUser = userDao.getAdminUserList(user);
		} catch (Exception e) {
			throw e;
		}
		// 返回用户一览
		return listUser;
	}

	/**
	 * 查询用户个数
	 * 
	 * @author gx
	 * @since Version 1.0
	 * @param UserModel
	 *            用户信息
	 * @return List<UserModel> 用户一览
	 * @throws 无
	 */
	public long getUserCount(User user) throws Exception {
		// 用户个数
		long dataCount = 0;
		try {
				dataCount = userDao.getAdminUserCount(user);
		} catch (Exception e) {
			throw e;
		}
		// 返回用户个数
		return dataCount;

	}

	@Override
	public void saveUser(User user) {
		 userDao.saveUser(user);
		
	}

	@Override
	public void removeUser(String userId) {
		// TODO Auto-generated method stub
		userDao.removeUser(userId);
		
	}

}