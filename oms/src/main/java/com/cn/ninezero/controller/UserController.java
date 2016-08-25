package com.cn.ninezero.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import com.cn.bluemobi.product.common.DwzPagerMySQL;
import com.cn.bluemobi.product.utils.JsonObject;
import com.cn.ninezero.pojo.DwzAjaxResult;
import com.cn.ninezero.pojo.Role;
import com.cn.ninezero.pojo.User;
import com.cn.ninezero.security.SecurityUtils;
import com.cn.ninezero.service.RoleService;
import com.cn.ninezero.service.UserService;
import com.cn.ninezero.utils.MD5Util;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("userController")
@RequestMapping("admin/user")
public class UserController {

	@Resource
	private UserService userService;
	@Resource
	private RoleService roleService;

	@RequestMapping(value = "/editPassword")
	public String changePassword(Model model, HttpServletRequest request) {
		// 登录用户信息
		User userLogin = SecurityUtils.getLoginUser(request);

		// 将用户信息设置到画面显示对象
		model.addAttribute("tblUser", userLogin);

		// 跳转至用户查看页面
		return "changePassword";
	}

	@RequestMapping(value = "/userList")
	public String getUserList(@ModelAttribute("pager") DwzPagerMySQL pager,
			@ModelAttribute User user, Model model, HttpServletRequest request) {
		if (user == null) {
			user = new User();
		}
		// 登录用户信息
		List<User> userList = null;
		List<Role> roleList = null;
		// 用户总数
		long total = 0;

		// 取得用户列表
		try {
			// 用户总数
			total = userService.getUserCount(user);
			if (total <= pager.getOffset()) {
				pager.setPageNum(1L);
			}
			// 设置分页对象
			user.setPager(pager);
			userList = userService.getUserList(user);
			roleList = roleService.getAllRoleList();
		} catch (Exception e) {
			// log.error(e.getMessage());
		}
		pager.setTotal(total);
		// 将用户信息放到会话中
		model.addAttribute("user", user);
		model.addAttribute("userList", userList);
		model.addAttribute("roleList", roleList);
		model.addAttribute("pager", pager);

		// 跳转至管理员主页面
		return "user/listUser";
	}

	@RequestMapping("/newUser")
	public String newUser(Model model, HttpServletRequest request) {
		List<Role> roleList = null;
		roleList = roleService.getAllRoleList();
		model.addAttribute("roleList", roleList);
		return "user/addUser";

	}

	@RequestMapping(value = "/saveUser")
	@ResponseBody
	public String saveUser(User user, BindingResult result,
			HttpServletRequest request, Model model) throws IOException {
		// 处理结果信息
		DwzAjaxResult dwzResult;
		/*
		 * if(!checkCsjRole(request)){ dwzResult = new DwzAjaxResult("300",
		 * "保存失败:用户不能执行该操作", "role", "", ""); }else{
		 */
		try {
			user.setUserPwd(MD5Util.GetMD5Code("1"));
			// 设置更新者用户信息
			userService.saveUser(user);
			// roleService.initRolesAndMenus(request);
			dwzResult = new DwzAjaxResult("200", "保存成功", "userList",
					"closeCurrent", "");
		} catch (Exception e) {
			// log.error(e.getLocalizedMessage());
			dwzResult = new DwzAjaxResult("300", "保存失败:系统错误", "userList", "", "");
		}
		// }
		// 返回处理结果信息
		return new JsonObject(dwzResult).toString();
	}

	@RequestMapping(value = "/removeUser")
	@ResponseBody
	public String removeUser(@RequestParam("ids") String ids,
			HttpServletRequest request) {
		DwzAjaxResult dwzResult = null;
			try {
				String[] idArray = ids.split(",");
			
				
				for (String id : idArray) {
					userService.removeUser(id);
					dwzResult = new DwzAjaxResult("200", "删除成功", "userList", "", "");
					// 刷新会话中角色和菜单的缓存
				}
			} catch (Exception e) {
				dwzResult = new DwzAjaxResult("300", "删除失败:系统错误", "userList", "",
						"");
			}
		return new JsonObject(dwzResult).toString();
	}
}
