/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.annotation.WebServlet;
import java.util.*;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.*;

/**
 *
 * @author Qianpin
 */

@WebServlet("/add-review")
public class ChildcareAddReview extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doProcess(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        int userid = Integer.parseInt(request.getParameter("userid"));
        int ccid = Integer.parseInt(request.getParameter("ccid"));
        String review = request.getParameter("review");
        
        
        
        UserReviewDAO userreviewdao = new UserReviewDAO();
        userreviewdao.addReview(ccid, userid, review);
        
        String returnMsg = "Review successfully added!";
        
        session.setAttribute("addReviewMsg", returnMsg);
        response.sendRedirect("c-individual.jsp?ccid="+ccid);
    }
    
}
