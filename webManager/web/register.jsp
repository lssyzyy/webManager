<%--
  Created by IntelliJ IDEA.
  User: MACHENIKE
  Date: 2021/4/19
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <LINK rel="Bookmark" href="/favicon.ico" >
    <LINK rel="Shortcut Icon" href="/favicon.ico" />
    <link href="package/css/H-ui.css" rel="stylesheet" type="text/css" />
    <link href="package/css/H-ui.login.css" rel="stylesheet" type="text/css" />
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    function check() {
        var userName = document.forms[0].username.value;//获取用户名所填的内容
        var password = document.forms[0].password.value;//获取所填的密码
        var againpassword = document.forms[0].password2.value;

        if (userName == "") {
            alert("错误提示：用户名不能为空！");
            return false;
        }
        if (password == "") {
            alert("错误提示：密码不能为空！");
            return false;
        }
        if (againpassword == "") {
            alert("错误提示：密码不能为空！");
            return false;
        }
    }
</script>
<div class="loginWraper">
    <h1 align="center" >后台注册</h1>
    <div id="loginform" class="loginBox">
        <form onsubmit="return check()" action="${pageContext.request.contextPath}/RegisterServlet" method="post">
            <div class="formRow user">
                <div>${b_error}</div>
                <input id="username" name="username" type="text" placeholder="账户" class="input_text input-big" autocomplete="off">
            </div>
            <div class="formRow password">
                <input id="password" name="password" type="password" placeholder="密码" class="input_text input-big">
            </div>
            <div class="formRow password">
                <input id="password2" name="password2" type="password" placeholder="确认密码" class="input_text input-big">
            </div>
            <div class="formRow">
                <input  type="submit" class="btn radius btn-success btn-big" value="&nbsp;提&nbsp;&nbsp;&nbsp;&nbsp;交&nbsp;">
            </div>
        </form>
    </div>
</div>
<div class="footer">后台管理系统</div>
<script type="text/javascript" src="package/js/jquery.min.js"></script>
<script type="text/javascript" src="package/js/H-ui.js"></script>

</body>
</html>