package com.cn.ninezero.utils;

/**
 * Created by 615146292 on 2015/5/1.
 */
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.StringUtils;

public final class HttpUtils {
    private HttpUtils() {
    }

    public static Cookie getCookie(HttpServletRequest httpServletRequest, String cookieName) {
        Cookie[] cookies = httpServletRequest.getCookies();
        if(cookies == null) {
            return null;
        } else {
            Cookie[] arr$ = cookies;
            int len$ = cookies.length;

            for(int i$ = 0; i$ < len$; ++i$) {
                Cookie cookie = arr$[i$];
                if(cookie.getName().equals(cookieName)) {
                    return cookie;
                }
            }

            return null;
        }
    }

    public static void addCookie(HttpServletResponse response, int cookieExpiration, String cookieName, String cookieValue, String domain) {
        Cookie cookie = new Cookie(cookieName, cookieValue);
        cookie.setMaxAge(cookieExpiration);
        if(StringUtils.isNotEmpty(domain)) {
            cookie.setDomain(domain);
        }

        cookie.setPath("/");
        response.addCookie(cookie);
    }

    public static void addCookie(HttpServletResponse response, int cookieExpiration, String cookieName, String cookieValue, String domain, String path, boolean secure) {
        Cookie cookie = new Cookie(cookieName, cookieValue);
        cookie.setMaxAge(cookieExpiration);
        if(StringUtils.isNotEmpty(domain)) {
            cookie.setDomain(domain);
        }

        if(StringUtils.isEmpty(path)) {
            path = "/";
        }

        cookie.setPath(path);
        cookie.setSecure(secure);
        response.addCookie(cookie);
    }

    public static void deleteCookie(HttpServletRequest request, HttpServletResponse response, String cookieName) {
        deleteCookie(request, response, cookieName, (String)null);
    }

    public static void deleteCookie(HttpServletRequest request, HttpServletResponse response, String cookieName, String domain) {
        Cookie cookie = getCookie(request, cookieName);
        if(cookie != null) {
            cookie.setMaxAge(0);
            cookie.setValue((String)null);
            cookie.setPath("/");
            if(StringUtils.isNotEmpty(domain)) {
                cookie.setDomain(domain);
            }

            response.addCookie(cookie);
        }

    }

    public static String getRemoteIp(HttpServletRequest request) {
        if(request == null) {
            return "";
        } else {
            String ip = request.getHeader("X-Real-IP");
            if(StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("X-Requested-For");
            }

            if(StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("X-Forwarded-For");
            }

            if(StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("Proxy-Client-IP");
            }

            if(StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("WL-Proxy-Client-IP");
            }

            if(StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("HTTP_CLIENT_IP");
            }

            if(StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("HTTP_X_FORWARDED_FOR");
            }

            if(StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getRemoteAddr();
            }

            return ip;
        }
    }

    public static boolean isAjaxRequest(HttpServletRequest request) {
        return request.getHeader("X-Requested-With") != null || request.getHeader("x-requested-with") != null;
    }

    public static String getContextPath(HttpServletRequest request) {
        String contextPath = request.getContextPath();
        if(contextPath == null) {
            contextPath = "";
        }

        if(!contextPath.startsWith("/")) {
            contextPath = "/" + contextPath;
        }

        while(contextPath.endsWith("/")) {
            contextPath = contextPath.substring(0, contextPath.length() - 1);
        }

        return contextPath;
    }
}
