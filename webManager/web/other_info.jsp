<%--
  Created by IntelliJ IDEA.
  User: MACHENIKE
  Date: 2021/4/5
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.zyy.bean.BeanUser"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.zyy.util.DBUtil" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="package/css/H-ui.css" />
    <link type="text/css" rel="stylesheet" href="package/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css"
          href="http://cdn.datatables.net/1.10.13/css/jquery.dataTables.css">
    <link type="text/css" rel="stylesheet"
          href="package/font/font-awesome.min.css" />
    <title>Title</title>
</head>
<body>

<%
    Connection conn = DBUtil.getConnection();
    String sql="select * from pet_user";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(sql);
%>
<table border="1">
    <tr class="tr-head">
        <td class="td-head">用户编号</td>
        <td class="td-head">用户名</td>
        <td class="td-head">用户密码</td>
        <td class="td-head">管理</td>
        <td class="td-head">
            <div class="useradd">
                <form action="${pageContext.request.contextPath}/userAddServlet" method="post">
                    <label>
                        <span style="display:block;">用户名：<input id="userx" type="text" name="x" size="8"></span>
                        <span style="display:block;">密&nbsp;&nbsp;码：<input id="usery" type="text" name="y" size="8"></span>
                    </label>
                    <input class="uadd" type="submit" value="添加用户数据" onclick="return useradd()">
                </form>
            </div>
        </td>
    </tr>
    <% while(rs.next()){ %>
    <tr class="tr-content">
        <td class="td-content"><% out.print(rs.getString(1)); %></td>
        <td class="td-content"><% out.print(rs.getString(2)); %></td>
        <td class="td-content"><% out.print(rs.getString(3)); %></td>
        <td class="td-content">
            <form action="${pageContext.request.contextPath}/userUpdateServlet" method="post">
                <input type="hidden" name="username" value="<%=rs.getString(2)%>">
                <label>
                    密码修改：<input id="passwd" type="text" name="userpassword" size="8">
                </label>
                <input class="upd" type="submit" value="修改" onclick="return userpassw()">
            </form>
        </td>
        <td class="td-content"><input class="del" type="button" value="删除" onclick="userdelete(<%=rs.getString(1)%>)"></td>
    </tr>
    <% } %>
</table>
</body>
</html>
<style>
    table{
        height: 100px;
        width: 100%;
        margin: 0;
        padding: 0;
        text-align: center;
    }
    label{
        float: left;
        margin-left: 80px;
    }
    a{
        height: 10px;
        weight: 20px;
        color: black;
        border: 0;
        cursor: pointer;
        font-size: 14px;
    }
    span{
        padding: 3px 3px;
    }
    .uadd{
        margin-top: 15px;
        margin-left: 40px;
        float: left;
    }
    .del{
        cursor: pointer;
    }
    .upd{
        cursor: pointer;
    }
    .tr-head{
        font-weight: bold;
        background-color: #FFE0B2;
    }
    .td-head{
        padding: 15px 5px;
    }
    .tr-content{
    }
    .td-content{
        padding: 8px 8px;
    }
</style>
<script type="text/javascript">
    function userdelete(id) {
        var r = confirm("确定要删除该用户记录吗？")
        if (r == true) {
            window.location.href="${pageContext.request.contextPath}/userDeleteServlet?id="+id+""
            alert("删除成功！")
        } else {
            alert("删除失败！")
        }
    }
    function userpassw(){
        var pwd=document.getElementById('passwd').value
        if(pwd == null || pwd == undefined || pwd == ''){
            alert("密码不能为空!")
            return false
        }else {
            return true
        }
    }
    function useradd() {
        var name=document.getElementById('userx').value
        var pwd=document.getElementById('usery').value
        if(pwd == null || pwd == undefined || pwd == '' || name == null || name == undefined || name == ''){
            alert("用户名或密码不能为空!")
            return false
        }else {
            return true
        }
    }
</script>