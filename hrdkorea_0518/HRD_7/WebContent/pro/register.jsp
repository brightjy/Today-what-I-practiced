<%@page import="com.hrd.dao.MemberDao"%>
<%@page import="java.sql.Date"%>
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
<%
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindateStr = request.getParameter("joindate");
	Date joindate = null;
	if(!joindateStr.equals("")){
		joindate = Date.valueOf(joindateStr);
	}
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	MemberDao mDao = MemberDao.getInstance();
	int result = mDao.registerMember(custname, phone, address, joindate, grade, city);
	if(result==1){%>
		<script>
			location.href="<%=conPath%>/view/memberList.jsp";
			alert('회원등록이 완료되었습니다.');
		</script>
	<%}else{%>
		<script>
		location.href="<%=conPath%>/view/memberList.jsp";
		alert('회원등록이 실패되었습니다.');
	</script>		
	<%}%>	
</body>
</html>