package com.javalab.servlet.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
	
	private BoardDao boardDao = BoardDao.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pageNum = request.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1";
		}

		BoardVo board = new BoardVo();
		board.setPageNum(pageNum);

		int totalCount = boardDao.selectCount();

		List<BoardVo> boardList = boardDao.selectList(board);

		request.setAttribute("totalCount", totalCount);
		request.setAttribute("pageNum", pageNum);

		PageNavigator pageNavigator = new PageNavigator();

		String pageNums = pageNavigator.getPageNavigator(totalCount, board.getListCount(), board.getPagePerBlock(),
				Integer.parseInt(pageNum));

		System.out.println("pageNums : " + pageNums);

		request.setAttribute("page_navigator", pageNums);

		request.setAttribute("boardList", boardList);

		RequestDispatcher dispatch = request.getRequestDispatcher("boardList.jsp");
		dispatch.forward(request, response);
	}

}
