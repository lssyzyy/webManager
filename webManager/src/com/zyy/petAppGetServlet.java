package com.zyy;

import com.zyy.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/PetServletForGETMethod")
public class petAppGetServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public petAppGetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String title=new String(request.getParameter("pettitle").getBytes("ISO8859-1"),"utf-8");
        String name=new String(request.getParameter("pettopic").getBytes("ISO8859-1"),"utf-8");
        String money=new String(request.getParameter("petprice").getBytes("ISO8859-1"),"utf-8");
        String content=new String(request.getParameter("petcontent").getBytes("ISO8859-1"),"utf-8");
        String yimiao=new String(request.getParameter("petyimiao").getBytes("ISO8859-1"),"utf-8");
        System.out.println("添加宠物成功！"+"    标题:"+title+"    种类:"+name+"    价格:"+money+"    详细内容:"+content+"    疫苗:"+yimiao);
        Connection conn = null;
        try {
            conn = DBUtil.getConnection();
            String sql="insert into pet_info (petimg,pettitle,pettopic,petprice,petcontent,petyimiao) values(?,?,?,?,?,?)";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1,"暂无");
            st.setString(2,title);
            st.setString(3,name);
            st.setString(4,money);
            st.setString(5,content);
            st.setString(6,yimiao);
            st.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }
}