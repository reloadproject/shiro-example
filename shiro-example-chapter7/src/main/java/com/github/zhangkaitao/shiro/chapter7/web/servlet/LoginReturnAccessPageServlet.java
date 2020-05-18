package com.github.zhangkaitao.shiro.chapter7.web.servlet;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/** 测试:
 * 输入 http://localhost:8080/chapter7/role，会跳转到“/formfilterlogin”登录表单，
 * 提交表单如果 authc 拦截器登录成功后，会直接重定向会之前的地址“/role”；
 * 假设我们直接访问 “/formfilterlogin”的话登录成功将直接到默认的 successUrl。

 */
@WebServlet(name = "formFilterLoginServlet", urlPatterns = "/loginReturnAccessPageServlet")
public class LoginReturnAccessPageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*在登录 Servlet 中通过 shiroLoginFailure 得到 authc 登录失败时的异常类型名，然后根据此
        异常名来决定显示什么错误消息。
        */
        String errorClassName = (String)req.getAttribute("shiroLoginFailure");
        System.out.println("----errorClassName = " + errorClassName);
        if(UnknownAccountException.class.getName().equals(errorClassName)) {
            req.setAttribute("error", "用户名/密码错误3");
        } else if(IncorrectCredentialsException.class.getName().equals(errorClassName)) {
            req.setAttribute("error", "用户名/密码错误4");
        } else if(errorClassName != null) {
            req.setAttribute("error", "未知错误：" + errorClassName);
        }
        System.out.println("---------登陆出错,重新登陆.....");
        req.getRequestDispatcher("/WEB-INF/jsp/formfilterlogin.jsp").forward(req, resp);
    }
}
