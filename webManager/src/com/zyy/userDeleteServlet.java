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

@WebServlet(name = "userDeleteServlet", urlPatterns = "/userDeleteServlet")
public class userDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Connection conn = null;
        try {
            conn = DBUtil.getConnection();
            if(conn != null){
                String sql = "delete from pet_user where userid=?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1,id);
                ps.executeUpdate();
                ps.close();
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("index.jsp");
    }
}
