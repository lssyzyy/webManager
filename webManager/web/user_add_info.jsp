<%--
  Created by IntelliJ IDEA.
  User: MACHENIKE
  Date: 2021/4/21
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加车站</title>
</head>
<body>
<script type="text/javascript">
    function check() {
        var name = document.forms[0].add_name.value;
        var pwd = document.forms[0].add_pwd.value;
        var stus = document.forms[0].add_stus.value;
        if (name == "") {
            alert("错误提示：用户名不能为空！");
            return false;
        }
        if (pwd == "") {
            alert("错误提示：密码不能为空！");
            return false;
        }
        if (stus == "") {
            alert("错误提示：用户性质不能为空！");
            return false;
        }
    }
</script>
<div class="pd-20">
    <div class="Huiform">
        <form action="${pageContext.request.contextPath}/userAddServlet?action=addUser" method="post" onsubmit="return check()" target="_parent">
            <table class="table table-bg">
                <tbody>
                <tr>
                    <th width="100" class="text-r"><span class="c-red">*</span> 用户名：</th>
                    <td><input type="text" style="width:300px" placeholder="请输入用户名..." class="input-text" id="add_name" name="add_name" ></td>
                </tr>
                <tr>
                    <th width="100" class="text-r"><span class="c-red">*</span> 密码：</th>
                    <td><input type="text" style="width:300px" class="input-text"  id="add_pwd" name="add_pwd"></td>
                </tr>
                <tr>
                    <th width="100" class="text-r"><span class="c-red">*</span> 用户性质：</th>
                    <td><input type="text" style="width:300px" class="input-text"  id="add_stus" name="add_stus"></td>
                </tr>
                <tr>
                    <td><button class="btn btn-success radius" type="submit" >确定</button></td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>
<script type="text/javascript" src="package/js/jquery.min.js"></script>
<script type="text/javascript" src="package/layer/layer.min.js"></script>
</body>
</html>
