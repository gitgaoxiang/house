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


public class PermissionFilter extends OncePerRequestFilter {
    private String backendUrl;
    private String frontUrl;
    private AntPathMatcher matcher = new AntPathMatcher();

    @Override
    protected void initFilterBean() throws ServletException {
        super.initFilterBean();
        String backendUrl = super.getFilterConfig().getInitParameter("manageUrl");
        String frontUrl = super.getFilterConfig().getInitParameter("frontUrl");
        this.setBackendUrl(backendUrl);
        this.setFrontUrl(frontUrl);
    }

    public void setBackendUrl(String backendUrl) {
        if (StringUtils.isNotEmpty(backendUrl)) this.backendUrl = backendUrl;
    }

    public void setFrontUrl(String frontUrl) {
        if (StringUtils.isNotEmpty(frontUrl)) this.frontUrl = frontUrl;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws ServletException, IOException {
        User user = SecurityUtils.getLoginUser(request);
        if (user != null) {
            if (backendUrl != null||frontUrl != null) {
                String uri = request.getRequestURI();
                String contextPath = HttpUtils.getContextPath(request);
                if (uri.startsWith(contextPath)) uri = uri.substring(contextPath.length());
                if (!uri.startsWith("/")) uri = "/" + uri;
                if (!matcher.match(backendUrl, uri)&&"3" == user.getUserRole()) {
                    chain.doFilter(request, response);
                    return;
                }/* else if (2 == user.getUserRole()) {
                    chain.doFilter(request, response);
                    return;
                }*/
                if (!matcher.match(frontUrl, uri)&&"2" == user.getUserRole()) {
                    chain.doFilter(request, response);
                    return;
                } /*else if (3 == user.getUserRole()) {
                    chain.doFilter(request, response);
                    return;
                }*/
            }
            if (HttpUtils.isAjaxRequest(request)) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            } else {
                 response.sendRedirect(HttpUtils.getContextPath(request) + "/noPermission");
            }
            return;
        }
        chain.doFilter(request, response);
    }


    @Override
    public void destroy() {
        this.frontUrl = null;
        this.backendUrl = null;
        this.matcher = null;
    }
}
