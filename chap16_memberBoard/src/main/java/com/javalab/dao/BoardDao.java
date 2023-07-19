package com.javalab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.javalab.vo.BoardVo;

public class BoardDao {

	private Connection con;
	private PreparedStatement pstmt;
	private static DataSource dataSource;
	private ResultSet rs;

	private static BoardDao instance;

	private BoardDao() {
		System.out.println("여기는 BoardDao 생성자");
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public static BoardDao getInstance() {
		if (instance == null)
			instance = new BoardDao();
		return instance;
	}

	public List<BoardVo> selectList(BoardVo board) {
		List<BoardVo> boardList = new ArrayList<BoardVo>();

		StringBuffer query = new StringBuffer();

		int start = 0;
		int end = 0;

		start = (Integer.parseInt(board.getPageNum()) - 1) * board.getListCount() + 1;
		end = start + board.getListCount() - 1;

		System.out.println("시작 게시물 번호 : " + start + "/ 끝 게시물 번호 : " + end);

		query.append("select a.no, a.title, a.id, a.content, a.hit, a.regdate,")
			 .append(" a.reply_group, a.reply_order, a.reply_indent ")
			 .append(" from( ")
			 .append(" 	select b.*, row_number() over(order by reply_group DESC, reply_order ASC) row_num")
			 .append("		from tbl_board b")
			 .append("	)a")
			 .append(" where a.row_num between ? and ?");

		try {
			// 커넥션 객체 얻기
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query.toString());
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();
			BoardVo model = null;

			while (rs.next()) {
				model = new BoardVo();
				model.setNo(rs.getInt("no"));
				model.setTitle(rs.getString("title"));
				model.setId(rs.getString("id"));
				model.setHit(rs.getInt("hit"));
				model.setContent(rs.getString("content"));
				model.setRegdate(rs.getString("regdate"));
				model.setReply_group(rs.getInt("reply_group"));
				model.setReply_order(rs.getInt("reply_order"));
				model.setReply_indent(rs.getInt("reply_indent"));
				boardList.add(model);
				model = null;
			}

		} catch (Exception e) {
			System.out.println("selectList() ERR => " + e.getMessage());
		} finally {
			close();
		}
		System.out.println();
		return boardList;
	}

