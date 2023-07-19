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
import com.javalab.util.PageNavigator;

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
		
		// 페이지 번호를 눌렀을 때 전달
		String pageNum = request.getParameter("pageNum");
		
		// 처음 화면이 열릴 때는 기본적으로 1페이지가 보이도록
		if (pageNum == null) {
			pageNum = "1";
		}
		
		// Dao 쪽으로 보낼 파라미터를 Dto BoardModel 객체로 만들어서 보냄.
		// 객체를 생성하면 그 안에 페이지 관련 기본정보를 저장하고 있음.
		BoardModel board = new BoardModel();
		board.setPageNum(pageNum);
				
		int totalCount = boardDao.selectCount();
		
		List<BoardModel> boardList = boardDao.selectList(board);
		
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("pageNum", pageNum);
		
		PageNavigator pageNavigator = new PageNavigator();
		// jsp 화면에 보여질 페이징 관련 문자열을 html 형태로 만들어서 변환
		String pageNums = pageNavigator.getPageNavigator(totalCount, board.getListCount(), board.getPagePerBlock(), Integer.parseInt(pageNum));
		
		// [디버깅] pageNums값 출력하기
		System.out.println("pageNums : " + pageNums);
		
		// 페이징 관련 String 문자열을 만들어서 보냄.
		request.setAttribute("page_navigator", pageNums);
		
		request.setAttribute("boardList", boardList);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("boardList.jsp");
		dispatch.forward(request, response);
		
	}

}
