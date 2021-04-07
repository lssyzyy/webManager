package com.zyy;

import com.zyy.bean.BeanUser;
import com.zyy.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/ServletForGETMethod")
public class servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String name=new String(request.getParameter("name").getBytes("ISO8859-1"),"utf-8");
        String pwd=request.getParameter("pwd");
        System.out.println("注册成功！"+"    用户名:"+name+"    密码:"+pwd);
        Connection conn = null;
        try {
            conn = DBUtil.getConnection();
            String sql="insert into pet_user (username,userpassword) values(?,?)";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1,name);
            st.setString(2,pwd);
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