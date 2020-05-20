<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title></title>
</head>
<body>
     <shiro:hasPermission name="user:create">
         恭喜,登陆成功 permissionSuccess.jsp <br>
         <shiro:principal/>拥有授权:user:create
     </shiro:hasPermission>
     <br>
     <shiro:hasPermission name="user:update">  <%--把update改为update1再刷新页面就看到没有此授权了--%>
         <shiro:principal/>拥有授权:user:update
     </shiro:hasPermission>
</body>
</html>