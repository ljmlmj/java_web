package com.javalab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalab.vo.Member;

public class MemberDao {

	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataSource;
	private ResultSet rs;

	private static MemberDao instance;

	public MemberDao() {
		System.out.println("여기는 MemberDao 생성자");
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static MemberDao getInstance() {
		if (instance == null)
			instance = new MemberDao();
		return instance;
	}

	public ArrayList<Member> listMembers() {
		ArrayList<Member> list = new ArrayList<Member>();
		try {
			// 톰캣 환경 설정 파일에 저장해놓은 자원(DB 커넥션)을 얻음.
			con = dataSource.getConnection();

			String query = "select * from tbl_member";
			System.out.println("prepareStatement: " + query);
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String joinDate = rs.getString("joindate");

				Member mb = new Member();
				mb.setId(id);
				mb.setPwd(pwd);
				mb.setName(name);
				mb.setEmail(email);
				mb.setJoindate(joinDate);
				list.add(mb);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public Member getMemeber(String id) {
		Member member = null;
		try {
			// 톰캣 환경 설정 파일에 저장해놓은 자원(DB 커넥션)을 얻음.
			con = dataSource.getConnection();

			String query = "select m.id, m.name, m.email, to_char(m.joindate)";
			query += " from member m";
			query += " where m.id = ?";
			System.out.println("preapreStatement: " + query);

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new Member();
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setJoindate(rs.getString("joindate"));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return member;
	}

	public void updateMember(Member mb) {
		try {
			con = dataSource.getConnection();

			String id = mb.getId();
			String name = mb.getName();
			String email = mb.getEmail();

			String query = "update member";
			query += " set name = ?,";
			query += " email = ?";
			query += " where id = ?";

			System.out.println("prepareStatement: " + query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mb.getName());
			pstmt.setString(2, mb.getEmail());
			pstmt.setString(3, mb.getId());

			pstmt.executeUpdate();

			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteMember(String id) {
		try {
			con = dataSource.getConnection();

			String query = "delete from member where id = ?";

			System.out.println("prepareStatement: " + query);

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);

			pstmt.executeUpdate();

			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public void insertMember(Member mb) {
		try {
			con = dataSource.getConnection();

			String id = mb.getId();
			String pwd = mb.getPwd();
			String name = mb.getName();
			String email = mb.getEmail();

			String query = "insert into member values(?, ?, ?, ?, sysdate)";
			System.out.println("prepareStatement: " + query);

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, email);

			pstmt.executeUpdate();

			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	// 사용자가 데이터베이스에 있는지 조회
	public Member getMemberById(Member mb) {
		Member memberBean = null;
		try {
			// 1. 데이터소스에서 커넥션 객체 얻음
			con = dataSource.getConnection();
			// 2. SQL쿼리문장 생성
			String sql = "select id, name from tbl_member where id = ? and pwd = ?";
			// 3. 쿼리문 실행
			pstmt = con.prepareStatement(sql);
			// 4. 인자 전달
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPwd());
			// 5. 쿼리 실행
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				memberBean = new Member(id, name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return memberBean;
	}

	public Member loginCheck(Member mb) {
		Member memberBean = null;
		try {
			// 1. 데이터소스에서 커넥션 객체 얻음
			con = dataSource.getConnection();
			// 2. SQL쿼리문장 생성
			String sql = "select id, pwd from tbl_member where id = ? and pwd = ?";
			// 3. 쿼리문 실행
			pstmt = con.prepareStatement(sql);
			// 4. 인자 전달
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPwd());
			// 5. 쿼리 실행
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				memberBean = new Member(id, pwd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return memberBean;
	}
	
	public boolean isIdExist(String id) {
		boolean result = false;
		try {
			con = dataSource.getConnection();
			String query = "select decode(count(*), 1, 'true', 'false') as result from tbl_member";
			query += " where id=?";
			System.out.println("prepareStatement : " + query);
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			rs.next();
			result = Boolean.parseBoolean(rs.getString("result"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	private void close() {
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
}