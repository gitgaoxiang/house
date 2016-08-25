package com.cn.ninezero.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.ninezero.dao.UserMapper;
import com.cn.ninezero.pojo.User;
import com.cn.ninezero.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper userDao;

	@Override
	public User getUserById(int userId) {
		// TODO Auto-generated method stub
		return this.userDao.selectByPrimaryKey(userId);
	}

}