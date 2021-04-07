<%@ page import="java.sql.Connection" %>
<%@ page import="com.zyy.util.DBUtil" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: MACHENIKE
  Date: 2021/4/5
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
  <head>
    <script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
    <title>title</title>
  </head>
  <body>

  <div class="wrapper">
    <!-- 侧边栏 -->
    <nav id="nav">
      <header>
        后台管理系统
      </header>
      <!-- 菜单 -->
      <ul class="nav-menu">
        <li class="current" data-id="userinfo">
          <div class="nav-menu-item">
            <i class="icon"></i>
              <span class="title">用户信息</span><!--/userinfo-->
            <i class="icon"></i>
          </div>
        </li>
        <li data-id="petinfo">
          <div class="nav-menu-item">
            <i class="icon"></i>
              <span class="title">宠物信息</span><!--/petinfo-->
            <i class="icon"></i>
          </div>
        </li>
        <li data-id="otherinfo">
          <div class="nav-menu-item">
            <i class="icon"></i>
              <span class="title">菜单3</span>
            <i class="icon"></i>
          </div>
        </li>
      </ul>
    </nav>

    <main>
      <header>
        信息显示
      </header>
      <section>
        <div id="content"></div>
      </section>
    </main>
  </div>
  </body>
</html>
<style type="text/css">
  * {
    margin: 0;
    padding: 0;
  }
  html, body {
    width: 100%;
    height: 100%;
  }
  button{
    background-color: transparent;
    border: 0;
    outline: none;
  }
  /* 滚动条 */
  .wrapper {
    height: 100%;
    display: flex;
  }
  /* 头部 */
  header {
    text-align: center;
    border-bottom: 0.8px solid black;
    height: 40px;
    line-height: 40px;
    background-color: orange;
  }

  /* 左侧边菜单 */
  nav {
    width: 200px;
    min-width: 200px;
    border: 0.8px solid black;
    background-color: #1D1E23;
    display: flex;
    flex-direction: column;
  }
  nav > ul {
    overflow: auto;
    flex: 1;
  }

  /* 菜单项 */
  .nav-menu > li{
    text-align: center;
  }
  .nav-menu > li > .nav-menu-item ,
  .nav-menu > li > form >.nav-menu-item {
    padding: 14px 20px;
    cursor: pointer;
  }
  /* 鼠标悬停 菜单项样式 */
  .nav-menu > li > .nav-menu-item:hover,
  .nav-menu > li > form >.nav-menu-item:hover {
    background-color: #101117;
    color: white;
  }

  .nav-menu-item > .title {
    display: inline-block;
    width: 70px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    color: #BCBCBD;
  }
  .nav-menu-item > .icon{
    display: inline-block;
    width: 30px;
    height: 30px;
    line-height: 30px;
    text-align: center;
    vertical-align: bottom;
    color: #BCBCBD;
    fill: #BCBCBD;
  }

  /* 鼠标悬停 菜单项图标样式 */
  .nav-menu-item:hover > .title{
    color: white;
    fill: white;
  }

  /* 主体 */
  main {
    border: 0.8px solid black;
    flex: 1;
    display: flex;
    flex-direction: column;
  }

  /* 内容 */
  section {
    flex: 1;
    overflow: auto;
    text-align: center;
  }

</style>
<script>
  $(function() {
    $(".nav-menu").on("click", "li", function() {
      var sId = $(this).data("id"); //获取data-id的值
      window.location.hash = sId; //设置锚点
      loadInner(sId);
    });

    function loadInner(sId) {
      var sId = window.location.hash;
      var pathn, i;
      switch(sId) {
        case "#userinfo":
          pathn = "user_info.jsp";
          i = 0;
          break;
        case "#petinfo":
          pathn = "pet_info.jsp";
          i = 1;
          break;
        case "#otherinfo":
          pathn = "other_info.jsp";
          i = 2;
          break;
        default:
          pathn = "user_info.jsp";
          i = 0;
          break;
      }
      $("#content").load(pathn); //加载相对应的内容
      $(".nav-menu li").eq(i).addClass("current").siblings().removeClass("current"); //当前列表高亮
    }
    var sId = window.location.hash;
    loadInner(sId);
  });
</script>