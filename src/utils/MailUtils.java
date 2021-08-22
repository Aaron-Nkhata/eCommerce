package utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class MailUtils {
	
	public static void sendMail(String email, String emailMsg)throws AddressException, MessagingException {
		
		// 1.Create a program and a session object
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "SMTP");
		props.setProperty("mail.host", "smtp.sohu.com");
		props.setProperty("mail.smtp.auth", "true");// set true
		
		// create authenticator
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("itcast_duhong", "1234567890");
			}
		};
		
		Session session = Session.getInstance(props, auth);
		
		// 2.create a message, it is the content of mail 
		Message message = new MimeMessage(session);
		
		message.setFrom(new InternetAddress("jsj_wcw@mail.wzu.edu.cn"));
		//sender
		
		message.setRecipient(RecipientType.TO, new InternetAddress(email));
		// Setting the sending mode and receiver
		
		message.setSubject("User activation");
		// message.setText("This is an activation mail, please<a href='#'>click</a>");
	
		message.setContent(emailMsg, "text/html;charset=utf-8");
		
		
		// 3.create Transport to send mail
		Transport.send(message);
	}

}
