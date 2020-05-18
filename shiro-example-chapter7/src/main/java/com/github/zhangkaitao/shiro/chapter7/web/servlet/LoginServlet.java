package com.github.zhangkaitao.shiro.chapter7.web.servlet;

import com.github.zhangkaitao.shiro.chapter7.web.servlet.model.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.mgt.RealmSecurityManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.SubjectContext;
import org.apache.shiro.subject.support.DefaultSubjectContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;

/**
 * 参考: https://blog.csdn.net/uk8692/article/details/51098895
 * 最近在看开涛老师讲的关于shiro的教程，看到JSP标签的时候，关于<shiro:principal property="username" />
 * 这种写法，是要把一个带有username属性的对象转换为Prinipal后保存在session中，才能在页面上正确显示结果的。
 * 由于开始学习，所以我用的是ini配置文件作为安全数据源的。在登录的方法中，调用了subject.login(token)后，
 * 还要手动利用principal和realmName构造SimpleAuthenticationInfo对象，其实这里的pricipal是一个Object，
 * 就是我们的带有username属性的实体对象，然后将SimpleAuthenticationInfo对象存放在session中。
 *
 */
@WebServlet(name = "loginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("--------用户登陆--------");
        req.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String error = null;
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        System.out.println("----username = " + username);
        System.out.println("----password = " + password);
        Subject subject = SecurityUtils.getSubject();//从shiro获得subject,信息加载自shiro.ini
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        token.setRememberMe(true);
        try {
            subject.login(token);
			PrincipalCollection principals = subject.getPrincipals();
            System.out.println("----principals = " + principals);
            /* 这样不行
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            subject.getSession().setAttribute("user", user);*/

            /*
            添加上下面这段后就可以在页面中这样调用:
            <shiro:principal property="username"  />
             */
            //获取realmSecurityManager对象，其包含了很多信息，比如配置文件里面的数据	
            SecurityManager securityManager = SecurityUtils.getSecurityManager();
            RealmSecurityManager realmSecurityManager = (RealmSecurityManager) securityManager;
            Collection<Realm> collection = realmSecurityManager.getRealms();
            System.out.println("----collection.size() = " + collection.size());
            if (collection!=null && collection.size()>0){
                Iterator iterator = collection.iterator();
                while (iterator.hasNext()){
                    Realm realm = (Realm)iterator.next();
                    //得到默认的数据源名称，虽然默认的为iniRealm，也可以通过程序获得
                    String realmName = realm.getName();
                    System.out.println("----realmName = " + realmName);
                    //自定义的实体对象
                    User user = new User();
                    user.setUsername(username);
                    user.setPassword(password);
                    //得到SimpleAuthenticationInfo对象
                    SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user,password,realmName);
                    //通过源码分析在调用subject.login(token)后，会通过SubjectContext来保存到session，所以就直接复用了源码（DefaultSecurityManager类中）
                    SubjectContext subjectContext = new DefaultSubjectContext();
                    subjectContext.setAuthenticated(true);
                    subjectContext.setAuthenticationToken(token);
                    subjectContext.setAuthenticationInfo(info);
					/*
                        加上这句就可以了,否则会失去配置的认证和授权信息,在角色和权限验证时会出错,
                        但是加上了页面中就不能使用  <shiro:principal property="username" 取值了
                      */
                    subjectContext.setPrincipals(principals);
                    if (subject != null) {
                        subjectContext.setSubject(subject);
                    }
                    //此方法中进行保存
                    realmSecurityManager.createSubject(subjectContext);
                }
            }
        } catch (UnknownAccountException e) {
            error = "用户名/密码错误1";
        } catch (IncorrectCredentialsException e) {
            error = "用户名/密码错误2";
        } catch (AuthenticationException e) {
            //其他错误，比如锁定，如果想单独处理请单独catch处理
            error = "其他错误：" + e.getMessage();
        }

        if(error != null) {//出错了，返回登录页面
            req.setAttribute("error", error);
            req.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(req, resp);
        } else {//登录成功
            req.getSession().setAttribute( "subject", subject);
            req.getRequestDispatcher("/WEB-INF/jsp/loginSuccess.jsp").forward(req, resp);
        }
    }
}