	// 테이블의 전체 레코드수(행수) 조회
	public int selectCount() {
		int totalcount = 0;
		StringBuffer query = new StringBuffer();

		query.append("select count(*) as totalcount from tbl_board");

		try {
			// 커넥션 객체 얻기
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query.toString());

			rs = pstmt.executeQuery();
			BoardVo model = null;

			while (rs.next()) {
				totalcount = rs.getInt("totalcount");
			}

		} catch (Exception e) {
			System.out.println("selectList() ERR => " + e.getMessage());
		} finally {
			close();
		}
		System.out.println();
		return totalcount;
	}

	public BoardVo selectOne(BoardVo boardVo) {
		StringBuffer query = new StringBuffer();
		query.append("select * from tbl_board where no=?");
		BoardVo model = null;
		try {
			// 톰캣 환경 설정 파일에 저장해놓은 자원(DB 커넥션)을 얻음.
			con = dataSource.getConnection();

			System.out.println("preapreStatement: " + query);

			pstmt = con.prepareStatement(query.toString());
			pstmt.setInt(1, boardVo.getNo());
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				model = new BoardVo();
				model.setNo(rs.getInt("no"));
				model.setTitle(rs.getString("title"));
				model.setId(rs.getString("id"));
				model.setContent(rs.getString("content"));
				model.setHit(rs.getInt("hit"));
				model.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception e) {
			System.out.println("selectOne() ERR => " + e.getMessage());
		} finally {
			close();
		}
		System.out.println();
		return model;
	}

	public void insert(BoardVo boardVo) {
		StringBuffer query = new StringBuffer();
		query.append("insert into tbl_board (no, title, content, id, reply_group, reply_order, reply_indent)")
			 .append(" values (seq_board_no.nextval, ?, ?, ?, seq_board_no.currval, 0, 0)");
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query.toString());
			pstmt.setString(1, boardVo.getTitle());
			pstmt.setString(2, boardVo.getContent());
			pstmt.setString(3, boardVo.getId());

			int result = pstmt.executeUpdate();
			BoardVo model = null;
			while (rs.next()) {
				model = new BoardVo();
				model.setNo(rs.getInt("no"));
				model.setTitle(rs.getString("title"));
				model.setId(rs.getString("id"));
				model.setContent(rs.getString("content"));
				model.setReply_group(rs.getInt("reply_group"));
				model.setReply_order(rs.getInt("reply_order"));
				model.setReply_indent(rs.getInt("reply_indent"));
			}
			
			if (result > 0) {
				System.out.println("=> INSERT  SUCCESS !!");
			}
			model = null;
		} catch (SQLException e) {
			System.out.println("insert() ERR => " + e.getMessage());
		} finally {
			close();
		}
		System.out.println();
	}

	public void update(BoardVo boardVo) {
		String sql_query = "update tbl_board set title=?, content=?";
		sql_query += " where no=?";

		try {
			con = dataSource.getConnection(); // 커넥션 객체 얻기

			pstmt = con.prepareStatement(sql_query);
			pstmt.setString(1, boardVo.getTitle());
			pstmt.setString(2, boardVo.getContent());
			pstmt.setInt(3, boardVo.getNo());
			int result = pstmt.executeUpdate();
			if (result > 0) {
				System.out.println("=> UPDATE  SUCCESS !!");
			}
		} catch (SQLException e) {
			System.out.println("update() ERR => " + e.getMessage());
		} finally {
			close();
		}
		System.out.println();
	}

	public void updateHit(BoardVo boardVo) {
		String query = "update tbl_board set hit=hit+1 where no=?";

		try {
			con = dataSource.getConnection();

			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardVo.getNo());
			int result = pstmt.executeUpdate();

			if (result > 0) {
				System.out.println("=> UPDATE HIT  SUCCESS !!");
			}
		} catch (SQLException e) {
			System.out.println("updateHit() ERR => " + e.getMessage());
		} finally {
			close();
		}
		System.out.println();
	}

	public void delete(BoardVo boardVo) {
		String query = "delete from tbl_board where no=? ";

		try {
			con = dataSource.getConnection();

			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardVo.getNo());
			int result = pstmt.executeUpdate();

			if (result > 0) {
				System.out.println("=> DELETE  SUCCESS !!");
			}
		} catch (SQLException e) {
			System.out.println("delete() ERR => " + e.getMessage());
		} finally {
			close();
		}
		System.out.println();
	}

	/**
	 * 사용이 끝난 자원 해제
	 */

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			System.out.println("CLOSED ERR => " + e.getMessage());
		}
	}
	
	public BoardVo getBoardById(int no) {
		StringBuffer query = new StringBuffer();
		query.append("select * from tbl_board where no=?");
		BoardVo model = null;
		try {
			// 톰캣 환경 설정 파일에 저장해놓은 자원(DB 커넥션)을 얻음.
			con = dataSource.getConnection();

			System.out.println("preapreStatement: " + query);

			pstmt = con.prepareStatement(query.toString());
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				model = new BoardVo();
				model.setNo(rs.getInt("no"));
				model.setTitle(rs.getString("title"));
				model.setContent(rs.getString("content"));
				model.setId(rs.getString("id"));
				model.setReply_group(rs.getInt("reply_group"));
				model.setReply_order(rs.getInt("reply_order"));
				model.setReply_indent(rs.getInt("reply_indent"));
				
			}
		} catch (Exception e) {
			System.out.println("getBoardById() ERR => " + e.getMessage());
		} finally {
			close();
		}
		System.out.println();
		return model;
	}

	public boolean reqUpdate(int reply_group, int reply_order) {

		boolean result = false;

		try {
			StringBuffer query = new StringBuffer();
			con = dataSource.getConnection();
			con.setAutoCommit(false);	// 자동 커밋 false
			
			// group(그룹번호)와 order(답글순서)를 확인하여 원본 글에 다른 답변이 있으면
			// 답변글 중에서 답변 글보다 상위에 있는 즉 seq가 큰 답글들을 seq 값을 +1
			// 이전의 답글들이 뒤로 밀리고 그 자리에 현재 답변글이 들어가게 됨.
			query.append("update tbl_board set reply_order = reply_order + 1")
				 .append(" where reply_group = ? and reply_order > ?");
			
			pstmt = con.prepareStatement(query.toString());
			pstmt.setInt(1, reply_group);
			pstmt.setInt(2, reply_order);
			int flag = pstmt.executeUpdate();
			
			// 업데이트가 정상적으로 처리되었으면 
			if(flag >= 0) {
				result = true;
				con.commit();	// 커밋
			}
		}catch(Exception e) {
			try {
				con.rollback();	// 오류시 롤백(업뎃 원래대로 복원)
			}catch (SQLException sqe) {
				sqe.printStackTrace();
			}
			throw new RuntimeException(e.getMessage());	
		}finally {
			close();			
		}
		return result;
	}

	public void insertReplyBoard(BoardVo board) {
		StringBuffer query = new StringBuffer();
		query.append("insert into tbl_board (no, title, content, id, reply_group, reply_order, reply_indent)")
			 .append(" values (seq_board_no.nextval, ?, ?, ?, ?, ?, ?)");

		try {
			con = dataSource.getConnection(); // 커넥션 객체 얻기

			pstmt = con.prepareStatement(query.toString());
			
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getId());
			pstmt.setInt(4, board.getReply_group());
			pstmt.setInt(5, board.getReply_order());
			pstmt.setInt(6, board.getReply_indent());
			
			int result = pstmt.executeUpdate();
			
			if (result > 0) {
				System.out.println("=> REPLY UPDATE  SUCCESS !!");
			}
			
		} catch (SQLException e) {
			System.out.println("insertReplyBoard() ERR => " + e.getMessage());
		} finally {
			close();
		}
		System.out.println();
	}

	

	
	
}
