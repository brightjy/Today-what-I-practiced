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
	<h3>쇼핑몰 회원등록</h3>
	<div>
		<form action="<%=conPath %>/view/modifyMemberPro.jsp" method="get">
			<table>
				<tr>
					<th>
						회원번호
					</th>
					<td>
						<% 
							int custno = 0;
							String custnoStr = request.getParameter("custno");
							custno = Integer.parseInt(custnoStr);
							MemberDao mDao = MemberDao.getInstance();
							MemberDto dto = mDao.getMember(custno);
						%>
						<input type="text" name="custno" value="<%=dto.getCustno() %>" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>
						회원성명
					</th>
					<td>
						<input type="text" name="custname" value="<%=dto.getCustname()%>">
					</td>
				</tr>
				<tr>
					<th>
						회원전화
					</th>
					<td>
						<input type="text" name="phone" value="<%=dto.getPhone()%>">
					</td>
				</tr>
				<tr>
					<th>
						회원주소
					</th>
					<td>
						<input type="text" name="address" value="<%=dto.getAddress()%>">
					</td>
				</tr>
				<tr>
					<th>
						가입일자
					</th>
					<td>
						<input type="date" name="joindate" value="<%=dto.getJoindate()%>">
					</td>
				</tr>
				<tr>
					<th>
						고객등급(A:Vip, B:일반, C:직원)
					</th>
					<td>
						<input type="text" name="grade" value="<%=dto.getGrade() %>">
					</td>
				</tr>
				<tr>
					<th>
						도시코드
					</th>
					<td>
						<input type="text" name="city" value="<%=dto.getCity()%>">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정">
						<input type="button" value="조회" onclick="location.href='<%=conPath%>/view/memberList.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>