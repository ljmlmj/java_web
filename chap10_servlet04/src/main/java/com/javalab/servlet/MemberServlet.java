package com.javalab.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberServlet
 */
@WebServlet("/member")
public class MemberServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> memberList = dao.listMembers();
		
		// 조회 결과를 request 영역에 저장
		request.setAttribute("memberList", memberList);
		
		// 프로그램 흐름을 다른 서블릿/화면으로 이동(second라는 서블릿으로 이동)
		RequestDispatcher dispatch = request.getRequestDispatcher("memberList.jsp");
		dispatch.forward(request, response);
	}


}
