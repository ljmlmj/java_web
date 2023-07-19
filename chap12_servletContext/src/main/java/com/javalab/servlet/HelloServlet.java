package com.javalab.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 서블릿컨텍스트 사용 예제
 */
@WebServlet("/hello")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * get 요청 처리
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * [서블릿 컨텍스트 ServletContext]
		 *  - 웹어플리케이션이 시작될 때 톰캣에 의해서 만들어진다.
		 *  - 웹어플리케이션 하나 당 하나의 서블릿 컨텍스트 객체가 생성됨.
		 *  - 웹어플리케이션의 전 영역에서 사용되는 정보를 저장하는 객체로
		 *    웹어플리케이션이 작동하는 동안 유지된다.
		 *  - 모든 서블릿(JSP)에서 공유한다.
		 *  - web.xml에 <context-param>형태로 저장하면 서블릿 컨텍스트에 저장됨.
		 */
		
		/*
		 * [서블릿 컨텍스트 참조 주소 얻는 법]
		 * - this.getServletContext(): 조상이 갖고 있으므로 내게도 있음.
		 * - sc.getInitParameter("encoding") : web.xml에 저장한 값 조회
		 */
		
		// 서블릿 컨텍스트 참조 얻기
		ServletContext sc = this.getServletContext();
		String encoding = sc.getInitParameter("encoding");
		String contentType = sc.getInitParameter("contentType");
		
		// [디버깅]
		System.out.println("encoding : " + encoding);
		System.out.println("contentType : " + contentType);
		
		// 현재 어플리케이션의 컨텍스트 패스
		String contextPath = sc.getContextPath();
		String requestURI = request.getRequestURI();
		
		// webapp 아래에 있는 /user 폴더의 절대 경로를 얻어옴
		String realPath = sc.getRealPath("/user");
		
		// 응답 인코딩(웹브라우저에 쓸 때 한글이 안 깨지도록 인코딩)
		// web.xml에 설정한 값으로 서블릿 컨텍스트에 저장되어 있음.
		response.setCharacterEncoding(encoding);
		
		// 응답 컨텐트 타입
		// 어떤 형태로 만들어서 사용자에게 전달할건지 컨텐트 타입
		// web.sml에 설정한 값으로 서블릿 컨텍스트에 저장되어 있음.
		response.setContentType(contentType);
		
		// 브라우저에 쓸 출력 writer 객체 (문자 출력)
		PrintWriter out = response.getWriter();
		
		// 본 서블릿에서 바로 웹브라우저에 출력
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Hello World Servlet</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Hello World!</h1>");
		out.println("<h3> 1. web.xml에서 설정 + 서블릿 컨텍스트에 저장된 encoding : " + encoding + "</h3>");
		out.println("<h3> 2. web.xml에서 설정 + 서블릭 컨텍스트에 저장된 contentType : " + contentType + "</h3>");
		out.println("<h3> 3. web.xml에서 설정 + 서블릭 컨텍스트에 저장된 contextPath : " + contextPath + "</h3>");
		out.println("<h3> 4. web.xml에서 설정 + 서블릭 컨텍스트에 저장된 realPath : " + realPath + "</h3>");
		out.println("<h3> 5. web.xml에서 설정 + 서블릭 컨텍스트에 저장된 requestURI : " + requestURI + "</h3>");
		out.println("</body>");
		out.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
