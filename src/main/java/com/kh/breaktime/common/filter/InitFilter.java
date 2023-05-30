package com.kh.breaktime.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class InitFilter
 */
@WebFilter(filterName="initFilter", urlPatterns = "/*")
public class InitFilter extends HttpFilter implements Filter {

    /**
     * Default constructor. 
     */
    public InitFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//contextPath 경로 저장 (/spring) ==> application 스코프에 저장할 예정
		
		// 1. application 내장객체 얻어오기
		ServletContext application = request.getServletContext();
		
		// 2. 최상위 주소 얻어오기
		String contextPath = ((HttpServletRequest)request).getContextPath();
		
		// 3. 세팅하기 --> application 스코프에 contextpath경로 저장
		application.setAttribute("contextPath", contextPath);
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
