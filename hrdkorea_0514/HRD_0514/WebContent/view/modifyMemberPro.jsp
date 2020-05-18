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
	int custno = 0;
	String custnoStr = request.getParameter("custno");
	custno = Integer.parseInt(custnoStr);
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
	int result = mDao.updateMember(custno, custname, phone, address, joindate, grade, city);
	if(result==1){%>
		<script>
			alert('회원정보 수정이 완료되었습니다.');
			location.href='<%=conPath%>/view/modifyMemberView.jsp';
		</script>
	<%}else{%>
		<script>
			alert('회원 정보 수정 실패');
			location.href='<%=conPath%>/view/modifyMemberView.jsp';
		</script>
	<%}
%>	
</body>
</html>