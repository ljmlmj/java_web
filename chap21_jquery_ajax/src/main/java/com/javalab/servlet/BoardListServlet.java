package com.javalab.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.javalab.dao.BoardDao;
import com.javalab.vo.BoardVo;

@WebServlet("/boardList")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public BoardListServlet() {
		super();
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardListServlet doGet()");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset:utf-8");
		
		// 페이지 번호
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		System.out.println("요청한 페이지 번호 : " + pageNum);
		
		// Dao 쪽으로 게시물 목록 요청
		BoardDao dao = new BoardDao();
		List<BoardVo> boardList = dao.selectList(Integer.parseInt(pageNum));
		
		// Gson으로 자바 ArrayList를 JSON Type 문자열로 변환
		Gson gson = new Gson();
		String jsonString = gson.toJson(boardList);
		
		// 5.3 사용자의 웹브라우저에 쓰기(success 콜백함수에 전달됨)
		PrintWriter out = response.getWriter();
		out.print(jsonString);
	}

}
