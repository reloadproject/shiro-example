<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title></title>
</head>
<body>
<shiro:authenticated>
    访问该页面需要用户身份验证通过；即Subject.isAuthenticated()==true。
</shiro:authenticated>

</body>
</html>