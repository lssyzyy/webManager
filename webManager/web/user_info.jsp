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
    <title>Title</title>
</head>
<body>

<%
        Connection conn = DBUtil.getConnection();
        String sql="select * from pet_user";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);
%>
<% while(rs.next()){ %>
id:<% out.print(rs.getString(1)); %>
username:<% out.print(rs.getString(2)); %>
password:<% out.print(rs.getString(3)); %><br>
<% } %>
</body>
</html>
