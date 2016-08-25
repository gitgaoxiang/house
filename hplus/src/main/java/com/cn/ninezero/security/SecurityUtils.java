package com.cn.ninezero.security;



import javax.servlet.http.HttpServletRequest;

import com.cn.ninezero.pojo.User;

/**
 * Created by 615146292 on 2015/5/1.
 */
public class SecurityUtils {

    private SecurityUtils() {}

    public static User getLoginUser(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("loginUser");
        return user;
    }

    public static void userLogout(HttpServletRequest request) {
        request.getSession().removeAttribute("loginUser");
    }
}
