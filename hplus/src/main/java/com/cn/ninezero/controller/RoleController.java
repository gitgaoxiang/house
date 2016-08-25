 package com.cn.ninezero.controller;  
  
import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpSession;
  
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
import com.cn.ninezero.pojo.DwzAjaxResult;
import com.cn.ninezero.pojo.Menu;
import com.cn.ninezero.pojo.Role;
import com.cn.ninezero.pojo.User;
import com.cn.ninezero.security.SecurityUtils;
import com.cn.ninezero.service.MenuService;
import com.cn.ninezero.service.RoleService;
import com.cn.ninezero.service.UserService;


@Controller("role")  
@RequestMapping("admin/role")  
public class RoleController {  
    @Resource
    private RoleService roleService;  
      
    @Resource
	private MenuService menuService;
    
    @Resource
    private UserService userService;  
      
   
    /**
	 * 角色登录处理
	 * 
	 * @author gx
	 * @since Version 1.0
	 * @param pager
	 *            分页显示相关信息
	 * @param model
	 *            画面显示对象
	 * @return String 画面跳转URI
	 * @throws 无
	 */
    @RequestMapping(value = "/findRoleList")
	public String findRoleList(@ModelAttribute("pager") DwzPagerMySQL pager,
			Role role, Model model,HttpServletRequest request) {
		// 登录角色信息
		List<Role> roleList = null;
		// 取得角色列表
		User user=SecurityUtils.getLoginUser(request);
		long total = roleService.getParentRoleListCountByCurrentUser(user);
		if(total<=pager.getOffset()){
			pager.setPageNum(1L);
		}
		
		user.setPager(pager);
		roleList = roleService.getParentRoleListByCurrentUser(user);
		pager.setTotal(total);
		// 将角色信息放到会话中
		model.addAttribute("roleList", roleList);
		model.addAttribute("pager", pager);

		// 跳转至管理员主页面
		return "role/listRole";
	}

    /**
	 * 角色添加初始化处理
	 * 
	 * @author gx
	 * @since Version 1.0
	 * @return String 画面跳转URI
	 * @throws 无
	 */
	@RequestMapping(value = "/newRole")
	public String newRole(ModelMap map, HttpServletRequest request) {
		
		String roleId = "";
		Role role = new Role();
		roleId = getRandomKey(10);
		role.setRoleId(roleId);
		User user = SecurityUtils.getLoginUser(request);
		List<Menu> menuList =menuService.getMenuListByRoleIds(user.getUserRole());
		String menuIds="";
		for(Menu menu:menuList){
			menuIds+=menu.getMenuId()+",";
		}
		String menuData = menuService.getMenuListByRoleIdAndMenuIds(roleId,StringUtils.removeEnd(menuIds, ","));
		// 将角色信息设置到画面显示对象
		map.put("role", role);
		map.put("menuData", menuData);
		// 跳转至角色添加页面
		return "role/addRole";
	}
	
	public static String getRandomKey(int length) {
		Random randGen = null;
		char[] numbersAndLetters = null;
		if (length < 1) {
			return null;
		}

		randGen = new Random();
		numbersAndLetters = ("0123456789abcdefghijklmnopqrstuvwxyz"
				+ "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").toCharArray();

		char[] randBuffer = new char[length];
		for (int i = 0; i < randBuffer.length; i++) {
			randBuffer[i] = numbersAndLetters[randGen.nextInt(71)];
		}
		return new String(randBuffer);
	}
	
	/**
	 * 角色添加处理
	 * 
	 * @author gx
	 * @since Version 1.0
	 * @param roleModel
	 *            角色输入信息
	 * @param result
	 *            数据绑定结果
	 * @param request
	 *            画面请求信息
	 * @return String 画面跳转URI
	 * @throws 无
	 */
	@RequestMapping(value = "/saveRole")
	@ResponseBody
	public String saveRole(@ModelAttribute("roleModel") Role role,
			BindingResult result, HttpServletRequest request, Model model) throws IOException {
		// 处理结果信息
		DwzAjaxResult dwzResult;
		/*if(!checkCsjRole(request)){
			dwzResult = new DwzAjaxResult("300", "保存失败:用户不能执行该操作", "role", "", "");
		}else{*/
			try {
				String menuIds=request.getParameter("menuIds");
				// 设置更新者用户信息
				//setCreateUserInfo(role, request);
				roleService.saveRole(role, menuIds);
			//	roleService.initRolesAndMenus(request);
				dwzResult = new DwzAjaxResult("200", "保存成功", "role", "closeCurrent", "");
			} catch (Exception e) {
				//log.error(e.getLocalizedMessage());
				dwzResult = new DwzAjaxResult("300", "保存失败:系统错误", "role", "", "");
			}
		//}
		// 返回处理结果信息
		return new JsonObject(dwzResult).toString();
	}

