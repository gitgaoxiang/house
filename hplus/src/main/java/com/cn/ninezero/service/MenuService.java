/**
 * FileName:RoleService.java
 * Author: Administrator
 * Create: 
 * Last Modified: 
 * Version: V1.0 
 */
package com.cn.ninezero.service;

import java.util.List;

import com.cn.ninezero.pojo.Menu;



/**
 * 角色业务处理接口
 * 
 * @version V1.0
 * @author Administrator
 * @date 
 */
public interface MenuService {

	List<Menu> getMenuListByRoleIds(String userRole);

	String getMenuTree(List<Menu> menuList, boolean b);

	String getMenuListByRoleIdAndMenuIds(String roleId, String removeEnd);

	Long getMenuListCount(Menu menu);


	List<Menu> getMenuList(Menu menu);

	void addMenu(Menu menu);

	Menu getMenu(String menuId);

	void modifyMenu(Menu menu);

	void removeMenu(String id);


	//public void initRolesAndMenus(HttpServletRequest request);

}
