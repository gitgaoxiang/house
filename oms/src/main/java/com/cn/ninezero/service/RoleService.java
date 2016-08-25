/**
 * FileName:RoleService.java
 * Author: Administrator
 * Create: 
 * Last Modified: 
 * Version: V1.0 
 */
package com.cn.ninezero.service;

import java.util.List;

import com.cn.ninezero.pojo.Role;
import com.cn.ninezero.pojo.User;



/**
 * 角色业务处理接口
 * 
 * @version V1.0
 * @author Administrator
 * @date 
 */
public interface RoleService {

	

	public List<Role> getParentRoleListByCurrentUser(User user);

	public Long getParentRoleListCountByCurrentUser(User user);

	public void saveRole(Role role, String menuIds);

	public Role findRole(String roleId);

	public void modifyRole(Role role, String menuIds);

	public void removeRole(String roleId);
	
	public List<Role> getAllRoleList();


	


}
