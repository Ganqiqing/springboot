<%--
  Created by IntelliJ IDEA.
  User: Gan
  Date: 2020/8/21
  Time: 8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1" align="center">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>age</th>
    </tr>
    <c:forEach items="${list}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.password}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
