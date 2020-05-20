package com.github.zhangkaitao.shiro.chapter13;

import org.apache.shiro.codec.Base64;

import java.nio.charset.Charset;

public class Test {
    public static void main(String[] args) {
        byte[] decode = Base64.decode("4AvVhmFLUs0KTA3Kprsdag==");
        System.out.println("----new String(decode) = " + new String(decode, Charset.forName("gbk")));
        byte[] encode = Base64.encode("你好".getBytes());
        byte[] decode1 = Base64.decode(encode);
        System.out.println("----decode1 = " + new String(decode1));

        String string = Base64.encodeToString("你好".getBytes());
        System.out.println("----string = " + string);
        String string1 = Base64.decodeToString("4AvVhmFLUs0KTA3Kprsdag==");
        System.out.println("----string1 = " + string1);
        String string2 = Base64.decodeToString("4AvVhmFLUs0KTA3Kprsdag==".getBytes());
        System.out.println("----string2 = " + string2);
    }
}
