package com.javalab.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalab.dao.BoardDao;
import com.javalab.dto.BoardModel;

/**
 * Servlet implementation class BoardWriteServlet
 */
@WebServlet("/boardWrite")
public class BoardWriteServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	// BoardDao 객체 참조값
	private BoardDao boardDao = BoardDao.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String contextPath = request.getContextPath();
		
		response.sendRedirect(contextPath + "/boardWrite.jsp");
	}

	/*
	 * 게시물 쓰기 화면에서 Post요청이 오면 처리하는 메소드
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 사용자가 입력한 정보가 메시지 바디에 담겨오면 인코딩 필요
		request.setCharacterEncoding("UTF-8");
		
		// 2. 사용자에게 보낼 컨텐츠의 인코딩 처리
		response.setContentType("text/html; charset = utf-8");
		
		// 3. 전달받은 값으로 객체 생성
		// boardWrite.jsp => "post" => 입력폼에서 넘어온 값으로 BoardModel 객체 생성
		// 전달되는 parameter 명 : subject,  writer, contents
		BoardModel boardModel = new BoardModel();		
		boardModel.setSubject(request.getParameter("subject"));
		boardModel.setWriter(request.getParameter("writer"));
		boardModel.setContents(request.getParameter("contents"));

		// 4. Dao에 보내서 저장 작업 처리
		boardDao.insert(boardModel);
		
		// 5. 컨텍스트 패스 얻기
		String contextPath = request.getContextPath();
		
		// 6. 저장후 목록 보기로 이동하기 위해서 해당 서블릿 재요청
		response.sendRedirect(contextPath + "/boardList");
	}
}
