package com.zyy;


import com.zyy.Dao.PetDao;
import com.zyy.Dao.UserDao;
import com.zyy.bean.BeanPet;
import com.zyy.bean.BeanUser;
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
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String uerid = request.getParameter("id");
        String username = request.getParameter("update_name");
        String userpassword = request.getParameter("update_pwd");
        String userstatus = request.getParameter("update_status");
        BeanUser user=new BeanUser();
        user.setUserid(Integer.parseInt(uerid));
        user.setUsername(username);
        user.setUserpwd(userpassword);
        user.setStatus(userstatus);
        updateUser(user);
        response.sendRedirect("index.jsp");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private boolean updateUser(BeanUser user){
        UserDao dao=new UserDao();
        return dao.updateUsers(user);
    }
}