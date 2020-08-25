<%--
  Created by IntelliJ IDEA.
  User: Gan
  Date: 2020/8/22
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
<%--<script>
    // 随机验证码
    var m = parseInt(Math.random(0, 9) * (9999 - 1000) + 1000);
    var n = $(".cms_login_ver").text(m);
    // 原生获取文本内容
    // var n = document.getElementsByClassName("cms_login_ver")[0].innerHTML;
    // console.log(n)
    // 点击按钮判断账户密码
    $(".login_btn").click(function () {
        var username = $("#cms_login_username").val();
        var password = $("#cms_login_passward").val();
        var ver = $("#cms_login_ver_ipt").val();
        // console.log(typeof username)
        // console.log(ver)
        // 判断用户账户是不是能够转换成number类型，能，是false，不是true
        if (!isNaN(username) && username == "123456") {
            // alert("用户账户长度" + username.length)
            // 判断用户密码是不是能够转换成number类型，能，是false，不是true
            if (!isNaN(password) && password == "654321") {
                console.log("用户密码长度" + password.length)
                // 判断用户输入得验证码
                var n = $(".cms_login_ver").text()
                // console.log(ver)
                if (n == ver) {
                    alert("用户登录成功，等待跳转")
                } else {
                    alert("用户验证码输入错误")
                }
            } else {
                alert("用户密码输入错误")
            }
        } else {
            alert("用户账号输入错误")
        }
        console.log(username)
    })
</script>--%>
<script type="text/javascript">
    $(function () {
        function getRandom(min, max) {
            return Math.round(Math.random() * (max - min) + min)
        }

        function getCode() {
            var code = '';
            for (var i = 0; i < 6; i++) {
                var type = getRandom(1, 3);
                switch (type) {
                    case 1:
                        code += String.fromCharCode(getRandom(48, 57))  //数字
                        break;
                    case 2:
                        code += String.fromCharCode(getRandom(65, 90))  //大写
                        break;
                    case 3:
                        code += String.fromCharCode(getRandom(97, 122))  //小写
                        break;
                }
            }
            return code;
        }

        var m = getCode();
        var n = $(".cms_login_ver").text(m);
        var n = $(".cms_login_ver").text();

        $(".login_btn").click(function () {
            var name = $("#cms_login_username").val();
            var password = $("#cms_login_passward").val();
            var ver = $("#cms_login_ver_ipt").val();
            if (n == ver) {
                alert("验证码正确");
            } else {
                alert("验证码错误")
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/test/doLogin",
                data: {"name": name, "password": password},
                type: "post",
                dataType: "json",
                success: function (date) {
                    if ("success" == date.result) {
                        alert("登录成功")
                        window.location.href = "${pageContext.request.contextPath}/test/hello";
                    } else {
                        alert("登录失败")
                    }
                }
            })
        })
        $(".login_btn1").click(function () {
            window.location.href = "${pageContext.request.contextPath}/test/register";
        })
    })
</script>
<html>
<head>
    <title>index</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="cms_login" style="background-image: url(${pageContext.request.contextPath}/img/3.jpg)">
    <div class="cms_login_container flexCenter" style="min-height:390px;">
        <div class="cms_login_image" style="min-width: 380px;">
            <!-- <img src="./leftimg_04.png" alt=""> -->
        </div>
        <div class="cms_login_from" style="min-width: 380px;">
            <form>
                <div class="cms_login_logo">
                    <span style="font-size:24px;">沐槿汐个人后台登录管理</span>
                </div>
                <div class="divBox">
                    <img class="cms_login_img" src="${pageContext.request.contextPath}/img/username_mark.png">
                    <input class="cms_login_ipt" type="text" placeholder="请输入账号" id="cms_login_username">
                </div>
                <div class="divBox"><img class="cms_login_img"
                                         src="${pageContext.request.contextPath}/img/password_mark.png">
                    <input type="password" placeholder="请输入密码" class="cms_login_ipt" id="cms_login_passward">
                </div>
                <div class="divBox"><img class="cms_login_img"
                                         src="${pageContext.request.contextPath}/img/verify_mark.png">
                    <input type="text" placeholder="请输入验证码" class="cms_login_ipt60" id="cms_login_ver_ipt">
                    <span class="cms_login_ver" value="6666" id="cms_login_ver">6666</span>
                </div>
                <div class="divBox margin_top60" style="border:none;">
                    <input class="login_btn" type="button" value="登录" name="submit">
                </div>
                <div class="divBox margin_top60" style="border:none;">
                    <input class="login_btn1" type="button" value="注册" name="submit">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
