package connection;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;

public class EmailConfiguration implements Constant{

	/**
	 * Setting the Gmail SMTP for sending email
	 * @return
	 */
	public static Session settingGmail() {
		Properties properties = new Properties();
        properties.put("mail.smtp.host", HOST);
        properties.put("mail.smtp.port", PORT);
        properties.put("mail.smtp.auth", "true");
        
        properties.put("mail.smtp.starttls.enable","true");
	    properties.put("mail.smtp.debug", "true");
	    properties.put("mail.smtp.auth", "true");
	    properties.put("mail.smtp.socketFactory.port", PORT);
	    properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	    properties.put("mail.smtp.socketFactory.fallback", "false");;
 
        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USER, PASS);
            }
        };
 
        Session session = Session.getInstance(properties, auth);
		return session;
	}
}
