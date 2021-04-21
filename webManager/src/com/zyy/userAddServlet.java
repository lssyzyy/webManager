package com.zyy;

import com.zyy.Dao.UserDao;
import com.zyy.bean.BeanUser;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "userAddServlet", urlPatterns = "/userAddServlet")
public class userAddServlet extends HttpServlet {

    private String action;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        if (request.getParameter("action")!=null) {
            this.action=request.getParameter("action");
            if (action.equals("addUser")) {
                String name=request.getParameter("add_name");
                String pwd=request.getParameter("add_pwd");
                String stus=request.getParameter("add_stus");
                BeanUser user=new BeanUser();
                user.setUsername(name);
                user.setUserpwd(pwd);
                user.setStatus(stus);
                boolean judge=addUser(user);
                if (judge) {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                else {
                    request.getRequestDispatcher("add_user_failure.jsp").forward(request, response);
                }
            }
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private boolean addUser(BeanUser user){
        UserDao dao=new UserDao();
        return dao.addUsersfromregister(user);
    }
    private boolean deleteUsers(int id){
        UserDao dao=new UserDao();
        return dao.delUsers(id);
    }
}

