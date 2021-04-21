package com.zyy;


import com.zyy.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "userUpdateServlet", urlPatterns = "/userUpdateServlet")
public class userUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String userpassword = request.getParameter("userpassword");
        Connection conn = null;
        try {
            conn = DBUtil.getConnection();
            if(conn != null) {
                String sql = "update pet_user set userpassword=? where username=?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(2, username);
                ps.setString(1, userpassword);
                ps.executeUpdate();
                ps.close();
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("index.jsp");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}