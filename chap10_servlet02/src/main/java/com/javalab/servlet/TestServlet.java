package com.javalab.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * [서블릿 클래스] 자바 프로그램을 통해서 웹 요청을 처리할 수 있는 클래스 
 * - 반드시 HttpServlet 상속해야 한다. 
 * - 서블릿 컨테이너(톰캣)에 의해서 생성/관리/소멸한다. 
 * - web.xml을 통해서 웹을 처리할 수 있는 매핑 작업을 하거나
 * - @WebServlet("/first") 어노테이션을 통해서 매핑 작업을 해야 한다. 
 * - 서블릿은 수정하고 저장하면 잠시 후에 서버(WAS)가 자동으로 재시작된다.
 */
@WebServlet("/first")
public class TestServlet extends HttpServlet {

   private static final long serialVersionUID = 1L;

   public TestServlet() {
      super();
      System.out.println("TestServlet 생성자");
   }

   public void init(ServletConfig config) throws ServletException {
      System.out.println("init() 메소드 호출!");
   }

   /**
    * doGet 메소드(클라이언트의 get 요청 정보를 처리하는 메소드)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // 1. 이클립스 콘솔창 디버깅 문자열 출력
      System.out.println("FirstServlet doGet() 메소드 호출!");

      // 2. 웹 브라우저에 한글을 쓸 경우 깨지지 않도록 인코딩 처리
      response.setContentType("text/html; charset=utf-8");

      // 3. 현재 웹어플리케이션 서비스의 컨텍스트 경로 조회
      String contextPath = request.getContextPath();

      // 4. 웹 브라우저에 응답으로 전달해줄 Html 코드 생성
      PrintWriter out = response.getWriter();
      out.println("<html>");
      out.println("<head><title>FirstServlet 현재시간</title></head>");
      out.println("<body>");
      out.println("1. 현재 서버의 컨텍스트 경로는 : " + contextPath + "<br><br>");
      out.println("2. 현재 시간은 : ");
      out.println(new Date() );    // java.util의 Date()
      out.println(" 입니다<br><br>");
      out.println(" 3. JSP가 나오기 전에는 이런 형태로 HTML을 만들었습니다.<br><br>");
      out.println(" 4. 점점 웹으로 전송하는 데이터의 양이 많아지면서 <br>");
      out.println(" 이런 형태로 페이지를 만들기 어렵게 되었습니다.<br><br>");
      out.println(" 5. JSP는 화면을 만들고 서블릿은 내부 로직을 처리하는 역할로<br>");
      out.println(" 나눠지게 되었다.<br><br>");
      out.println(" 6. 스프링 프레임워크도 서블릿 기반위에서 동작하기 때문에 서블릿에 대한<br>");
      out.println(" 개념적인 이해가 필요하다.");
      out.println("</body>");
      out.println("</html>");
   }

   /**
    * doPost 메소드(클라이언트의 Post 요청 정보를 처리하는 메소드)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      System.out.println("doPost() 메소드 호출!");
      doGet(request, response);
   }

}