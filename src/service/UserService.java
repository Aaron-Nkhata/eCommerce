package service;

import java.sql.SQLException;
import java.util.Date;

import javax.security.auth.login.LoginException;

import dao.UserDao;
import domain.User;
import exception.ActiveUserException;
import exception.RegisterException;
import utils.MailUtils;

public class UserService {
	
	private UserDao dao = new UserDao();	
	// register operation
	public void register(User user) throws RegisterException {
		// call dao to do the work
		try {
		dao.addUser(user);
		// send active mail
		String emailMsg = "Thank you for registering online bookstore, Click<ahref='http://localhost:8080/bookstoreV0/activeUser?activeCode="+ user.getActiveCode() + "'>&nbsp;active?&nbsp;</a>to use it<br>To ensure the security of your account, please complete the activation operation within 24 hours.";
		
		MailUtils.sendMail(user.getEmail(), emailMsg);
		
		} catch (Exception e) {
			e.printStackTrace();
			throw new RegisterException("Registion failed!");
		}
	}	
	// active user
	public void activeUser(String activeCode) throws ActiveUserException {
	
		try {
			// Finding Users Based on Activation Codes
			User user = dao.findUserByActiveCode(activeCode);
			if (user == null) {
			throw new ActiveUserException("Activation failed");
			}
			
			// Judging whether activation code is valid
			// within 24 hours after expiration
			// 1.get the registration time
			Date registTime = user.getRegistTime();
			
			// 2.Judge whether or not the timeout is over
			long time = System.currentTimeMillis() - registTime.getTime();
			
			if (time / 1000 / 60 / 60 > 24) {
				throw new ActiveUserException("Activation code expiration");
			}
			// active user, and change state
			dao.activeUser(activeCode);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ActiveUserException("Activation failed");
		}
	}
	
	//Login operation
	public User login(String username, String password) throws LoginException {
		try {
			//Find the user based on the username and password entered in the form at login time
			
			User user = dao.findUserByUsernameAndPassword(username, password);
			//If it is found, you also need to determine whether the user is activated.
			if (user != null) {
				// Only activation user can log in successfully,
				// otherwise the prompt "user is not activated"
				if (user.getState() == 1) {
					return user;
				}
				throw new LoginException("User inactivated");
			}
			throw new LoginException("ERROR Incorrect username or password");
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new LoginException("Login failed");
		}
	}

}
