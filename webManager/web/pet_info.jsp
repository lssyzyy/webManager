<%@ page import="java.sql.Connection" %>
<%@ page import="com.zyy.util.DBUtil" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: MACHENIKE
  Date: 2021/4/7
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
    <link type="text/css" rel="stylesheet" href="package/css/H-ui.css" />
    <title>Title</title>
</head>
<body>

<%
    Connection conn = DBUtil.getConnection();
    String sql="select * from pet_info";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(sql);
%>
<table border="1">
    <tr class="tr-head">
        <td class="td-head">宠物编号</td>
        <td class="td-head">宠物图片</td>
        <td class="td-head">宠物标题</td>
        <td class="td-head">宠物价格</td>
        <td class="td-head">宠物种类</td>
        <td class="td-head">宠物领养内容</td>
        <td class="td-head">宠物是否疫苗</td>
        <td class="td-head">管理</td>
        <td class="td-head">
            <a href="pet_add_info.jsp">添加宠物信息</a>
        </td>
    </tr>
    <% while(rs.next()){ %>
    <tr class="tr-content">
        <td class="td-content"><% out.print(rs.getString(1)); %></td>
        <td class="td-content"><% if(rs.getString(2)==null){out.print("暂无");}else{out.print(rs.getString(2));} %></td>
        <td class="td-content"><% out.print(rs.getString(3)); %></td>
        <td class="td-content"><% out.print(rs.getString(4)); %></td>
        <td class="td-content"><% out.print(rs.getString(5)); %></td>
        <td class="td-content"><% out.print(rs.getString(6)); %></td>
        <td class="td-content"><% out.print(rs.getString(7)); %></td>
        <td class="td-content"><a href="pet_update_info.jsp?id=<%=rs.getString(1)%>&img=<%=rs.getString(2)%>&title=<%=rs.getString(3)%>&price=<%=rs.getString(4)%>&topic=<%=rs.getString(5)%>&content=<%=rs.getString(6)%>">修改</a></td>
        <td class="td-content"><input class="del" type="button" value="删除" onclick="petdelete(<%=rs.getString(1)%>)"></td>
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
<script>
    function petdelete(id) {
        var r = confirm("确定要删除该宠物记录吗？")
        if (r == true) {
            window.location.href="${pageContext.request.contextPath}/petDeleteServlet?id="+id+""
            alert("删除成功！")
        } else {
            alert("删除失败！")
        }
    }
</script>
