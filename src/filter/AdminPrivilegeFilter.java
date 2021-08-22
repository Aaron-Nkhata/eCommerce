package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.User;

public class AdminPrivilegeFilter implements Filter{
public void init(FilterConfig filterConfig) throws ServletException {
		
	}
	
	public void doFilter(ServletRequest req, ServletResponse resp,FilterChain chain) throws IOException, ServletException {
		//
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		// 2
		User user = (User) request.getSession().getAttribute("user");
		if (user != null && "Administrator".equals(user.getRole())) {
			// 3.pass 
			chain.doFilter(request, response);
			return;
		}
		
		//response.sendRedirect(request.getContextPath() + "/error/privilege.jsp");
		//response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
	
	public void destroy() {
		
	}

}
