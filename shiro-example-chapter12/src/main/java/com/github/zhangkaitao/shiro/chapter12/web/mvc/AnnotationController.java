package com.github.zhangkaitao.shiro.chapter12.web.mvc;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** 权限 注解说明:
 * @RequiresAuthentication
 * 表示当前 Subject 已经通过 login 进行了身份验证；即 Subject. isAuthenticated()返回 true。
 * @RequiresUser
 * 表示当前 Subject 已经身份验证或者通过记住我登录的。
 * @RequiresGuest
 * 表示当前 Subject 没有身份验证或通过记住我登录过，即是游客身份。
 * @RequiresRoles(value={“admin”, “user”}, logical= Logical.AND)
 * 表示当前 Subject 需要角色 admin 和 user。
 * @RequiresPermissions (value={“user:a”, “user:b”}, logical= Logical.OR)
 * 表示当前 Subject 需要权限 user:a 或 user:b。
 */
@Controller
public class AnnotationController {

    @RequestMapping("/hello1")
    public String hello1() {
        //检查角色
        SecurityUtils.getSubject().checkRole("admin");
        return "success1";
    }
    //验证角色
    @RequiresRoles("admin")
    @RequestMapping("/hello2")
    public String hello2() {
        return "success2";
    }

    /**
     * 会看到跳转到未授权页面
     */
    @RequiresRoles("superadmin")
    @RequestMapping("/hello3")
    public String hello3() {
        boolean authenticated = SecurityUtils.getSubject().isAuthenticated();
        System.out.println("----是否登陆 authenticated = " + authenticated);
        return "success2";
    }

    /**
     * 验证授权
     */
    @RequiresPermissions("user:create")
    @RequestMapping("/hello4")
    public String hello4() {
        return "permissionSuccess";
    }

}
