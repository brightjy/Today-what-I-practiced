<%@page import="com.hrd.dto.MemberDto"%>
<%@page import="com.hrd.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<div>
	<h3>홈쇼핑 회원 정보 수정</h3>
	<form action="<%=conPath %>/pro/updateMember.jsp" method="get">
	<%
		MemberDao mDao = MemberDao.getInstance();
		String custnoStr = request.getParameter("custno");
		MemberDto dto = mDao.getMember(custnoStr);
	%>
		<table>
			<tr>
				<th>회원번호(자동발생)</th>
				<td><input type="text" name="custno" value="<%=dto.getCustno() %>"></td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text" name="custname" value="<%=dto.getCustname() %>"></td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type="text" name="phone" value="<%=dto.getPhone()%>"></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input type="text" name="address" value="<%=dto.getAddress() %>"></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type="date" name="joindate" value="<%=dto.getJoindate()%>"></td>
			</tr>
			<tr>
				<th>고객등급(A:VIP/B:일반/C:직원)</th>
				<td><input type="text" name="grade" value="<%=dto.getGrade()%>"></td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td><input type="text" name="city" value="<%=dto.getCity() %>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">
					<input type="button" value="조회" onclick="location.href='<%=conPath %>/view/memberList.jsp'">
				</td>
			</tr>
		</table>
	</form>
</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>