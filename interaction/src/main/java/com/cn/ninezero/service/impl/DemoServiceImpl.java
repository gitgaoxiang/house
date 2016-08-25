/**
 * 
 */
package com.cn.ninezero.service.impl;

import javax.annotation.Resource;

import com.cn.ninezero.dao.UserMapper;
import com.cn.ninezero.pojo.User;
import com.cn.ninezero.service.DemoService;

/**
 * @author wanggengqi
 * @email wanggengqi@chinasofti.com
 * @date 2014年10月23日 下午1:31:47
 */
public class DemoServiceImpl implements DemoService {
	@Resource
	private UserMapper userDao;

	/**
	 * 返回添加后的语句
	 */
	public String hello(String name) {	
		
		User user=this.userDao.selectByPrimaryKey(1);
		
		return "hello---"+user.getUserName();
	}

}
