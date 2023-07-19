package com.javalab.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalab.dao.MemberDAO;
import com.javalab.dto.MemberVO;

@WebServlet("/updateForm")
public class UpdateFormServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html;charset=utf-8");
		
		String contextPath = request.getContextPath();
		
		MemberDAO dao = new MemberDAO();
		
		String id = request.getParameter("id");
		
		MemberVO member = dao.getMemeber(id);
		request.setAttribute("member", member);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("memberUpdateForm.jsp");
		dispatcher.forward(request, response);
		
	}

}
