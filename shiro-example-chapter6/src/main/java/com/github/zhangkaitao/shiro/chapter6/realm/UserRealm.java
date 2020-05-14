package com.github.zhangkaitao.shiro.chapter6.realm;

import com.github.zhangkaitao.shiro.chapter6.service.UserService;
import com.github.zhangkaitao.shiro.chapter6.service.UserServiceImpl;
import com.github.zhangkaitao.shiro.chapter6.entity.User;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

/**  当 我 们 使 用 AuthorizingRealm 时 ， 如 果 身 份 验 证 成 功 ， 在 进 行 授 权 时 就 通 过
 doGetAuthorizationInfo 方法获取角色/权限信息用于授权验证。
 * <p>User: Zhang Kaitao
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public class UserRealm extends AuthorizingRealm {

    private UserService userService = new UserServiceImpl();
    /*
    获取 授权 信息,包含角色和权限信息
    PrincipalCollection 是一个身份集合，因为我们
    现在就一个 Realm，所以直接调用 getPrimaryPrincipal 得到之前传入的用户名即可；然后根
    据用户名调用 UserService 接口获取角色及权限信息。

     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = (String)principals.getPrimaryPrincipal();

        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        //角色信息
        authorizationInfo.setRoles(userService.findRoles(username));
        //权限信息
        authorizationInfo.setStringPermissions(userService.findPermissions(username));

        return authorizationInfo;
    }
    // 获取 身份验证相关 信息
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //输入的用户名
        String username = (String)token.getPrincipal();

        User user = userService.findByUsername(username);

        if(user == null) {
            throw new UnknownAccountException();//没找到帐号
        }

        if(Boolean.TRUE.equals(user.getLocked())) {
            throw new LockedAccountException(); //帐号锁定
        }

        //交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配，如果觉得人家的不好可以自定义实现
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                user.getUsername(), //用户名
                user.getPassword(), //密码
                ByteSource.Util.bytes(user.getCredentialsSalt()),//salt=username+salt
                getName()  //realm name
        );
        return authenticationInfo;
    }
}
