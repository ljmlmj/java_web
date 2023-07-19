package com.javalab.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.javalab.vo.Product;

/**
 * 상품등록 처리 서블릿 - 클라이언트에서 JSON Type 문자열 형태로 값을 받음 - 구글의 Gson 라이브러리를 통해서 JSON Type
 * 문자열을 자바 객체로 매핑 (구글 Gson 라이브러리 import 해야함.)
 */

@WebServlet("/insertProducts")
public class InsertProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertProducts() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost");
		/*
		 * 1. JSON Type 문자열 추출 - 사용자 측에서 data : {data : jsonData}형태로 전송
		 */
		String jsonData = request.getParameter("data");
		/*
		 * 2. 자바스크립트 부분에서 넘어온 Json 형태의 문자열을 자바 객체로 매핑 - 구글에서 제공하는 Gson 사용, 문법이 간단하고 사용하기
		 * 편함.
		 */
		Gson gson = new Gson();
		// 3. jsonData 문자열을 Product[] 배열 객체로 변환(매핑, 바인딩)
		// 화면에서 여러개의 Product 객체가 전송되기 때문에 배열로 바인딩
		Product[] products = gson.fromJson(jsonData.toString(), Product[].class);

		// [디버깅]
		System.out.println("products.length: " + products.length);

		// 4. products 데이터베이스에 저장처리
		// ..................................//
		// 5. 저장한 products를 다시 사용자에게 전송하기 위해서 사용자의 부라우저에 컨텐트 타입 명시
		response.setContentType("application/json; charset=UTF-8");

		// 5-1 자바 객체(products)를 다시 JSON Type 문자열로 변환.
		// - Gson 라이브러리를 이용해서 자바 객체를 json 형태로 변환
		String jsonString = gson.toJson(products);

		// 5-3 사용자의 웹브라우저에 쓰기
		PrintWriter out = response.getWriter();
		out.print(jsonString);
	}

}
