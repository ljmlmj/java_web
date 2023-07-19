package com.javalab.cookie;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalab.dao.MemberDAO;
import com.javalab.vo.MemberVo;

/**
 * 쿠키를 사용한 로그인 처리 서블릿
 *  1. Post 방식으로 로그인 처리하는 역할 - doPost() 메소드
 *  2. Get 방식으로 로그인 폼을 띄워주는 역할 - doGet() 메소드
 */
@WebServlet("/cookieLogout")
public class CookieLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberDAO memberDao = MemberDAO.getInstance();
	/**
	 * 쿠키 삭제 (무효화)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 새로운 쿠키 객체 생성
		Cookie cookie = new Cookie("id", "");
		
		// 쿠키 객체의 유효 기간을 0으로 세팅 (삭제)
		cookie.setMaxAge(0);
		
		// response 사용자 브라우저의 헤더에 저장 (기존 쿠키 엎어씀)
		response.addCookie(cookie);
		System.out.println("쿠키 삭제 완료");
		
		String contextPath = request.getContextPath();
		//response.sendRedirect(contextPath + "/cookie/loginForm.jsp");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/cookie/loginForm.jsp");
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	

}
