package com.javalab.servlet.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalab.dao.BoardDao;
import com.javalab.util.PageNavigator;
import com.javalab.vo.BoardVo;

@WebServlet("/boardList")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/boardList.jsp";
		
		ServletContext sc = this.getServletContext();
		
		BoardDao boardDao = (BoardDao)sc.getAttribute("boardDao");

		BoardVo board = new BoardVo();

		List<BoardVo> boardList = boardDao.getBoardList();

		request.setAttribute("boardList", boardList);

		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
