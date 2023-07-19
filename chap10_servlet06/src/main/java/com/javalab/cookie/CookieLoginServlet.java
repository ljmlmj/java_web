package com.javalab.cookie;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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
@WebServlet("/cookieLogin")
public class CookieLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// [멤버변수]
	// 싱글톤으로 만든 boardDao 객체 얻어옴
	private MemberDAO memberDao = MemberDAO.getInstance();
	
	/*
	 * 1. 로그인 처리 메소드
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 사용자가 입력한 값을 읽어올 때 한글 깨짐 방지
		request.setCharacterEncoding("utf-8");
		
		String contextPath = request.getContextPath();
		
		//ServletContext sc = this.getServletContext();
		//String contextPath2 = sc.getContextPath();
		
		// 1. 파라미터 추출
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		// 2. 화면에서 전달받은 id/pwd로 회원 객체 생성
		MemberVo member = new MemberVo(id, pwd);
		
		// 3. 생성된 객체를 DAO에 보내서 회원정보 확인
		member = memberDao.getMemberById(member);
		if (member != null) { // 회원 존재
			// 쿠키 생성
			Cookie idCookie = new Cookie("id", member.getId());
			response.addCookie(idCookie);
			System.out.println("쿠키 저장 성공");
		} else { // 회원 정보가 데이터베이스에 없으면
			// 로그인 페이지로 이동
			response.sendRedirect(contextPath + "/cookie/loginFail.jsp");
			
			return;
		}
		request.setAttribute("id", member.getId());
		response.sendRedirect(contextPath + "/cookie/welcome.jsp");
	}

	
	/*
	 * 2. 로그인폼을 띄워주는 메소드
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String contextPath = request.getContextPath();
		// 1. 입력한 아이디로 쿠키가 이미 만들어졌는지 확인
		// 전체 쿠키 추출
		Cookie[] cookies = request.getCookies();
		// 쿠키가 하나라도 존재하면 
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				// 쿠키명이 id인 쿠키가 있으면
				if (cookie.getName().equals("id")) {
					// 로그인했으므로 alreadyLogin 페이지로 (jsp 파일명 대소문자 구분)
					response.sendRedirect(contextPath + "/cookie/alreadyLogin.jsp");
					return;	// 메소드 exit
				}
			}
		}
		// 쿠키가 없으므로 로그인 페이지를 띄워준다.
		response.sendRedirect(contextPath + "/cookie/loginForm.jsp");
	}


}
