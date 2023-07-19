package com.javalab.sendredirect;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 로그인 페이지를 띄워주는 기능 / 로그인을 진행하는 두 가지 기능
 */
@WebServlet("/login")
public class LoginServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	// 로그인 폼 화면을 띄워주는 메소드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String errorMsg = "";
		
		// 오류 메시지 request 객체에 저장
		request.setAttribute("id", request.getParameter("id"));
		request.setAttribute("pwd", request.getParameter("pwd"));
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/loginForm.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * 로그인 처리를 하는 메소드
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post 방식 파라미터 전달받을 때 인코딩 방식 지정
		request.setCharacterEncoding("utf-8");
		
		// 사용자 브라우저에 내려보내는 컨텐트 타입 설정
		response.setContentType("text/html; charset=utf-8");
		
		// 사용자 브라우저에 응답할 때 한글이 깨지지 않고 전달되도록 설정
		response.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		// 아이디와 비밀번호가 같으면 인증 OK, 아니면 인증 Fail 가정
		boolean isAuthenticated = id.equals(pwd) ? true : false;
		
		if (isAuthenticated) {
			// 계정 인증에 성공 시 네이버 홈페이지로 이동
			response.sendRedirect("https://www.naver.com");
		} else {
			String contextPath = request.getContextPath();
			String urlString = contextPath + "/login?id=" + id + "&pwd=" + pwd;
			response.sendRedirect(urlString);
		}
	}

}
