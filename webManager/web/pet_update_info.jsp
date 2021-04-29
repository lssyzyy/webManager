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
        var title = document.forms[0].update_title.value;
        var topic = document.forms[0].update_topic.value;
        var price = document.forms[0].update_price.value;
        var content = document.forms[0].update_content.value;
        if (title == "") {
            alert("错误提示：标题不能为空！");
            return false;
        }
        if (topic == "") {
            alert("错误提示：宠物种类不能为空！");
            return false;
        }
        if (price == "") {
            alert("错误提示：价格不能为空！");
            return false;
        }
        if (content == "") {
            alert("错误提示：详细内容不能为空！");
            return false;
        }
    }
</script>
<%
    String id=(String)request.getParameter("id");
    String img=(String)request.getParameter("img");
    img=new String(img.getBytes("ISO-8859-1"),"UTF-8");
    if(img==null){
        img="";
    }
    String title=(String)request.getParameter("title");
    title=new String(title.getBytes("ISO-8859-1"),"UTF-8");
    if(title==null){
        title="";
    }
    String topic=(String)request.getParameter("topic");
    topic=new String(topic.getBytes("ISO-8859-1"),"UTF-8");
    if(topic==null){
        topic="";
    }
    String price=(String)request.getParameter("price");
    if(price==null){
        price="";
    }
    String content=(String)request.getParameter("content");
    content=new String(content.getBytes("ISO-8859-1"),"UTF-8");
    if(content==null){
        content="";
    }
%>
<div class="pd-20">
    <div class="Huiform">
        <form action="${pageContext.request.contextPath}/petUpdateServlet" method="post" onsubmit="return check()" target="_parent">
            <input type="hidden" name="id" id="id" value="<%=id%>">
            <table class="table table-bg">
                <tbody>
                    <tr>
                        <th width="100" class="text-r"><span class="c-red">*</span> 宠物图片：</th>
                        <td><input type="text" style="width:300px" value="<%=img%>" class="input-text" id="update_img" name="update_img" ></td>
                    </tr>
                    <tr>
                        <th width="100" class="text-r"><span class="c-red">*</span> 宠物标题：</th>
                        <td><input type="text" style="width:300px" value="<%=title%>" class="input-text" id="update_title" name="update_title" ></td>
                    </tr>
                    <tr>
                        <th width="100" class="text-r"><span class="c-red">*</span> 宠物种类：</th>
                        <td><input type="text" style="width:300px" value="<%=topic%>" class="input-text"  id="update_topic" name="update_topic"></td>
                    </tr>
                    <tr>
                        <th width="100" class="text-r"><span class="c-red">*</span> 宠物价格：</th>
                        <td><input type="number" style="width:300px" value="<%=price%>" class="input-text"  id="update_price" name="update_price"></td>
                    </tr>
                    <tr>
                        <th width="100" class="text-r"><span class="c-red">*</span> 宠物详细内容：</th>
                        <td><input type="text" style="width:300px" value="<%=content%>" class="input-text"  id="update_content" name="update_content"></td>
                    </tr>
                    <tr>
                        <th width="100" class="text-r"><span class="c-red">*</span> 是否疫苗：</th>
                        <td>
                            <select class="select" id="update_yimiao" name="update_yimiao">
                                <option value="是">是</option>
                                <option value="否">否</option>
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
