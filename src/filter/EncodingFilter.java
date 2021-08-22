package filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import filter.EncodingFilter.MyRequest;

public class EncodingFilter implements Filter{
	public void init(FilterConfig filterConfig)throws ServletException {
		// TODO Auto-generated method stub
		Filter.super.init(filterConfig);
	}
	
	@Override
	public void doFilter(ServletRequest request,ServletResponse response, FilterChain chain)throws IOException, ServletException {
		// process messy code of request
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletRequest myRequest = new MyRequest(httpServletRequest);
		
		// process messy code of response
		response.setContentType("text/html;charset=utf-8");
		
		chain.doFilter(myRequest, response);
		
	}
	
	class MyRequest extends HttpServletRequestWrapper {
		
		private HttpServletRequest request;
		
		private boolean hasEncode;
		
		public MyRequest(HttpServletRequest request) {
			super(request);
			this.request = request;
		}
	
		// override the method
		@Override
		public Map<String, String[]> getParameterMap() {
			// get the way of request
			String method = request.getMethod();
			if (method.equalsIgnoreCase("post")) {
			// post request
				try {
					// process messy code of post
					request.setCharacterEncoding("utf-8");
					return request.getParameterMap();
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			
			} else if (method.equalsIgnoreCase("get")) {
				// get request
				Map<String, String[]> parameterMap = request.getParameterMap();
				
				if (!hasEncode) { // confirm run only once
					for (String parameterName : parameterMap.keySet()) {
						String[] values = parameterMap.get(parameterName);
						if (values != null) {
							for (int i = 0; i < values.length; i++) {
								try {
									// process messy code of get
									values[i] = new String(values[i].getBytes("ISO-8859-1"), "utf-8");
									} catch (UnsupportedEncodingException e) {
										e.printStackTrace();
								}
							}
						}
					}
				
					hasEncode = true;
			
				}
			
				return parameterMap;
			}
		
			return super.getParameterMap();
		}
		
		@Override
		public String getParameter(String name) {
		Map<String, String[]> parameterMap = getParameterMap();
			String[] values = parameterMap.get(name);
			if (values == null) {
				return null;
			}
			return values[0]; //
		}
		
		@Override
		public String[] getParameterValues(String name) {
			Map<String, String[]> parameterMap = getParameterMap();
			String[] values = parameterMap.get(name);
			return values;
		}
	}

}
