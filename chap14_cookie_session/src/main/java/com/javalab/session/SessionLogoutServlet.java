package com.javalab.session;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalab.dao.MemberDAO;
import com.javalab.vo.MemberVo;

/**
 * 쿠키를 사용한 로그인 처리 서블릿
 *  1. Post 방식으로 로그인 처리하는 역할 - doPost() 메소드
 *  2. Get 방식으로 로그인 폼을 띄워주는 역할 - doGet() 메소드
 */
@WebServlet("/sessionLogout")
public class SessionLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberDAO memberDao = MemberDAO.getInstance();
	/**
	 * 쿠키 삭제 (무효화)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		if (session != null) {
			session.invalidate();
			System.out.println("세션을 무효화 하였습니다.");
		}
		
		// sendRedirect(로그아웃 후에 인덱스페이지로 이동)
		String contextPath = request.getContextPath();
		response.sendRedirect(contextPath + "/index.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	

}
