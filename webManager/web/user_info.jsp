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
    <script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="package/js/H-ui.admin.js"></script>
    <link type="text/css" rel="stylesheet" href="package/css/H-ui.css" />
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
        <td class="td-head">用户性质</td>
        <td class="td-head">管理</td>
        <td class="td-head">
            <a href="user_add_info.jsp">添加用户数据</a>
        </td>
    </tr>
    <div id="all_light">
    </div>
    <% while(rs.next()){ %>
    <tr class="tr-content">
        <td class="td-content"><% out.print(rs.getString(1)); %></td>
        <td class="td-content"><% out.print(rs.getString(2)); %></td>
        <td class="td-content"><% out.print(rs.getString(3)); %></td>
        <td class="td-content"><% out.print(rs.getString(4)); %></td>
        <td class="td-content"><a href="user_update_info.jsp?id=<%=rs.getString(1)%>&name=<%=rs.getString(2)%>&pwd=<%=rs.getString(3)%>">修改</a></td>
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
    #all_light {
        opacity: 0.8;
        width: 100%;
        height: 100%;
        background: #000;
        position: absolute;
        top: 0;
        left: 0;
        display: none;
        z-index: 1;
    }
    #contes {
        width: 500px;
        height: 200px;
        background: #fff;
        display: none;
        z-index: 2;
        position: absolute;
    }
    input{
        margin: 10px auto;
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
            alert("修改成功!")
            return true
        }
    }
</script>