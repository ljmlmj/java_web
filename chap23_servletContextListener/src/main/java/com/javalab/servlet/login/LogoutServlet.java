package com.javalab.servlet.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalab.dao.MemberDao;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberDao memberDao = MemberDao.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		Cookie cookie = new Cookie("id", "");

		cookie.setMaxAge(0);

		response.addCookie(cookie);
		System.out.println("쿠키 삭제 완료");

		if (session != null) {
			session.invalidate();
			System.out.println("세션을 무효화 하였습니다.");
		}

		// sendRedirect(로그아웃 후에 인덱스페이지로 이동)
		String contextPath = request.getContextPath();
		response.sendRedirect(contextPath + "/index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
