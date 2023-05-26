package com.kh.breaktime.detail1.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/detail1")
public class DetailController_1 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 여기에 필요한 작업을 수행한 후, detail1.jsp로 이동합니다.
        request.getRequestDispatcher("/WEB-INF/views/detail1/detail1.jsp").forward(request, response);
    }
}
