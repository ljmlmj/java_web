package com.javalab.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalab.dao.MemberDAO;
import com.javalab.dto.MemberVO;

/**
 * 회원정보를 업데이트하는 서블릿
 */

@WebServlet("/insert")
public class InsertServlet extends HttpServlet {
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html;charset=utf-8");
		
		String contextPath = request.getContextPath();
				
		MemberDAO dao = new MemberDAO();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		//String joinDate = request.getParameter("joindate");
		
		//Date joinDate2 = transFormat.parse(joinDate);
		
		MemberVO vo = new MemberVO(id, pwd, name, email);
		
		dao.insertMember(vo);
		
		response.sendRedirect(contextPath + "/list");
	}
}
