/** 
 * FileName RoleServiceImpl.java
 * 
 * Version 1.0
 *
 * Create by gx 2016/7/1
 * 
 * Copyright 2016-2030 ninezero  All Rights Reserved.
 */
package com.cn.ninezero.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.cn.ninezero.dao.MenuMapper;
import com.cn.ninezero.pojo.Menu;
import com.cn.ninezero.security.HttpServletRequestUtil;
import com.cn.ninezero.service.MenuService;


/**
 * FileName RoleServiceImpl.java
 * 
 * Version 1.0
 * 
 * Create by gx 2014/7/1
 * 
 * 角色业务处理类
 */
@Service
public class MenuServiceImpl implements MenuService {
	private String contextPath;
	
	@Resource
	private MenuMapper menuMapper;
	
	public List<Menu> getMenuListByRoleIds(String userRole){
		if("1".equals(userRole)){
			return menuMapper.getMenuListByAdmin();
		}
		
		return menuMapper.getMenuListByRoleIds(userRole);
	}


	public String getMenuTree(List<Menu> menuList,boolean isLookUp) {
		String openType=isLookUp?"collapse":"collapse";
		StringBuilder strHtml=new StringBuilder("<ul class='tree treeFolder "+openType+"'>");
		if(isLookUp){
			strHtml.append("<li><a href='javascript:;' onclick=\"$.bringBack({id:'', name:'根菜单'})\">根菜单</a><ul>");
		}
		for(Menu menu:menuList){
			//递归无父节点的根节点
			if(StringUtils.isBlank(menu.getParentMenuId())){
				strHtml.append("<li>"+getMenuLinkStr(menu,isLookUp));
				writeMenuTree(menu,menuList, strHtml,isLookUp);
				strHtml.append("</li>");
			}
		}
		if(isLookUp){
			strHtml.append("</ul></li>");
		}
		strHtml.append("</ul>");
		return strHtml.toString();
	}

	private void writeMenuTree(Menu menu, List<Menu> menuList,
			StringBuilder strHtml,boolean isLookUp) {
		strHtml.append("<ul>");
		for(Menu child:menuList){
			if(child.getMenuType().equals("1")){//菜单权限构成树
				if(child.getParentMenuId().equals(menu.getMenuId())){
					strHtml.append("<li>"+getMenuLinkStr(child,isLookUp));
					//对无URL的菜单权限，进行递归
					if(child.getHasChild()>0){
						writeMenuTree(child,menuList,strHtml,isLookUp);
					}
					strHtml.append("</li>");	
					
				}
			}
			
		}
		strHtml.append("</ul>");
	}
	
	private String getMenuLinkStr(Menu menu,boolean isLookUp){
		String tempStr="";
		if(isLookUp){
			tempStr="href='javascript:;' onclick=\"$.bringBack({id:'"+menu.getMenuId()+"',"
					+ " name:'"+menu.getContents()+"'})\"";
		}else{
			if(StringUtils.isNotBlank(menu.getUrl())){
			tempStr=" href='"+getContextPath()+menu.getUrl()+"' target='navTab' rel='"+menu.getRel()+"'";
			}
		}
		return "<a "+tempStr+">"+menu.getContents()+"</a>";
	}
	public String getContextPath() {
		if(contextPath==null){
			contextPath=HttpServletRequestUtil.getHttpRequest().getContextPath();
		}
		return contextPath;
	}
	
	public String getMenuListByRoleIdAndMenuIds(String roleId,String menuIds) {
		List<Menu> menuList=menuMapper.getCheckedMenuListByRoleIdAndMenuIds(roleId,menuIds);
		StringBuilder sb=new StringBuilder();
		String iconSkin="";
		String pId="";
		for(Menu menu:menuList){
			iconSkin=menu.getMenuType().equals("2")?"icon02":"icon01";
			if(StringUtils.isBlank(menu.getUrl())){
				iconSkin="";
			}
			pId=(StringUtils.isBlank(menu.getParentMenuId())?"0":menu.getParentMenuId());
			sb.append("{id:'"+menu.getMenuId()+"', pId:'"+pId+"',iconSkin:'"+iconSkin
					+"', name:'"+menu.getContents()+"', checked:"+(menu.getIsSelected()==1?"true":"false")+"},");
		}
		return "["+sb.substring(0,sb.length()-1)+"]";
	}
	public Long getMenuListCount(Menu menu) {
		return menuMapper.searchMenuListCount(menu);
	}
	public List<Menu> getMenuList(Menu menu) {
		return menuMapper.searchMenuList(menu);
	}
	/**
	 * 添加菜单
	 * 
	 * @author gx
	 * @since Version 1.0
	 * @param menu
	 *            菜单信息
	 * @return Menu 菜单信息
	 * @throws 无
	 */
	public void addMenu(Menu menu) {
		// 调用DAO执行菜单添加处理
		menuMapper.addMenu(menu);

		// 菜单权限相关处理
	//	processMenuAuthInfo(menu);
	}
	public Menu getMenu(String menuId) {
		return menuMapper.findMenu(menuId);
	}
	/**
	 * 编辑菜单
	 * 
	 * @author gx
	 * @since Version 1.0
	 * @param menu
	 *            菜单信息
	 * @return 无
	 * @throws 无
	 */
	public void modifyMenu(Menu menu) {

		// 调用DAO执行菜单更新处理
		menuMapper.modifyMenu(menu);

		// 菜单权限相关处理
		//processMenuAuthInfo(menu);
	}

	public void removeMenu(String menuId) {

		// 调用DAO执行菜单更新处理
		menuMapper.removeMenu(menuId);
		//
		//removeAllMenuAuthInfo(menuId);
	}
}
