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
    <script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="package/js/H-ui.admin.js"></script>
    <link type="text/css" rel="stylesheet" href="package/css/H-ui.css" />
    <title>添加用户</title>
</head>
<body>
<script type="text/javascript">
    function check() {
        var title = document.forms[0].add_title.value;
        var topic = document.forms[0].add_topic.value;
        var price = document.forms[0].add_price.value;
        var content = document.forms[0].add_content.value;
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
<div class="pd-20">
    <div class="Huiform">
        <form action="${pageContext.request.contextPath}/petAddServlet" method="post" onsubmit="return check()" target="_parent">
            <table class="table table-bg">
                <tbody>
                <tr>
                    <th width="100" class="text-r"><span class="c-red">*</span> 宠物标题：</th>
                    <td><input type="text" style="width:300px" placeholder="请输入标题..." class="input-text" id="add_title" name="add_title" ></td>
                </tr>
                <tr>
                    <th width="100" class="text-r"><span class="c-red">*</span> 宠物种类：</th>
                    <td><input type="text" style="width:300px" placeholder="请输入种类..." class="input-text"  id="add_topic" name="add_topic"></td>
                </tr>
                <tr>
                    <th width="100" class="text-r"><span class="c-red">*</span> 宠物价格：</th>
                    <td><input type="text" style="width:300px" placeholder="请输入价格..." class="input-text"  id="add_price" name="add_price"></td>
                </tr>
                <tr>
                    <th width="100" class="text-r"><span class="c-red">*</span> 宠物详细内容：</th>
                    <td><input type="text" style="width:300px" placeholder="请输入详细内容..." class="input-text"  id="add_content" name="add_content"></td>
                </tr>
                <tr>
                    <th width="100" class="text-r"><span class="c-red">*</span> 是否疫苗：</th>
                    <td>
                        <select class="select" id="add_yimiao" name="add_yimiao">
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
