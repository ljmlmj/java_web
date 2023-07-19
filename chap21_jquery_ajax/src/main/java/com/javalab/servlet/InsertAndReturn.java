package com.javalab.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.javalab.vo.Member;
/**
 * 회원가입 처리 서블릿
 *  - 클라이언트에서 JSON Type 문자열 형태로 값을 받음
 *  - 구글의 Gson 라이브러리를 통해서 JSON Type 문자열을 자바 객체로 매핑(바인딩)
 *    (구글 gson 라이브러리 import 해야 함)
 *  - Member vo 클래스 필요
 */
@WebServlet("/insertAndReturn")
public class InsertAndReturn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1. JSON Type 문자열 추출
		 *  - 사용자 측에서 data : {date : jsonData}형태로 전송
		 */
		String jsonData = request.getParameter("data2");
		System.out.println("Servlet 받은 데이터 : " + jsonData);
		
		/*
		 * 2. 자바스크립트에서 넘어온 Json 형태의 문자열을 자바 객체로 매핑
		 *  - 구글에서 제공하는 Gson 사용, 문법이 간단하고 사용하기 편함.
		 */
		Gson gson = new Gson();
		
		// 3. jsonData 문자열을 Member 자바 객체로 매핑(바인딩)
		Member member2 = gson.fromJson(jsonData.toString(), Member.class);
		
		// [디버깅]
		System.out.println("member : " + member2.toString());
		
		// 4. 데이터베이스에 저장처리....
		// 5. 사용자에게 받은 데이터를 화면에서 다시 전송하기 위해서
		// 5.1 사용자의 브라우저에 컨텐트 타입 명시
		response.setContentType("application/x-json; charset=UTF-8");
		
		// 5.2 자바 객체를 다시 JSON Type 문자열로 변환.
		// - Gson 라이브러리를 이용해서 자바 객체를 json 형태로 변환
		String jsonString = gson.toJson(member2);
		System.out.println("서블릿, 클라이언트로 보낼 JSON 문자열 : " + jsonString);
		
		// 5.3 사용자의 웹브라우저에 쓰기
		PrintWriter out = response.getWriter();
		out.print(jsonString);
	}

}
