package com.cn.ninezero.security;

import com.cn.ninezero.pojo.User;
import com.cn.ninezero.utils.HttpUtils;

import org.apache.commons.lang.StringUtils;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class SecurityFilter extends OncePerRequestFilter {
    private String[] excludeUrls;
    private AntPathMatcher matcher = new AntPathMatcher();

    @Override
    protected void initFilterBean() throws javax.servlet.ServletException {
        super.initFilterBean();
        String excludeUrls = super.getFilterConfig().getInitParameter("excludeUrls");
        this.setExcludeUrls(excludeUrls);
    }

    public void setExcludeUrls(String excludeUrls) {
        if (StringUtils.isNotEmpty(excludeUrls)) this.excludeUrls = org.springframework.util.StringUtils.tokenizeToStringArray(excludeUrls, ", \n");
    }

	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain chain)
			throws ServletException, IOException {
		  User user = SecurityUtils.getLoginUser(request);
	        if (user == null) {
	            if (excludeUrls != null) {
	                String uri = request.getRequestURI();
	                String contextPath = HttpUtils.getContextPath(request);
	                if(uri.startsWith(contextPath)) uri = uri.substring(contextPath.length());
	                if(!uri.startsWith("/")) uri = "/" + uri;
	                for (String excludeUrl : excludeUrls) {
	                	/*if(matcher.match("/static/**", uri)){
	                		return;
	                	}*/
	                    if (matcher.match(excludeUrl, uri)) {
	                       chain.doFilter(request, response);
	                        return;
	                    }
	                }
	            }
	            if (HttpUtils.isAjaxRequest(request)) {
	                response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
	            } else {
	                 response.sendRedirect(HttpUtils.getContextPath(request) + "/login.do");
	            }
	            return;
	        }
	        chain.doFilter(request, response);
		
	}
	   @Override
	    public void destroy() {
	        this.excludeUrls = null;
	        this.matcher = null;
	    }
}
