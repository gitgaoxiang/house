package com.cn.ninezero.dao;

import java.util.List;

import com.cn.ninezero.pojo.Role;
import com.cn.ninezero.pojo.User;

public interface RoleMapper {
    int deleteByPrimaryKey(String roleId);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(String roleId);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

	List<Role> getParentRoleList(User user);

	Long getParentRoleListCount(User user);

	void addRole(Role role);

	void modifyRoleMenuRelation(String roleId, String menuIds);

	Role findRole(String roleId);

	void modifyRole(Role role);

	void removeRole(String roleId);
}