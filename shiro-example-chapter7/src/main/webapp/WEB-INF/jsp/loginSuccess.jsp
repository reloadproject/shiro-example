<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
</head>
<body>
欢迎${subject.principal}登录成功！<a href="${pageContext.request.contextPath}/logout">退出</a>

<p>Hi <shiro:guest>Guest来宾</shiro:guest>
    <shiro:user><c:out value="${subject.principal}"/></shiro:user>!
    ( <shiro:user><a href="<c:url value="/logout"/>">Log out</a></shiro:user>
    <shiro:guest><a href="<c:url value="/login"/>">Log in</a></shiro:guest> )
</p>

</body>
</html>