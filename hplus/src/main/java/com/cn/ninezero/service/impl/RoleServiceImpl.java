/** 
 * FileName RoleServiceImpl.java
 * 
 * Version 1.0
 *
 * Create by yangwr 2014/6/9
 * 
 * Copyright 2000-2001 Bluemobi. All Rights Reserved.
 */
package com.cn.ninezero.service.impl;

import java.util.List;

import javax.annotation.Resource;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.ninezero.dao.MenuMapper;
import com.cn.ninezero.dao.RoleMapper;
import com.cn.ninezero.pojo.Role;
import com.cn.ninezero.pojo.User;
import com.cn.ninezero.service.RoleService;

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
public class RoleServiceImpl implements RoleService {

	// 日志输出对象
	// private static Logger log = Logger.getLogger(RoleServiceImpl.class);

	/** 角色表操作用DAO */
	@Autowired
	private RoleMapper roleMapper;
	@Resource
	private MenuMapper menuMapper;
	
	public List<Role> getParentRoleListByCurrentUser(User user) {
		return roleMapper.getParentRoleList(user);
	}

	public Long getParentRoleListCountByCurrentUser(User user) {

		return roleMapper.getParentRoleListCount(user);

	}
	public void saveRole(Role role, String menuIds) {
		roleMapper.addRole(role);
		roleMapper.modifyRoleMenuRelation(role.getRoleId(),menuIds);
		
	}
	/**
	 * 取得角色信息
	 * 
	 * @author yangweir
	 * @since Version 1.0
	 * @param roleId
	 *            角色ID
	 * @return RoleModel 角色信息
	 * @throws 无
	 */
	public Role findRole(String roleId) {

		// 角色信息
		Role role;

		// 取得角色信息
		role = roleMapper.findRole(roleId);

		// 设置直属上级角色ID
	//	role.setParentRoleId(getRealParentRole(roleId));

		// 返回角色一览
		return role;
	}
	public void modifyRole(Role role, String menuIds) {
		roleMapper.modifyRole(role);
		roleMapper.modifyRoleMenuRelation(role.getRoleId(),menuIds);
	}
	/**
	 * 删除角色
	 * 
	 * @author yangweir
	 * @since Version 1.0
	 * @param roleId
	 *            角色ID
	 * @return 无
	 * @throws 无
	 */
	public void removeRole(String roleId) {
		// 调用DAO执行角色更新处理
		roleMapper.removeRole(roleId);
		//删除该角色跟用户之间的关系
		
		/*userRole.setRoleId(roleId);
		userRoleMapper.removeUserRole(roleId);*/
		//删除角色菜单之间的关系
		menuMapper.removeMenusByRoleId(roleId);
		
	}
	
}