	/**
	 * 唯一性检查
	 */
	@RequestMapping(value = "/checkUnique")
	@ResponseBody
	public String checkUnique(HttpServletRequest request) {
		String roleName=request.getParameter("roleName");
		String roleId=request.getParameter("roleId");
		User user=SecurityUtils.getLoginUser(request);
		List<Role> roleList = roleService.getParentRoleListByCurrentUser(user);
		for(Role role:roleList){
			if(role.getRoleName().equals(roleName)){
				if(StringUtils.isNotBlank(roleId)){
					if(!role.getRoleId().equals(roleId)){
						return "false";
					}
				}else{
					return "false";
				}
			}
		}
		// 返回处理结果信息
		return "true";
	}
	/**
	 * 角色编辑初始化处理
	 * 
	 * @author yangwr
	 * @since Version 1.0
	 * @param roleId
	 *            角色ID
	 * @param model
	 *            画面显示对象
	 * @return String 画面跳转URI
	 * @throws 无
	 */
	@RequestMapping(value = "/editRole", method = RequestMethod.GET)
	public String editRole(@RequestParam("roleId") String roleId, Model model,
			HttpServletRequest request, HttpSession session) {
		Role role = roleService.findRole(roleId);
			List<Menu> menuList=menuService.getMenuListByRoleIds("1");
			String menuIds="";
			for(Menu menu:menuList){
				menuIds+=menu.getMenuId()+",";
			}
			String menuData = menuService.getMenuListByRoleIdAndMenuIds(roleId,StringUtils.removeEnd(menuIds, ","));
			model.addAttribute("role", role);
			model.addAttribute("menuData", menuData);
			// 跳转至角色编辑页面
			return "role/editRole";
		}
		
	/**
	 * 角色编辑处理
	 * 
	 */
	@RequestMapping(value = "/modifyRole")
	@ResponseBody
	public String modifyRole(@ModelAttribute("roleModel") Role role,
			Model model, HttpServletRequest request) throws IOException {
		// 处理结果信息
		DwzAjaxResult dwzResult;
		
			try {
				String menuIds=request.getParameter("menuIds");
				// 设置更新者用户信息
			//	ProcessInfoCommon.setUpdateUserInfo(roleModel, request);
				roleService.modifyRole(role, menuIds);
				dwzResult = new DwzAjaxResult("200", "保存成功", "role", "closeCurrent", "");
				//刷新会话中角色和菜单的缓存
				//roleService.initRolesAndMenus(request);
			} catch (Exception e) {
				
				dwzResult = new DwzAjaxResult("300", "保存失败:系统错误", "role", "", "");
			}
		
		// 返回处理结果信息
		return new JsonObject(dwzResult).toString();
	}
	/**
	 * 角色删除处理
	 * 
	 * @author yangwr
	 * @since Version 1.0
	 * @param roleId
	 *            角色ID
	 * @param model
	 *            画面显示对象
	 * @return String 处理结果信息
	 * @throws 无
	 */
	@RequestMapping(value = "/removeRole")
	@ResponseBody
	public String removeRole(@ModelAttribute("roleModel") Role role,HttpServletRequest request) {
		DwzAjaxResult dwzResult;
		role = roleService.findRole(role.getRoleId());
		
			String roleId = role.getRoleId();
			List<User> roleUserList=userService.getRoleUserList(roleId);
			if(roleUserList!=null&&roleUserList.size()>0){
				dwzResult = new DwzAjaxResult("300", "此角色下已有用户，请先删除用户", "role", "", "");
			}else{
				// 执行删除处理
				roleService.removeRole(roleId);
				// 设置处理结果信息
				dwzResult = new DwzAjaxResult("200", "删除成功", "role", "", "");
				//刷新会话中角色和菜单的缓存
			//	roleService.initRolesAndMenus(request);
			}
			
		
		// 返回处理结果信息
		return new JsonObject(dwzResult).toString();
	}
}

