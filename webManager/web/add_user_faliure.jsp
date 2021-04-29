<%--
  Created by IntelliJ IDEA.
  User: MACHENIKE
  Date: 2021/4/23
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加用户失败</title>
</head>
<body>
<h1>添加用户失败</h1>
<%
  String username=request.getParameter("username");
%>
    添加用户失败，该用户已存在<%=username%><br>
    <a href="index.jsp">返回</a>
</body>
</html>