<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title></title>
</head>
<body>
<shiro:authenticated>
    是通过用户名密码登陆的；即Subject.isAuthenticated()==true。 <br>
    可以下单付款! <br>
</shiro:authenticated>
<shiro:notAuthenticated>
    身份未认证状态!<br>
</shiro:notAuthenticated>
<shiro:user>
    登陆状态:可能是通过登陆,或者记住我登陆的! 可以浏览购物车等信息,但不能下单付款! <br>
    如果是通过记住我登陆的,则要弹出页面再登陆后进行付款等操作!
</shiro:user>
</body>
</html>