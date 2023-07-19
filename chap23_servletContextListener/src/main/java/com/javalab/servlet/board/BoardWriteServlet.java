package com.javalab.servlet.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalab.dao.BoardDao;
import com.javalab.vo.BoardVo;
import com.javalab.vo.MemberBean;

/**
 * Servlet implementation class BoardWriteServlet
 */
@WebServlet("/boardWrite")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * GET 접근 시 (게시물 입력폼 요청시 응답 메소드)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {

		//세션에 로그인 정보 유무 확인
		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean)session.getAttribute("member");
		
		// 로그인한 회원
		if(mb != null) {	
			// 게시물 입력폼으로 이동		
			String url = "/boardWrite.jsp";
			request.setAttribute("member", mb); // 게시물 입력폼에서 작성자 부분에 id표시
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
			requestDispatcher.forward(request, response);
		}else {
			// 로그인 안한 사용자는 로그인 폼으로 이동		
			String contextPath = request.getContextPath();
			String url = contextPath + "/member/memberLogin.jsp";
			response.sendRedirect(url);
		}
	}

	/**
	 * POST 접근시 (게시물을 입력하고 저장 버튼 클릭시 처리 메소드)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		
		//request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html; charset = utf-8");
		
		BoardVo boardvo = new BoardVo();	
		boardvo.setId(request.getParameter("id"));
		boardvo.setTitle(request.getParameter("title"));
		boardvo.setContent(request.getParameter("content"));
		
		ServletContext sc = this.getServletContext();
		
		BoardDao boardDao = (BoardDao)sc.getAttribute("boardDao");
		
		boardDao.insertNewBoard(boardvo);
		
		String contextPath = request.getContextPath();
		
		response.sendRedirect(contextPath + "/boardList");
	}

}
