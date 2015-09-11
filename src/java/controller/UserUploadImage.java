/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Qianpin
 */
@WebServlet("/uploadPP")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class UserUploadImage extends HttpServlet {
    // database connection settings

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        InputStream inputStream = null; // input stream of the upload file
        UserDAO userdao = new UserDAO();
        Part something = request.getPart("profilePicture");
        int userid = Integer.parseInt(request.getParameter("userid"));
        userdao.changeProfilePicure(something, userid);

        response.sendRedirect("user-edit.jsp");
    }
}
