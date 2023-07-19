package com.javalab.servlet;

import java.io.IOException;
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
 * Servlet implementation class BoardViewServlet
 */
@WebServlet("/boardView")
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardDao boardDao = BoardDao.getInstance();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doHandle(request,response);
		
		BoardModel boardModel = new BoardModel();
		int no = Integer.parseInt(request.getParameter("no"));
		boardModel.setNo(no);
		
		boardDao.updateHit(boardModel);
		BoardModel boardOne = boardDao.selectOne(boardModel);
		
		request.setAttribute("board", boardOne);
		RequestDispatcher dispatch = request.getRequestDispatcher("boardView.jsp");
		dispatch.forward(request, response);
	}

}
