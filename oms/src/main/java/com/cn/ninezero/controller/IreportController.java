package com.cn.ninezero.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;





@Controller("ireport")  
@RequestMapping("admin/ireport")  
public class IreportController {

	
/*	@Resource
	private UserService userService;
*/
	@RequestMapping("/show")
	public String newUser(Model model, HttpServletRequest request) {
		
		return "ireport/test";

	}
	
}
