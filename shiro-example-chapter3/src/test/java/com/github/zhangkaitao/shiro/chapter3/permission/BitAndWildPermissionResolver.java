package com.github.zhangkaitao.shiro.chapter3.permission;

import org.apache.shiro.authz.Permission;
import org.apache.shiro.authz.permission.PermissionResolver;
import org.apache.shiro.authz.permission.WildcardPermission;
import org.apache.shiro.realm.text.IniRealm;

/**
 * <p>User: Zhang Kaitao
 * <p>Date: 14-1-26
 * <p>Version: 1.0
 */
public class BitAndWildPermissionResolver implements PermissionResolver {

    @Override
    public Permission resolvePermission(String permissionString) {
        if(permissionString.startsWith("+")) {
            System.out.println("---返回位移方式的权限:"+permissionString);
            return new BitPermission(permissionString);//返回位移方式的权限
        }
        System.out.println("---返回通配符方式的权限:"+permissionString);
        return new WildcardPermission(permissionString);//返回通配符方式的权限
    }
}
