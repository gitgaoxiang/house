 package com.cn.ninezero.controller;  
  
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;  
import javax.servlet.http.HttpServletRequest;  
  
import org.springframework.stereotype.Controller;  
import org.springframework.ui.Model;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
  
import com.cn.ninezero.pojo.User;
import com.cn.ninezero.service.UserService;  
  
@Controller("userController")  
@RequestMapping("/user")  
public class UserController {  
    @Resource
    private UserService userService;  
      
    @RequestMapping("/showUser")  
    public String toIndex(HttpServletRequest request,Model model){  
        int userId = Integer.parseInt(request.getParameter("id"));  
        User user = this.userService.getUserById(userId);  
        model.addAttribute("user", user);  
        return "showUser";  
    }
    
    
    @RequestMapping(value = "/addAblum", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,?>  login(HttpServletRequest request,@RequestParam String userId,@RequestParam String name) throws Exception {
        Map<String,Object> modelMap = new HashMap<String,Object>();
      //  int i =2;
      //  this.userService.checkUserName(modelMap);
        //System.out.println("----访问到了11111------");
        User user = this.userService.getUserById(1);  
        modelMap.put("userId", user.getId());
        modelMap.put("name", user.getUserName());
        modelMap.put("success", Boolean.valueOf(true));
        return modelMap;

    }

}

