/** 
 * FileName RoleServiceImpl.java
 * 
 * Version 1.0
 *
 * Create by gx 2016/7/1
 * 
 * Copyright 2000-2001 ninezero. All Rights Reserved.
 */
package com.cn.ninezero.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.ninezero.dao.CommonMapper;
import com.cn.ninezero.service.CommonService;

/**
 * FileName RoleServiceImpl.java
 * 
 * Version 1.0
 * 
 * Create by gx 
 * 
 * 角色业务处理类
 */
@Service
public class CommonServiceImpl implements CommonService {
	@Autowired
	private CommonMapper commonMapper;
	
	public int checkCommonUnique(Map<String, String> map) {
		return commonMapper.checkCommonUnique(map);
	}
}
