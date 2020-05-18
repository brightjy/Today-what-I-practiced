package com.hrd.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.hrd.dto.MemberDto;
import com.hrd.dto.SumPriceDto;

public class MemberDao {
	// 싱글톤
	private static MemberDao instance = new MemberDao(); 
	private MemberDao() {}
	public static MemberDao getInstance() {
		return instance;
	}
	// 데이터 연결
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		return con;
	}
	// 회원번호 자동생성
	public int custno() {
		int custno = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT MAX(CUSTNO)+1 CUSTNO FROM MEMBER_TBL_02";
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				custno = rs.getInt("custno");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}		
		return custno;
	}
	// 회원등록
	public int registerMember(String custname, String phone, String address, Date joindate, String grade, String city) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER_TBL_02" + 
				"    VALUES (CUSTNO_SQ.NEXTVAL, ?, ?, ?, ?, ?, ?)";
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
			System.out.println(result==1?"등록성공":"등록실패");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	// 회원목록 조회
	public ArrayList<MemberDto> memberList(){
		ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT*FROM MEMBER_TBL_02 ORDER BY CUSTNO";		
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
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}		
		return dtos;
	}
	// 회원정보 불러오기
	public MemberDto getMember(String custnoStr) {
		MemberDto dto = new MemberDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT*FROM MEMBER_TBL_02 WHERE CUSTNO=?";		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custnoStr);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int custno = rs.getInt("custno");
				String custname = rs.getString("custname");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				Date joindate = rs.getDate("joindate");
				String grade = rs.getString("grade");
				String city = rs.getString("city");
				dto = new MemberDto(custno, custname, phone, address, joindate, grade, city);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}		
		return dto;
	}
	// 회원정보 수정
	public int updateMember(String custname, String phone, String address, Date joindate, String grade, String city, String custnoStr) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER_TBL_02 SET" + 
				"    CUSTNAME=?," + 
				"    PHONE=?," + 
				"    ADDRESS=?," + 
				"    JOINDATE=?," + 
				"    GRADE=?," + 
				"    CITY=?" + 
				"    WHERE CUSTNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custname);
			pstmt.setString(2, phone);
			pstmt.setString(3, address);
			pstmt.setDate(4, joindate);
			pstmt.setString(5, grade);
			pstmt.setString(6, city);
			pstmt.setString(7, custnoStr);
			result = pstmt.executeUpdate();
			System.out.println(result==1?"수정성공":"수정실패");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	// 회원매출 정보 조회(custno, custname, grade, sum(price))
	public ArrayList<SumPriceDto> sumPriceList(){
		ArrayList<SumPriceDto> dtos = new ArrayList<SumPriceDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT ME.CUSTNO CUSTNO, CUSTNAME, GRADE, SUM(PRICE) SUM_PRICE" + 
				"    FROM MEMBER_TBL_02 ME, MONEY_TBL_02 MO" + 
				"    WHERE ME.CUSTNO=MO.CUSTNO" + 
				"    GROUP BY ME.CUSTNO, CUSTNAME, GRADE" + 
				"    HAVING SUM(PRICE)>0" + 
				"    ORDER BY SUM(PRICE) DESC";		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int custno = rs.getInt("custno");
				String custname = rs.getString("custname");
				String grade = rs.getString("grade");
				int sum_price =rs.getInt("sum_price");
				dtos.add(new SumPriceDto(custno, custname, grade, sum_price));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}		
		return dtos;
	}
}
