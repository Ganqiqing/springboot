<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Gan
  Date: 2020/8/21
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        loadStuData();
    })

    function loadStuData() {
        $.ajax({
            url: "${pageContext.request.contextPath}/student/selectAll",
            type: "psot",
            dataType: "json",
            success: function (data) {
                $("#info").empty();
                $.each(data, function (i, n) {
                    $("#info").append("<tr>")
                        .append("<td>" + n.id + "</td>")
                        .append("<td>" + n.name + "</td>")
                        .append("<td>" + n.age + "</td>")
                        .append("<td>" + "<a href='javascript:upgrade(" + n.id + ")'>修改</a>" + "</td>")
                        .append("<td>" + "<a href='javascript:del(" + n.id + ")'>删除</a>" + "</td>")
                        .append("</tr>")
                })
            }
        })
    }

    function del(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/student/del",
            data: {"id": id},
            type: "post",
            dataType: "json",
            //async: false,
            success: function (date) {
                if ("success" == date.result) {
                    alert("删除成功");
                    window.location.reload();
                } else {
                    alert("删除失败");
                    window.location.reload();
                }
            }
        })
    }

    function update(id) {
        var userName = prompt("名字", "");
        var age = prompt("年龄", "");
        $.ajax({
            url: "${pageContext.request.contextPath}/user/updataUser",
            data: {"id": id, "userName": userName, "age": age},
            type: "post",
            dataType: "json",
            success: function (data) {
                if ("success" == data.result) {
                    alert("成功");
                    window.location.reload();
                } else {
                    alert("失败");
                    window.location.reload();
                }
            }
        })
    }
</script>
<style type="text/css">
</style>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <table border="1" align="center">
        <tr>
            <th>id</th>
            <th>name</th>
            <th>age</th>
            <td colSpan="2" style=" text-align:center">操作</td>
        </tr>
        <c:forEach items="${students}" var="student">
            <tr>
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td>${student.age}</td>
                <td><a href="javascript:update('${student.id}')"/>修改</td>
                <td><a href="javascript:del('${student.id}')"/>删除</td>
            </tr>
        </c:forEach>
    </table>
</div>

<div align="center">
    <table border="1">
        <thead>
        <tr>
            <td>id</td>
            <td>name</td>
            <td>age</td>
            <td colSpan="2" style=" text-align:center">操作</td>
        </tr>
        </thead>
        <tbody id="info">

        </tbody>
    </table>
</div>
</body>
</html>
