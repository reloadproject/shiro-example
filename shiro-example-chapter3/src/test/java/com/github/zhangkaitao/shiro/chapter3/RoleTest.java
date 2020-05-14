package com.github.zhangkaitao.shiro.chapter3;

import junit.framework.Assert;
import org.apache.shiro.authz.UnauthorizedException;
import org.junit.Test;

import java.util.Arrays;
import java.util.stream.Stream;

/** 隐式角色:
 * 到此基于角色的访问控制（即隐式角色）就完成了，这种方式的缺点就是如果很多地方进
 * 行了角色判断，但是有一天不需要了那么就需要修改相应代码把所有相关的地方进行删除；
 * 这就是粗粒度造成的问题。
 * <p>User: Zhang Kaitao
 * <p>Date: 14-1-26
 * <p>Version: 1.0
 */
public class RoleTest extends BaseTest {

    @Test
    public void testHasRole() {
        login("classpath:shiro-role.ini", "zhang", "123");
        //判断拥有角色：role1
        Assert.assertTrue(subject().hasRole("role1"));
        //判断拥有角色：role1 and role2
        Assert.assertTrue(subject().hasAllRoles(Arrays.asList("role1", "role2")));
        //判断拥有角色：role1 and role2 and !role3
        boolean[] result = subject().hasRoles(Arrays.asList("role1", "role2", "role3"));
        Assert.assertTrue(result[0]);
        Assert.assertTrue(result[1]);
        Assert.assertFalse(result[2]);
        //二种输出方式
        Boolean[] re = new Boolean[]{result[0],result[1],result[2]};
        Arrays.stream(re).forEach(System.out::println);
        Stream.of(re).forEach(System.out::println);
    }

    /**
     * 加上这个异常则不会再抛出异常了,否则会抛出:
     * org.apache.shiro.authz.UnauthorizedException: Subject does not have role [role3]
     */
    @Test//(expected = UnauthorizedException.class)  //预期出现...异常的意思
    public void testCheckRole() {
        login("classpath:shiro-role.ini", "zhang", "123");
        //断言拥有角色：role1
        subject().checkRole("role1");
        //断言拥有角色：role1 and role3 失败抛出异常
        subject().checkRoles("role1", "role3");
    }

}
