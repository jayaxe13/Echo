package controller;

/**
 *
 * @author Daniel To input form data on contact-us.jsp into database
 * tbl_contact_us
 */
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.*;
import entity.*;

@WebServlet("/login")
public class UserVerificationController extends HttpServlet {

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
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String returnMsg = "";
        int userid = 0;

        UserDAO dao = new UserDAO();
        User user = null;

        if (email != null && password != null) {
            user = dao.getUser(email);
            if (user != null) {
                String userPassword = user.getPassword();
                if (userPassword.equals(password)) {
                    userid = user.getUserId();
                    returnMsg = "Welcome, ";
                    session.setAttribute("userid", userid); //sets session to follow login user, whether he's an admin or not
                } else {
                    returnMsg = "Invalid email/password";
                }
            } else {
                returnMsg = "Invalid email/password";
            }
        } else {
            returnMsg = "Please fill in all fields";
        }
        
        session.setAttribute("returnMsg", returnMsg);
        response.sendRedirect("home.jsp");
        

    }
}
