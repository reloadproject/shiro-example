package com.github.zhangkaitao.shiro.chapter7.web.servlet;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/** 首先访问 http://localhost:8080/chapter7/login，使用帐号“zhang/123”进行登录，再访问/role
 或/permission 时会跳转到成功页面（因为其授权成功了）；
 如果使用帐号“wang/123”登录成功后访问这两个地址会跳转到“/unauthorized”即没有授权页面。
 * <p>User: Zhang Kaitao
 * <p>Date: 14-1-29
 * <p>Version: 1.0
 */
@WebServlet(name = "unauthorizedServlet", urlPatterns = "/unauthorized")
public class UnAuthorizedServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(">>>>>操作未授权!禁止操作!");
        req.getRequestDispatcher("/WEB-INF/jsp/unauthorized.jsp").forward(req, resp);
    }


}
