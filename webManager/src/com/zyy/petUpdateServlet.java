package com.zyy;


import com.zyy.Dao.PetDao;
import com.zyy.bean.BeanPet;
import com.zyy.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "petUpdateServlet", urlPatterns = "/petUpdateServlet")
public class petUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String petid=request.getParameter("id");
        String petimg=request.getParameter("update_img");
        String pettitle=request.getParameter("update_title");
        String pettopic=request.getParameter("update_topic");
        String petprice=request.getParameter("update_price");
        String petcontent=request.getParameter("update_content");
        String petyimiao=request.getParameter("update_yimiao");
        BeanPet pet=new BeanPet();
        pet.setPetid(Integer.parseInt(petid));
        pet.setPetimg(petimg);
        pet.setPettitle(pettitle);
        pet.setPettopic(pettopic);
        pet.setPetprice(petprice);
        pet.setPetcontent(petcontent);
        pet.setPetyimiao(petyimiao);
        updatePet(pet);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private boolean updatePet(BeanPet pet){
        PetDao dao=new PetDao();
        return dao.updatePets(pet);
    }
}