<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
</head>
<body>
${subject.principal}拥有权限。<br>
<shiro:hasPermission name="user:create">拥有user:create 权限</shiro:hasPermission> <br>
<%--不能写成 user:update 因为我们配置的是角色admin拥有user:*的权限--%>
<shiro:lacksPermission name="user-update">没有user-update 权限</shiro:lacksPermission>
</body>
</html>