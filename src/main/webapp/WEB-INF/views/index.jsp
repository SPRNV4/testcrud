<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hello!</title>
    <style>
        #links {
            position:absolute;
            width:100%;
            text-align:center;
        }
    </style>
</head>
<body>
<div id="links">
    <a href="${pageContext.request.contextPath}/users"> All users</a>
    <a href="${pageContext.request.contextPath}/getuser"> Get user by ID</a>
    <a href="${pageContext.request.contextPath}/create">Add user</a>
    <a href="${pageContext.request.contextPath}/update"> Update user</a>
    <a href="${pageContext.request.contextPath}/delete"> Remove user</a>
</div>
</body>
</html>
