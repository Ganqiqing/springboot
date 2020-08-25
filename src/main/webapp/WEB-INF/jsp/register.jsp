<%--
  Created by IntelliJ IDEA.
  User: Gan
  Date: 2020/8/25
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('form').submit(function () {
                var name = $("#name").val();
                var password = $("#password").val();
                $.ajax({
                    url: "${pageContext.request.contextPath}/test/registering",
                    type: "post",
                    data: {"name": name, "password": password},
                    dataType: "json",
                    success: function (data) {
                        if("success"==data.result){
                            alert("成功");
                            window.location.href="${pageContext.request.contextPath}/test/index";
                        }else {
                            alert("失败");
                        }
                    }
                })
                return false;
            })
        })
    </script>
</head>
<body>
<form action="">
    <table align="center" border="1">
        <tr>
            <td>注册账户：</td>
            <td><input type="text" name="name" id="name"></td>
        </tr>
        <tr>
            <td>注册密码：</td>
            <td><input type="password" name="password" id="password"></td>
        </tr>
        <tr align="center">
            <td colSpan="2" style=" text-align:center" align="center"><input align="center" type="submit" value="注册账户">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
