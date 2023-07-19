package com.javalab.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.javalab.dao.MemberDao;
import com.javalab.vo.Member;
/**
 * 회원가입 처리 서블릿
 *  - 클라이언트에서 JSON Type 문자열 형태로 값을 받음
 *  - 구글의 Gson 라이브러리를 통해서 JSON Type 문자열을 자바 객체로 매핑(바인딩)
 *    (구글 gson 라이브러리 import 해야 함)
 *  - Member vo 클래스 필요
 */
@WebServlet("/memberSerialize")
public class MemberSerializeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/text; charset=UTF-8");
		
		// 클라이언트에서 serialize()
		// data : params
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		// 서버의 시간을 String으로 변환(서버 날짜)
		LocalDate currentDate = LocalDate.now();
		String dateString = currentDate.format(DateTimeFormatter.ofPattern("yy-MM-dd"));
		
		Member member = new Member(id, pwd, name, email, dateString);
		System.out.println("member.toString():" + member.toString());
		
		// .........database 처리.............//
		
		// Gson으로 자바 객체를 다시 JSON Type 문자열로 변환
		Gson gson = new Gson();
		String jsonString = gson.toJson(member);
		
		
		// 사용자의 웹브라우저에 쓰기(success 콜백함수에 전달됨)
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		
	}

}
