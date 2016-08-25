package com.cn.ninezero.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.cn.bluemobi.product.utils.JsonObject;
import com.cn.ninezero.pojo.DwzAjaxResult;
import com.cn.ninezero.pojo.Role;
import com.cn.ninezero.pojo.User;
import com.cn.ninezero.security.SecurityUtils;
import com.cn.ninezero.service.UserService;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller("userController")
@RequestMapping("admin/user")
public class UserController {

	@Resource
	private UserService userService;

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
	public String getUserList(/*@ModelAttribute("pager") DwzPagerMySQL pager,*/
			@ModelAttribute User user, Model model, HttpServletRequest request) {
		if (user == null) {
			user = new User();
		}
		// 登录用户信息
		List<User> userList = null;
		// 用户总数
	//	long total = 0;

		// 取得用户列表
		try {
			// 用户总数
		/*	total = userService.getUserCount(user);
			if (total <= pager.getOffset()) {
				pager.setPageNum(1L);
			}
			// 设置分页对象
			user.setPager(pager);*/
			userList = userService.getUserList(user);
		} catch (Exception e) {
			// log.error(e.getMessage());
		}
		//pager.setTotal(total);
		// 将用户信息放到会话中
		model.addAttribute("user",user);
		model.addAttribute("userList", userList);
	//	model.addAttribute("pager", pager);

		// 跳转至管理员主页面
		return "user/listUser";
	}

	@RequestMapping(value = "/deleteUser")
	@ResponseBody
	public String deleteUser(@ModelAttribute("roleModel") Role role,
			HttpServletRequest request) {
		DwzAjaxResult dwzResult;
		int userId = Integer.parseInt(request.getParameter("userId"));
		userService.deleteByPrimaryKey(userId);

		// 设置处理结果信息
		dwzResult = new DwzAjaxResult("200", "删除成功", "role", "", "");
		// 刷新会话中角色和菜单的缓存
		// roleService.initRolesAndMenus(request);

		// 返回处理结果信息
		return new JsonObject(dwzResult).toString();
	}
	

}
