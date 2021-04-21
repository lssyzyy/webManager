package com.zyy;

import com.zyy.Dao.UserDao;
import com.zyy.bean.BeanUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String username,password;
        username=request.getParameter("username");
        password=request.getParameter("password");
        BeanUser users=new BeanUser();
        users.setUsername(username);
        users.setUserpwd(password);
        if (!isQuery(users).equals("false")) {
            users.setStatus(isQuery(users));
            request.setAttribute("users", users);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        else {
            request.getRequestDispatcher("login_failure.jsp").forward(request, response);
        }
    }
    private String isQuery(BeanUser users){
        UserDao dao=new UserDao();
        List<BeanUser> list=dao.queryAll();
        for(BeanUser users2:list){
            if (users.getUsername().equals(users2.getUsername())) {
                if (users.getUserpwd().equals(users2.getUserpwd())) {
                    String status=users2.getStatus();
                    return status;
                }
            }
        }
        return "false";
    }
}
