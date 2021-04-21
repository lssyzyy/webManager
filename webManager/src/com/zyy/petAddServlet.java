package com.zyy;

import com.zyy.Dao.PetDao;
import com.zyy.Dao.UserDao;
import com.zyy.bean.BeanPet;
import com.zyy.bean.BeanUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "petAddServlet", urlPatterns = "/petAddServlet")
public class petAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String pettitle=request.getParameter("add_title");
        String pettopic=request.getParameter("add_topic");
        String petprice=request.getParameter("add_price");
        String petcontent=request.getParameter("add_content");
        String petyimiao=request.getParameter("add_yimiao");
        BeanPet pet=new BeanPet();
        pet.setPettitle(pettitle);
        pet.setPettopic(pettopic);
        pet.setPetprice(petprice);
        pet.setPetcontent(petcontent);
        pet.setPetyimiao(petyimiao);
        addPet(pet);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private boolean addPet(BeanPet pet){
        PetDao dao=new PetDao();
        return dao.addPetsInfo(pet);
    }
}

