<%@page import="com.hrd.dto.SumPriceDto"%>
<%@page import="java.util.ArrayList"%>
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
	<h3>회원목록 조회/수정</h3>
	<table>
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>고객등급</th>
			<th>매출</th>
		</tr>
		<%
			MemberDao mDao = MemberDao.getInstance();
			ArrayList<SumPriceDto> dtos = mDao.sumPriceList();
			for(SumPriceDto dto : dtos){%>
		<tr>
			<td>
				<a href="<%=conPath %>/view/updateMember.jsp?custno=<%=dto.getCustno() %>"><%=dto.getCustno() %></a>
			</td>
			<td><%=dto.getCustname() %></td>
			<%
				String grade = dto.getGrade();
				if(grade.equals("A")){
					grade="VIP";
				}else if(grade.equals("B")){
					grade="일반";
				}else{
					grade="직원";
				}
			%>
			<td><%=grade %></td>
			<td><%=dto.getSum_price() %></td>
		</tr>		
			<%}%>
	</table>
</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>