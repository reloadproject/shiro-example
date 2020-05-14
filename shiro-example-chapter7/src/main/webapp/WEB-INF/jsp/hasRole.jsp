<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
</head>
<body>
${subject.principal}拥有角色。<br>
<shiro:hasRole name="admin">有admin角色</shiro:hasRole> <br>
<shiro:lacksRole name="admin1">没有admin1角色</shiro:lacksRole> <br>
<shiro:hasAnyRoles name="admin ,admin1">有admin, admin1 角色其中之一</shiro:hasAnyRoles>
</body>
</html>