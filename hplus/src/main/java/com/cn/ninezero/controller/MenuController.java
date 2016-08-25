 package com.cn.ninezero.controller;  
  

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;
  
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;  
import org.springframework.ui.Model;  
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cn.bluemobi.product.common.DwzPagerMySQL;
import com.cn.bluemobi.product.utils.JsonObject;
import com.cn.bluemobi.product.utils.UUIDUtil;
import com.cn.ninezero.pojo.DwzAjaxResult;
import com.cn.ninezero.pojo.Menu;
import com.cn.ninezero.service.MenuService;


@Controller("menu")  
@RequestMapping("admin/menu")  
public class MenuController {  
	   @Resource
		private MenuService menuService;
	    
	/**
	 * 菜单列表
	 */
	@RequestMapping(value = "/findMenuList")
	public String findMenuList(Menu menu,
			@ModelAttribute("pager") DwzPagerMySQL pager, Model model,
			HttpServletRequest request) {
		
		String parentMenuId = request.getParameter("org.id");
		String parentMenuName = request.getParameter("org.name");
		if (StringUtils.isNotBlank(parentMenuId)) {
			menu.setParentMenuId(parentMenuId);
			menu.setParentMenuName(parentMenuName);
		}
		List<Menu> menuList = null;
		Long total = menuService.getMenuListCount(menu);
		if (total <= pager.getOffset()) {
			pager.setPageNum(1L);
		}
		// 设置分页对象
		menu.setPager(pager);
		menuList = menuService.getMenuList(menu);
		pager.setTotal(total);
		model.addAttribute("menuList", menuList);
		if(menu.getParentMenuId()==""||"".equals(menu.getParentMenuId())||menu.getParentMenuId()==null)
		{
			menu.setParentMenuName("根菜单");
		}
		model.addAttribute("menu", menu);
		model.addAttribute("pager", pager);
		return "menu/listMenu";
	}

	@RequestMapping(value = "/getMenuTreeLookup")
	public String getMenuTreeLookup(ModelMap map, HttpServletRequest request) {
		List<Menu> menuList = menuService.getMenuListByRoleIds("1");
		String strHtml = menuService.getMenuTree(menuList, true);
		map.put("strHtml", strHtml);
		// 跳转至菜单添加页面
		return "menu/menuTreeLookup";
	}
	/**
	 * 菜单添加初始化处理
	 * 
	 */
	@RequestMapping("/newMenu")
	public String newMenu(Model model, HttpServletRequest request) {
		
			Menu menu = new Menu();
			menu.setMenuId(UUIDUtil.uuid());
			model.addAttribute("menu", menu);
			return "menu/addMenu";
		
	}
	/**
	 * 菜单添加处理
	 */
	@RequestMapping("/saveMenu")
	@ResponseBody
	public String saveMenu(Menu menu, BindingResult result,
			HttpServletRequest request, Model model) {
		DwzAjaxResult dwzResult;
		
			if (result.hasErrors()) {
				dwzResult = new DwzAjaxResult("300", "参数错误", "menuAddPage", "",
						"");
				return new JsonObject(dwzResult).toString();
			}
			//ProcessInfoCommon.setCreateUserInfo(menu);
			try {
				String parentMenuId = request.getParameter("org.id");
				menu.setParentMenuId(parentMenuId);
				menuService.addMenu(menu);
				
				
				dwzResult = new DwzAjaxResult("200", "保存成功", "menu",
						"closeCurrent", "");
			
			/*	//initMenuList
				User user = SecurityUtils.getLoginUser(request);
				List<Menu> menuList = menuService.getMenuListByRoleIds(user
						.getUserRole());
				String strHtml = menuService.getMenuTree(menuList, false);
				model.addAttribute("menuTreeModel", strHtml);*/
				
				
				// 刷新会话中角色和菜单的缓存
			//	roleService.initRolesAndMenus(request);
			} catch (Exception e) {
				dwzResult = new DwzAjaxResult("300", "保存失败:系统错误", "menu", "",
						"");
				//log.error(e.getLocalizedMessage());
			}
		
		return new JsonObject(dwzResult).toString();
	}
	/**
	 * 菜单编辑初始化处理
	 */
	@RequestMapping(value = "/editMenu", method = RequestMethod.GET)
	public String editMenu(@RequestParam("menuId") String menuId, Model model,
			HttpServletRequest request) {
			Menu menu = menuService.getMenu(menuId);
			if (StringUtils.isBlank(menu.getParentMenuId())) {
				menu.setParentMenuId("");
				menu.setParentMenuName("根菜单");
			}
			model.addAttribute("menu", menu);
			// 跳转至菜单编辑页面
			return "menu/editMenu";

	}
	/**
	 * 菜单编辑处理
	 */
	@RequestMapping(value = "/modifyMenu", produces = "plain/text; charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String modifyMenu(@ModelAttribute("Menu") Menu menu,
			BindingResult result, Model model, HttpServletRequest request)
			throws IOException {
		// 处理结果信息
		DwzAjaxResult dwzResult;
		
			if (result.hasErrors()) {
				dwzResult = new DwzAjaxResult("300", "参数错误", "menuM", "", "");
				return new JsonObject(dwzResult).toString();
			}
		//	ProcessInfoCommon.setUpdateUserInfo(Menu, request);
			try {
				String parentMenuId = request.getParameter("org.id");
				menu.setParentMenuId(parentMenuId);
				menuService.modifyMenu(menu);
				dwzResult = new DwzAjaxResult("200", "保存成功", "menu",
						"closeCurrent", "");
				// 刷新会话中角色和菜单的缓存
				//roleService.initRolesAndMenus(request);
			} catch (Exception e) {
				dwzResult = new DwzAjaxResult("300", "保存失败:系统错误", "menu", "",
						"");
				//log.error(e.getLocalizedMessage());
			}
	
		return new JsonObject(dwzResult).toString();
	}
	/**
	 * 菜单删除处理
	 */
	@RequestMapping(value = "/removeMenu")
	@ResponseBody
	public String removeMenu(@RequestParam("ids") String ids,
			HttpServletRequest request) {
		DwzAjaxResult dwzResult = null;
			try {
				String[] idArray = ids.split(",");
				Menu tempMenu = null;
				String errorCode = "";
				for (String id : idArray) {
					tempMenu = new Menu();
					tempMenu.setParentMenuId(id);
					List<Menu> menuList = menuService
							.getMenuList(tempMenu);
					if (menuList != null && menuList.size() > 0) {
						errorCode += id + ",";
					}
				}
				if (StringUtils.isNotBlank(errorCode)) {
					dwzResult = new DwzAjaxResult("300", "菜单下有其他菜单/按钮权限:"
							+ StringUtils.removeEnd(errorCode, ","), "menu",
							"", "");
					return new JsonObject(dwzResult).toString();
				}
				for (String id : idArray) {
					menuService.removeMenu(id);
					dwzResult = new DwzAjaxResult("200", "删除成功", "menu", "", "");
					// 刷新会话中角色和菜单的缓存
				}
			} catch (Exception e) {
				dwzResult = new DwzAjaxResult("300", "删除失败:系统错误", "menu", "",
						"");
			}
		return new JsonObject(dwzResult).toString();
	}
	
	@RequestMapping(value = "/view_index", method = RequestMethod.GET)
	public String viewIndex(HttpServletRequest request,
			HttpServletResponse response, Model model) { 
			
			// 跳转至菜单编辑页面
			return "index_v1";

	}
}

