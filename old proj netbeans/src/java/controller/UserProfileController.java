package controller;

/**
 *
 * @author Qianpin
 * 
 */
import java.util.*;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.*;
import entity.*;
import static java.lang.Math.random;
import static java.lang.StrictMath.random;
import static java.lang.System.out;
import java.math.BigInteger;
import java.security.SecureRandom;


@WebServlet("/user-profile")
public class UserProfileController extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

          request.getRequestDispatcher("user-profile.jsp").forward(request, response);
    }
    
}
