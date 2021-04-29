<%--
  Created by IntelliJ IDEA.
  User: MACHENIKE
  Date: 2021/4/23
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="package/js/H-ui.admin.js"></script>
    <link type="text/css" rel="stylesheet" href="package/css/H-ui.css" />
    <title>更新宠物</title>
</head>
<body>
<script type="text/javascript">
    function check() {
        var name = document.forms[0].update_topic.value;
        var pwd = document.forms[0].update_price.value;
        if (name == "") {
            alert("错误提示：用户名不能为空！");
            return false;
        }
        if (pwd == "") {
            alert("错误提示：密码不能为空！");
            return false;
        }
    }
</script>
<%
    String id=(String)request.getParameter("id");

    String name=(String)request.getParameter("name");
    name=new String(name.getBytes("ISO-8859-1"),"UTF-8");

    String pwd=(String)request.getParameter("pwd");
    pwd=new String(pwd.getBytes("ISO-8859-1"),"UTF-8");

%>
<div class="pd-20">
    <div class="Huiform">
        <form action="${pageContext.request.contextPath}/userUpdateServlet" method="post" onsubmit="return check()" target="_parent">
            <input type="hidden" name="id" id="id" value="<%=id%>">
            <table class="table table-bg">
                <tbody>
                    <tr>
                        <th width="100" class="text-r"><span class="c-red">*</span> 用户名：</th>
                        <td><input type="text" style="width:300px" value="<%=name%>" class="input-text" id="update_name" name="update_name" ></td>
                    </tr>
                    <tr>
                        <th width="100" class="text-r"><span class="c-red">*</span> 用户密码：</th>
                        <td><input type="text" style="width:300px" value="<%=pwd%>" class="input-text" id="update_pwd" name="update_pwd" ></td>
                    </tr>
                    <tr>
                        <th width="100" class="text-r"><span class="c-red">*</span> 用户性质：</th>
                        <td>
                            <select class="select" id="update_status" name="update_status">
                                <option value="普通用户">普通用户</option>
                                <option value="信息管理员">信息管理员</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><button class="btn btn-success radius" type="submit" >确定</button></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>
</body>
</html>
