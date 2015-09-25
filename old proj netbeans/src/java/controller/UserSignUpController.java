/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static connection.Constant.USER;
import connection.EmailConfiguration;
import dao.UserDAO;
import java.io.IOException;
import static java.lang.System.out;
import java.util.ArrayList;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Toshiba PC
 */
@WebServlet("/sign-up")
public class UserSignUpController extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        String replyMessage = "Woops something went wrong!";
        HttpSession session = request.getSession();

        UserDAO dao = new UserDAO();
        ArrayList<String> existing = dao.getEmailList();

        //check if user exists first
        boolean already = true;
        for (String e : existing) {
            if (e.equals((String) request.getParameter("email"))) {
                replyMessage = "You've already registered. Please click on Forget Password if you can't remember.";
                already = false;
            }
        }

        if (already == true) {
            int row = dao.addNewUser((String) request.getParameter("firstname"), (String) request.getParameter("lastname"),
                    (String) request.getParameter("email"), (String) request.getParameter("password"),
                    Integer.parseInt((String) request.getParameter("postal")), "default.png");

            if (row > 0) {
                try {
                    sendEmail((String) request.getParameter("email"), (String) request.getParameter("firstname"), (String) request.getParameter("password"));
                } catch (Exception e) {
                    out.print("<script>alert('Fail to send email!');</script>");
                }
                replyMessage = "Congratulations on Signing Up!";
            }
        }
        session.setAttribute("signUpMessage", replyMessage); //because request will keep url as sign-up then cannot access other pages
        response.sendRedirect("home.jsp");
    }

    public void sendEmail(String email, String name, String newpw) throws Exception {
        String mailF = "<table  style=\"background-color: #f2f2f2; -webkit-font-smoothing: antialiased; -webkit-text-size-adjust: none\" width=\"870\">\n"
                + "    <tbody><tr>\n"
                + "            <td  style=\"background-color: #f2f2f2;\">\n"
                + "                <div align=\"center\">\n"
                + "                    <table cellpadding=\"0\" width=\"600\" cellspacing=\"0\" border=\"0\">\n"
                + "                        <tbody><tr>\n"
                + "                                <td align=\"center\"  style=\"background-color: #f2f2f2\">\n"
                + "                                    <!-- start header section -->\n"
                + "                                    <div class=\"header-container-wrapper\">\n"
                + "                                        <table class=\"wrappertable\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\">\n"
                + "                                            <tbody>\n"
                + "                                                <tr>\n"
                + "                                                    <td valign=\"top\" colspan=\"12\" width=\"100.0%\" class=\"\" style=\"width:100.0%; text-align: left; padding: 0; font-family: sans-serif; font-size: 15px; line-height: 1.5em; color: #444444; \">\n"
                + "                                                        <div class=\"widget-span widget-type-email_view_as_web_page \" style=\"\" data-widget-type=\"email_view_as_web_page\">\n"
                + "\n"
                + "\n"
                + "                                                        </div><!--end widget-span -->\n"
                + "                                                    </td>\n"
                + "                                                </tr>\n"
                + "                                            </tbody></table>\n"
                + "                                    </div><!--end header wrapper -->\n"
                + "                                    <!-- end header section -->\n"
                + "                                </td>\n"
                + "                            </tr>\n"
                + "                        </tbody></table>\n"
                + "                </div>\n"
                + "            </td>\n"
                + "        </tr>\n"
                + "        <tr>\n"
                + "            <td  style=\"padding: 10px 20px; background-color: #f2f2f2\">\n"
                + "                <div align=\"center\">\n"
                + "                    <table cellpadding=\"0\" width=\"600\" cellspacing=\"0\" border=\"0\">\n"
                + "                        <tbody><tr>\n"
                + "                                <td id=\"main_body\" width=\"600\" bgcolor=\"#ffffff\" style=\"padding: 30px; background-color: #ffffff; border: 1px solid #cccccc; border-bottom: 1px solid #acacac; border-radius: 4px\">\n"
                + "                                    <div align=\"center\">\n"
                + "                                        <table cellpadding=\"0\" width=\"600\" cellspacing=\"0\" border=\"0\">\n"
                + "                                            <!-- start content -->\n"
                + "                                            <tbody><tr>\n"
                + "                                                    <td style=\"padding: 0; background-color: #ffffff\">\n"
                + "                                                        <div align=\"center\">\n"
                + "                                                            <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\" style=\"font-family:sans-serif; font-size: 15px; line-height: 1.5em; color: #444444\">\n"
                + "                                                                <tbody><tr>\n"
                + "                                                                        <td>\n"
                + "                                                                            <div align=\"center\">\n"
                + "                                                                                <!-- start body section -->\n"
                + "                                                                                <div class=\"body-container-wrapper\">\n"
                + "                                                                                    <table class=\"wrappertable\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\">\n"
                + "                                                                                        <tbody>    \n"
                + "                                                                                            <tr>\n"
                + "                                                                                                <td valign=\"top\" colspan=\"12\" width=\"100.0%\" class=\"\" style=\"width:100.0%; text-align: left; padding: 0; font-family: sans-serif; font-size: 15px; line-height: 1.5em; color: #444444; \">\n"
                + "                                                                                                    <div class=\"widget-span widget-type-logo \" style=\"\" data-widget-type=\"logo\">\n"
                + "                                                                                                        <div class=\"layout-widget-wrapper\">\n"
                + "                                                                                                            <div id=\"hs_cos_wrapper_module_14321731151782375\" class=\"hs_cos_wrapper hs_cos_wrapper_widget hs_cos_wrapper_type_logo\" style=\"color: inherit; font-size: inherit; line-height: inherit; margin: inherit; padding: inherit\" data-hs-cos-general-type=\"widget\" data-hs-cos-type=\"logo\">\n"
                + "                                                                                                                <a href=\"http://testdeploy-teamechofyp.rhcloud.com\" id=\"hs-link-module_14321731151782375\" style=\"border-width:0px;border:0px;\"><img src=\"images/home/echo.png\" class=\"hs-image-widget \" style=\"max-height:111px; max-width:300px; border-width:0px;border:0px;\" width=\"300\" alt=\"Echo\" title=\"Echo\" /></a></div>\n"
                + "                                                                                                        </div><!--end layout-widget-wrapper -->\n"
                + "                                                                                                    </div><!--end widget-span -->\n"
                + "                                                                                                </td>\n"
                + "                                                                                            </tr>\n"
                + "                                                                                            <tr>\n"
                + "                                                                                                <td valign=\"top\" colspan=\"12\" width=\"100.0%\" class=\"\" style=\"width:100.0%; text-align: left; padding: 0; font-family: sans-serif; font-size: 15px; line-height: 1.5em; color: #444444; \">\n"
                + "                                                                                                    <div class=\"widget-span widget-type-email_body \" style=\"\" data-widget-type=\"email_body\">\n"
                + "\n"
                + "                                                                                                        <div id=\"hs_cos_wrapper_hs_email_body\" class=\"hs_cos_wrapper hs_cos_wrapper_widget hs_cos_wrapper_type_rich_text\" style=\"color: inherit; font-size: inherit; line-height: inherit; margin: inherit; padding: inherit\" data-hs-cos-general-type=\"widget\" data-hs-cos-type=\"rich_text\"><p style=\"margin-bottom: 1em; \">Hi, NAMENAMENAME</p>\n"
                + "                                                                                                            <p style=\"margin-bottom: 1em; text-align: left;\">Welcome onboard Echo!<br>Thank you for signing up with us!<br>You may now sign in <a href=\"http://testdeploy-teamechofyp.rhcloud.com\">HERE</a> to experience ECHO<br></p>\n"
                + "                                                                                                            </p>\n"
                + "                                                                                                            <p style=\"margin-bottom: 1em; \">&nbsp;</p>\n"
                + "                                                                                                            <p style=\"margin-bottom: 1em; \">Sincerely,</p>\n"
                + "                                                                                                            <p style=\"margin-bottom: 1em; \">Echo</p></div>\n"
                + "\n"
                + "\n"
                + "                                                                                                    </div><!--end widget-span -->\n"
                + "                                                                                                </td>\n"
                + "                                                                                            </tr>\n"
                + "                                                                                            <tr>\n"
                + "                                                                                                <td valign=\"top\" colspan=\"12\" width=\"100.0%\" class=\"\" style=\"width:100.0%; text-align: left; padding: 0; font-family: sans-serif; font-size: 15px; line-height: 1.5em; color: #444444; \">\n"
                + "                                                                                                    <div class=\"widget-span widget-type-social_sharing \" style=\"\" data-widget-type=\"social_sharing\">\n"
                + "                                                                                                        <div class=\"layout-widget-wrapper\">\n"
                + "                                                                                                            <div id=\"hs_cos_wrapper_module_14321731711833436\" class=\"hs_cos_wrapper hs_cos_wrapper_widget hs_cos_wrapper_type_social_sharing\" style=\"color: inherit; font-size: inherit; line-height: inherit; margin: inherit; padding: inherit\" data-hs-cos-general-type=\"widget\" data-hs-cos-type=\"social_sharing\">\n"
                + "                                                                                                                <a href=\"http://facebook.com\" target=\"_blank\" style=\"width:24px;border-width:0px;border:0px;\"><img src=\"https://static.hubspot.com/final/img/common/icons/social/facebook-24x24.png?width=24\" class=\"hs-image-widget hs-image-social-sharing-24\" style=\"max-height:24px;max-width:24px;border-width:0px;border:0px;\" width=\"24\" hspace=\"0\" alt=\"Share on Facebook\" /></a>&nbsp;\n"
                + "                                                                                                        </div><!--end layout-widget-wrapper -->\n"
                + "                                                                                                    </div><!--end widget-span -->\n"
                + "                                                                                                </td>\n"
                + "                                                                                            </tr>\n"
                + "                                                                                        </tbody></table>\n"
                + "                                                                                </div><!--end body wrapper -->\n"
                + "                                                                                <!-- end body section -->\n"
                + "                                                                            </div>\n"
                + "                                                                        </td>\n"
                + "                                                                    </tr>\n"
                + "                                                                </tbody></table>\n"
                + "                                                        </div>\n"
                + "                                                    </td>\n"
                + "                                                </tr>\n"
                + "                                                <!-- end content -->\n"
                + "                                            </tbody></table>\n"
                + "                                    </div>\n"
                + "                                </td>\n"
                + "                            </tr>\n"
                + "                        </tbody></table>\n"
                + "                </div>\n"
                + "            </td>\n"
                + "        </tr>\n"
                + "        <tr>\n"
                + "            <td  style=\"background-color: #f2f2f2;padding: 13px 30px\">\n"
                + "                <div align=\"center\">\n"
                + "                    <table cellpadding=\"0\" width=\"600\" cellspacing=\"0\" border=\"0\">\n"
                + "                        <tbody><tr>\n"
                + "                                <td align=\"center\"  style=\"background-color: #f2f2f2\">\n"
                + "                                    <!-- start footer section -->\n"
                + "                                    <div class=\"footer-container-wrapper\">\n"
                + "                                        <table class=\"wrappertable\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"600\">\n"
                + "                                            <tbody>\n"
                + "                                                <tr>\n"
                + "                                                    <td valign=\"top\" colspan=\"12\" width=\"100.0%\" class=\"\" style=\"width:100.0%; text-align: left; padding: 0; font-family: sans-serif; font-size: 15px; line-height: 1.5em; color: #444444; \">\n"
                + "                                                        <div class=\"widget-span widget-type-email_can_spam \" style=\"\" data-widget-type=\"email_can_spam\">\n"
                + "                                                            <p id=\"footer\" style=\"margin-bottom: 1em; font-family: Geneva, Verdana, Arial, Helvetica, sans-serif; text-align: center; font-size: 12px; line-height: 1.34em; color: #999999; display: block\">\n"
                + "                                                                ECHO,\n"
                + "                                                                ECHOECHOECHO,No.8,\n"
                + "                                                                ECHO SPORE,\n"
                + "                                                                ECHO District,\n"
                + "                                                                SINGAPORE\n"
                + "                                                                210000 \n"
                + "                                                                SINGAPORE\n"
                + "                                                                <br /><br />\n"
                + "                                                                You received this email because you are subscribed to Echo Marketing.\n"
                + "                                                                <br /><br />\n"
                + "                                                                Update your <a class=\"hubspot-mergetag\" data-unsubscribe=\"true\" href=\n"
                + "                                                                               \"http://facebook.com\" style=\"text-decoration: underline; whitespace: nowrap; color: #999999;\">email preferences</a> to choose the types of emails you receive.\n"
                + "                                                                <br /><br />\n"
                + "                                                                &nbsp;<a class=\"hubspot-mergetag\" data-unsubscribe=\"true\" href=\"http://facebook.com\" style=\"text-decoration: underline; whitespace: nowrap; color: #999999;\">Unsubscribe from all future emails</a>&nbsp;\n"
                + "                                                            </p>\n"
                + "\n"
                + "                                                        </div><!--end widget-span -->\n"
                + "                                                    </td>\n"
                + "                                                </tr>\n"
                + "                                            </tbody></table>\n"
                + "                                    </div><!--end footer wrapper -->\n"
                + "                                    <!-- end footer section -->\n"
                + "                                </td>\n"
                + "                            </tr>\n"
                + "                            <tr>\n"
                + "                                <td></td>\n"
                + "                            </tr>\n"
                + "                        </tbody>\n"
                + "                    </table>\n"
                + "                </div>\n"
                + "            </td>\n"
                + "        </tr>\n"
                + "    </tbody>\n"
                + "</table>";

        sendEmailViaGmail(email, mailF.replaceFirst("NAMENAMENAME", name));
		//	return test;

        // this.mailSender.send(msg);
    }

    /**
     * Create setting for sending email through email Send email via gmail
     *
     * @param email
     * @param mailBody
     */
    private void sendEmailViaGmail(final String email, String mailBody) throws Exception {
        // sets SMTP server properties
        Session session = EmailConfiguration.settingGmail();

        // creates a new e-mail message
        Message msg = new MimeMessage(session);

        //try {
        msg.setFrom(new InternetAddress(USER));
        InternetAddress[] toAddresses = {new InternetAddress(email)};
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject("Echo: Welcome Onboard!");
        msg.setSentDate(new java.util.Date());
        msg.setContent(mailBody, "text/html; charset=utf-8");

        // sends the e-mail
        Transport.send(msg);
        //      return "SUCCESS";

    }

}
