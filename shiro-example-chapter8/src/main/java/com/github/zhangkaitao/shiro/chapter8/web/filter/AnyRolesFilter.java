package com.github.zhangkaitao.shiro.chapter8.web.filter;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.StringUtils;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

/** Shiro 提供 roles 拦截器，其验证用户拥有所有角色，没有提供验证用户拥有任意角色的拦截器。
 流程：
 1、首先判断用户有没有任意角色，如果没有返回 false，将到 onAccessDenied 进行处理；
 2、如果用户没有角色，接着判断用户有没有登录，如果没有登录先重定向到登录；
 3、如果用户没有角色且设置了未授权页面（unauthorizedUrl），那么重定向到未授权页面；
 否则直接返回 401 未授权错误码。
 */
public class AnyRolesFilter extends AccessControlFilter {

    private String unauthorizedUrl = "/unauthorized.jsp";
    private String loginUrl = "/login.jsp";

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        String[] roles = (String[])mappedValue;//角色集合
        if(roles == null) {
            return true;//如果没有设置角色参数，默认成功
        }
        for(String role : roles) {
            if(getSubject(request, response).hasRole(role)) {//拥有指定的角色时返回true
                return true;
            }
        }
        return false;//跳到onAccessDenied处理
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        Subject subject = getSubject(request, response);
        if (subject.getPrincipal() == null) {//表示没有登录，重定向到登录页面
            saveRequest(request);
            WebUtils.issueRedirect(request, response, loginUrl);
        } else { //被拒绝时的处理
            if (StringUtils.hasText(unauthorizedUrl)) {//如果有未授权页面跳转过去
                WebUtils.issueRedirect(request, response, unauthorizedUrl);
            } else {//否则返回401未授权状态码
                WebUtils.toHttp(response).sendError(HttpServletResponse.SC_UNAUTHORIZED);
            }
        }
        return false;
    }
}
