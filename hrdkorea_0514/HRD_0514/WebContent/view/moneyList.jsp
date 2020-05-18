<%@page import="com.hrd.dto.MoneyDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hrd.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h3>회원매출조회</h3>
	<div>
		<table>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			<%
				MemberDao mDao = MemberDao.getInstance();
				ArrayList<MoneyDto> dtos = mDao.MoneyList();
				for(MoneyDto dto : dtos){%>
			<tr>
				<td><%=dto.getCustno() %></td>
				<td><%=dto.getCustname() %></td>
				<td><%=dto.getGrade() %></td>
				<td><%=dto.getMoney() %></td>
			</tr>
				<%}%>
		</table>
	</div>
</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>