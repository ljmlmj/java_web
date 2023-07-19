package com.javalab.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalab.dao.BoardDao;
import com.javalab.dto.BoardModel;

@WebServlet("/boardDelete")
public class BoardDeleteServlet extends HttpServlet {
	
	// 톰캣에서 서블릿 객체를 생성해서 관리할 대도 Byte 단위로 전송(관리)함.
	// 이 때도 직렬화하는데 이 때 필요함.
	private static final long serialVersionUID = 1L;
	
	// 싱글톤으로 만든 boardDao 객체 얻어옴
	private BoardDao boardDao = BoardDao.getInstance();
       
	// get 요청 처리 (회원 삭제)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		
		// boardView.jsp => get => parameter 값들을 저장할 객체
		// 전달되는 parameter명 : no
		
		BoardModel boardModel = new BoardModel();
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		boardModel.setNo(no);
		
		boardDao.delete(boardModel);
		
		response.sendRedirect("boardList");
		
	}
}
