<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>首页</title>
</head>
<body>

<a href="${pageContext.request.contextPath}/login">登录</a><br/>
<a href="${pageContext.request.contextPath}/authenticated">已身份认证</a><br/>
<a href="${pageContext.request.contextPath}/role">角色授权</a><br/>
<a href="${pageContext.request.contextPath}/permission">权限授权</a><br/>

<%--shiro:guest 会判断用户是否登陆了--%>
<p>Hi <shiro:guest>Guest来宾</shiro:guest>
    <shiro:user><c:out value="${subject.principal}"/></shiro:user>!
    ( <shiro:user><a href="<c:url value="/logout"/>">Log out</a></shiro:user>
    <shiro:guest><a href="<c:url value="/login"/>">Log in</a></shiro:guest> )
</p>

</body>
</html>