package com.hrd.test.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.hrd.test.dto.JoinDto;
import com.hrd.test.dto.MemberDto;

public class MemberDao {
	
	private static MemberDao instance = new MemberDao();
	private MemberDao() {}
	public static MemberDao getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		Context ctx;
		
		try {
			ctx= new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	// 회원번호 자동생성 가져오기
	public int getCustno() {
		int custno = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT CUSTNO FROM (SELECT ROWNUM RN, A.* FROM(SELECT*FROM member_tbl_02 ORDER BY custno DESC)A) WHERE RN=1";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				custno = rs.getInt("custno")+1;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return custno;
	}
	// 회원등록
	public int memberRegister(String custname, String phone, String address, Date joindate, String grade, String city) {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO member_tbl_02 (custno, custname, phone, address, joindate, grade, city)" + 
				"    VALUES (member_tbl_02_SQ.NEXTVAL, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custname);
			pstmt.setString(2, phone);
			pstmt.setString(3, address);
			pstmt.setDate(4, joindate);
			pstmt.setString(5, grade);
			pstmt.setString(6, city);
			result = pstmt.executeUpdate();
			System.out.println(result==1?"회원가입성공":"회원가입실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}		
		return result;
	}
	// 회원목록조회
	public ArrayList<MemberDto> memberList(){
		ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT*FROM member_tbl_02 ORDER BY custno";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int custno = rs.getInt("custno");
				String custname = rs.getString("custname");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				Date joindate = rs.getDate("joindate");
				String grade = rs.getString("grade");
				String city = rs.getString("city");
				dtos.add(new MemberDto(custno, custname, phone, address, joindate, grade, city));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}		
		return dtos;
	}
	// 회원정보수정
	public int memberModify(MemberDto dto) {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE member_tbl_02 SET" + 
				"    custname=?," + 
				"    phone=?," + 
				"    address=?," + 
				"    joindate=?," + 
				"    grade=?," + 
				"    city=?" + 
				"    WHERE custno=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCustname());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getAddress());
			pstmt.setDate(4, dto.getJoindate());
			pstmt.setString(5, dto.getGrade());
			pstmt.setString(6, dto.getCity());
			pstmt.setInt(7, dto.getCustno());
			result = pstmt.executeUpdate();
			System.out.println(result==1?"정보수정 성공":"정보수정 실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}		
		return result;
	}
	// 회원매출조회
	public ArrayList<JoinDto> memberSumPriceList(){
		ArrayList<JoinDto> dtos = new ArrayList<JoinDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT ME.custno CUSTNO, custname, grade, SUM(PRICE) price_sum" + 
				"    FROM member_tbl_02 ME, money_tbl_02 MO" + 
				"    WHERE ME.custno=MO.custno" + 
				"    GROUP BY ME.custno, CUSTNAME, GRADE" + 
				"    ORDER BY PRICE_SUM DESC";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			while(rs.next()) {
				int custno = rs.getInt("custno");
				String custname = rs.getString("custname");
				String grade = rs.getString("grade");
				int price_sum = rs.getInt("price_sum");
				dtos.add(new JoinDto(custno, custname, grade, price_sum));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}	
		return dtos;
	}
	
	
}
