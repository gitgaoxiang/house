package com.cn.ninezero.dao;

import java.util.List;

import com.cn.ninezero.pojo.Menu;

public interface MenuMapper {
    int deleteByPrimaryKey(String menuId);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(String menuId);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

	List<Menu> getMenuListByRoleIds(String userRole);

	List<Menu> getCheckedMenuListByRoleIdAndMenuIds(String roleId,
			String menuIds);

	void removeMenusByRoleId(String roleId);

	Long searchMenuListCount(Menu menu);

	List<Menu> searchMenuList(Menu menu);

	void addMenu(Menu menu);

	List<Menu> getMenuListByAdmin();

	Menu findMenu(String menuId);

	void modifyMenu(Menu menu);

	void removeMenu(String menuId);
}