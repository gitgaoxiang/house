package com.cn.ninezero.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cn.bluemobi.product.utils.JsonObject;
import com.cn.ninezero.pojo.DwzAjaxResult;
import com.cn.ninezero.pojo.Menu;
import com.cn.ninezero.pojo.User;
import com.cn.ninezero.security.SecurityUtils;
import com.cn.ninezero.service.MenuService;
import com.cn.ninezero.service.UserService;
import com.cn.ninezero.utils.MD5Util;

@Controller
public class LoginController {

	@Resource
	private UserService userService;

	@Resource
	private MenuService menuService;

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/index")
	public String homePage(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		User user = SecurityUtils.getLoginUser(request);
		if (user == null) {
			return "login";
		} else {

			// menuList=menuMapper.getMenuListByRoleIds(roleIds);
			// List<MenuModel> menuList=SessionMgr.getUserMenus(request);
			/*
			 * if(ObjectUtil.isEmpty(menuList)){
			 * roleService.initRolesAndMenus(request); }
			 */
			List<Menu> menuList = menuService.getMenuListByRoleIds(user
					.getUserRole());

			String strHtml = menuService.getMenuTree(menuList, false);
			model.addAttribute("menuTreeModel", strHtml);
			
			model.addAttribute("loginUser", user);
		
			return "homePage";

		}
	}

	@RequestMapping(value = "/doLogin")
	public @ResponseBody
	Map<String, ?> login(HttpServletRequest request,
			@RequestParam String userName, @RequestParam String userPwd) {
		try {
			boolean flag = true;
			Map<String, Object> modelMap = new HashMap<String, Object>();
			/*
			 * if (!this.checkCurrentSystemPermission(request)) { flag = false;
			 * modelMap.put("isLoginSuccess", false); modelMap.put("message",
			 * "绯荤粺寮傚父锛屽紓甯镐唬鐮侊細P"); modelMap.put("success",
			 * Boolean.valueOf(true)); return modelMap; }
			 */
			User userlogin = new User();
			userlogin.setUserName(userName);
			userlogin.setUserPwd(MD5Util.GetMD5Code(userPwd, false));
			if (this.userService.checkUserName(userName) == 0) {
				flag = false;
				modelMap.put("isLoginSuccess", false);
				modelMap.put("message", "用户名不存在");
				modelMap.put("success", Boolean.valueOf(true));
				return modelMap;
			} else if (this.userService.checkUserPass(userlogin) == 0) {
				flag = false;
				modelMap.put("isLoginSuccess", false);
				modelMap.put("message", "密码错误");
				modelMap.put("success", Boolean.valueOf(true));
				return modelMap;
			}
			if (flag) {
				User user = this.userService.getUserByUserName(userName);
				request.getSession().setAttribute("loginUser", user);
				modelMap.put("isLoginSuccess", true);
				modelMap.put("data", user);
				modelMap.put("success", Boolean.valueOf(true));
				return modelMap;
			} else {
				modelMap.put("isLoginSuccess", false);
				modelMap.put("success", Boolean.valueOf(true));
				return modelMap;
			}
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("success", false);
			map.put("message", "用户名或密码错误");
			return map;
		}
	}

	@RequestMapping(value = "/noPermission")
	public ModelAndView noPermission(HttpServletRequest request)
			throws Exception {
		try {
			ModelAndView mav = new ModelAndView("error/noPermission");
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest request) throws Exception {
		try {
			SecurityUtils.userLogout(request);
			ModelAndView mav = new ModelAndView("redirect:/login.do");
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@RequestMapping("/simpleLogin")
	public String simpleLogin() {
		return "/simple_login";
	}

	@RequestMapping(value = "/toSimplelogin", method = RequestMethod.POST)
	@ResponseBody
	public String toSimplelogin(
			@RequestParam("username") String userName,
			@RequestParam("passwd") String userPwd, HttpServletRequest request,
			Model model) {
		DwzAjaxResult dwzResult;
		try {
			

			boolean flag = true;
			//Map<String, Object> modelMap = new HashMap<String, Object>();
			/*
			 * if (!this.checkCurrentSystemPermission(request)) { flag = false;
			 * modelMap.put("isLoginSuccess", false); modelMap.put("message",
			 * "绯荤粺寮傚父锛屽紓甯镐唬鐮侊細P"); modelMap.put("success",
			 * Boolean.valueOf(true)); return modelMap; }
			 */
			User userlogin = new User();
			userlogin.setUserName(userName);
			userlogin.setUserPwd(MD5Util.GetMD5Code(userPwd, false));
			if (this.userService.checkUserName(userName) == 0) {
				flag = false;
				/*modelMap.put("isLoginSuccess", false);
				modelMap.put("message", "用户名不存在");
				modelMap.put("success", Boolean.valueOf(true));*/
				dwzResult = new DwzAjaxResult("300", "用户名不存在！", "", "", "");
				return new JsonObject(dwzResult).toString();
				
			} else if (this.userService.checkUserPass(userlogin) == 0) {
				flag = false;
				/*modelMap.put("isLoginSuccess", false);
				modelMap.put("message", "密码错误");
				modelMap.put("success", Boolean.valueOf(true));*/
				dwzResult = new DwzAjaxResult("400", "密码错误！", "", "", "");
				return new JsonObject(dwzResult).toString();
			}
			if (flag) {
				User user = this.userService.getUserByUserName(userName);
				request.getSession().setAttribute("loginUser", user);
				/*modelMap.put("isLoginSuccess", true);
				modelMap.put("data", user);
				modelMap.put("success", Boolean.valueOf(true));
				return modelMap;*/
				dwzResult = new DwzAjaxResult("200", "登陆成功！", "", "", "");
				return new JsonObject(dwzResult).toString();
			} else {
				/*modelMap.put("isLoginSuccess", false);
				modelMap.put("success", Boolean.valueOf(true));
				return modelMap;*/
				dwzResult = new DwzAjaxResult("200", "登陆成功！", "", "", "");
				return new JsonObject(dwzResult).toString();
			}
		} catch (Exception e) {
			e.printStackTrace();
			/*Map<String, Object> map = new HashMap<String, Object>();
			map.put("success", false);
			map.put("message", "用户名或密码错误");
			return map;*/
			dwzResult = new DwzAjaxResult("300", "用户名或密码错误！", "", "", "");
		}
		return new JsonObject(dwzResult).toString();
	}
}
