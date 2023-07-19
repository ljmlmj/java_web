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


/**
 * 싱글톤 패턴으로 생성된 DAO
 */
@WebServlet("/boardList")
public class BoardListServlet extends HttpServlet {
	
	// 톰캣에서 서블릿 객체를 생성해서 관리할 대도 Byte 단위로 전송(관리)함.
	// 이 때도 직렬화하는데 이 때 필요함.
	private static final long serialVersionUID = 1L;
	
	// 싱글톤으로 만든 boardDao 객체 얻어옴
	private BoardDao boardDao = BoardDao.getInstance();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		List<BoardModel> list = boardDao.selectList();
		
		request.setAttribute("boardList", list);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("boardList.jsp");
		dispatch.forward(request, response);
		
	}

}
