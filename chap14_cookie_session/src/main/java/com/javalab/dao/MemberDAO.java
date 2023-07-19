package com.javalab.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalab.vo.MemberVo;

public class MemberDAO {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static DataSource dataSource;

	private static MemberDAO instance; 
	
	// 기본 생성자에서 환경변수를 통한 데이터베이스 관련 DataSource얻어옴
	// Server / contex.xml에 Resource로 세팅해놓은 정보 추출
	private MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * 현재 객체의 참조 변수를 반환해주는 메소드
	 *  - 이 메소드가 최초로 호출 될 때 단 한번만 자신이 속한 클래스의 객체를 생성
	 *  - 다음 부터는 최초에 생성된 그 객체의 주소만 반환하게됨.
	 *  - 현재 클래스의 객체가 있는지 확인해서 없으면 객체로 생성(최초 호출될때)
	 */
	public static MemberDAO getInstance() {
		if (instance == null)
			instance = new MemberDAO();
		return instance;
	}	
	
	// 사용자가 데이터베이스에 있는지 조회
	public MemberVo getMemberById(MemberVo mb) {
		MemberVo memberBean = null;
		try {
			// 1. 데이터소스에서 커넥션 객체 얻음
			con = dataSource.getConnection();
			// 2. SQL쿼리문장 생성
			String sql = "select id, name from member where id = ? and pwd = ?";
			// 3. 쿼리문 실행
			pstmt = con.prepareStatement(sql);
			// 4. 인자 전달
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPwd());
			// 5. 쿼리 실행
			rs = pstmt.executeQuery();
					
			if(rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				memberBean = new MemberVo(id, name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberBean;	
	}	
	
	
	// 회원 목록 조회 메소드
	public ArrayList<MemberVo> listMembers() {
		ArrayList<MemberVo> list = new ArrayList<>();
		try {
			con = dataSource.getConnection();
			String query = "select * from members order by joindate desc";
			System.out.println("SQL :  " + query);
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");
				
				MemberVo vo = new MemberVo();
				vo.setId(id);
				vo.setPwd(pwd);
				vo.setName(name);
				vo.setEmail(email);
				vo.setJoinDate(joinDate);
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 회원 저장 메소드
	public void addMember(MemberVo memberBean) {
		try {
			
			con = dataSource.getConnection();
			
			String id = memberBean.getId();
			String pwd = memberBean.getPwd();
			String name = memberBean.getName();
			String email = memberBean.getEmail();
			
			String query = "insert into members";			
			query += " (id,pwd,name,email)";
			query += " values(?,?,?,?)";
			
			System.out.println("SQL :  " + query);
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원 수정 메소드
	public void updateMember(MemberVo memberBean) {
		try {
			con = dataSource.getConnection();
			
			String id = memberBean.getId();
			String pwd = memberBean.getPwd();
			String name = memberBean.getName();
			String email = memberBean.getEmail();
			
			String query = "update members set pwd=?, name=?, email=?";
			query += " where id=?";
			
			System.out.println("SQL :  " + query);

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pwd);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, id);

			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	
	// 회원 삭제 메소드
	public void deleteMember(MemberVo memberBean) {
		try {
			con = dataSource.getConnection();
			
			String id = memberBean.getId();
			String query = "delete from members where id=?";
			System.out.println("SQL :  " + query);

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);

			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

		
}
