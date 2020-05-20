package com.github.zhangkaitao.shiro.chapter12.realm;

import com.github.zhangkaitao.shiro.chapter12.entity.User;
import com.github.zhangkaitao.shiro.chapter12.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import sun.java2d.pipe.AAShapePipe;

import java.util.Set;

/**
 * <p>User: Zhang Kaitao
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public class UserRealm extends AuthorizingRealm {

    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    /*进行查询权限时才会触发此方法
     获取 授权 信息
     PrincipalCollection 是一个身份集合，因为我们
    现在就一个 Realm，所以直接调用 getPrimaryPrincipal 得到之前传入的用户名即可；
    然后根据用户名调用 UserService 接口获取角色及权限信息。
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = (String)principals.getPrimaryPrincipal();

        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        //设置角色
        Set<String> roles = userService.findRoles(username);
        System.out.println("----roles = " + roles);
        authorizationInfo.setRoles(roles);
        //设置权限
        Set<String> permissions = userService.findPermissions(username);
        System.out.println("----permissions = " + permissions);
        authorizationInfo.setStringPermissions(permissions);

        return authorizationInfo;
    }
    /* 获取 身份验证相关 信息
    1、如果 Realm 是 AuthenticatingRealm 子类，则提供给 AuthenticatingRealm 内部使用的
    CredentialsMatcher 进行凭据验证； （如果没有继承它需要在自己的 Realm中自己实现验证）；
    2、提供给 SecurityManager 来创建 Subject（提供身份信息）；

    首先根据传入的用户名获取 User 信息；然后如果 user 为空，那么抛出没找到帐号异常
    UnknownAccountException；如果 user找到但锁定了抛出锁定异常 LockedAccountException；
    最后生成 AuthenticationInfo 信息，交给间接父类 AuthenticatingRealm 使用
     CredentialsMatcher 进行判断密码是否匹配，如果不匹配将抛出密码错误异常
     IncorrectCredentialsException；
     另外如果密码重试此处太多将抛出超出重试次数异常 ExcessiveAttemptsException；
     在组装 SimpleAuthenticationInfo 信息时，需要传入：身份信息（用户名）、凭据（密文密码）、
     盐（username+salt），CredentialsMatcher使用盐加密传入的明文密码和此处的密文密码进行匹配。
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

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
        System.out.println("----认证信息 authenticationInfo = " + authenticationInfo);
        return authenticationInfo;
    }

    @Override
    public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
        super.clearCachedAuthorizationInfo(principals);
    }

    @Override
    public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
        super.clearCachedAuthenticationInfo(principals);
    }

    @Override
    public void clearCache(PrincipalCollection principals) {
        super.clearCache(principals);
    }

    public void clearAllCachedAuthorizationInfo() {
        getAuthorizationCache().clear();
    }

    public void clearAllCachedAuthenticationInfo() {
        getAuthenticationCache().clear();
    }

    public void clearAllCache() {
        clearAllCachedAuthenticationInfo();
        clearAllCachedAuthorizationInfo();
    }

}
