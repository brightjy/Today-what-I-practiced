<%@page import="com.hrd.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function infoConfirm(){
		if(info.custname.value.length==0){
			alert('회원성명이 입력되지 않았습니다.');
			info.custname.focus();
			return false;
		}
		if(info.phone.value.length==0){
			alert('회원전화번호가 입력되지 않았습니다.');
			info.phone.focus();
			return false;
		}
		if(info.phone.value.length!=0 && info.phone.value.indexOf('-')==-1){
			alert('회원전화번호는 000-0000-0000 형식으로 입력해주세요.');
			info.phone.focus();
			return false;
		}
		if(info.phone.value.length!=0 && info.phone.value.indexOf('-')==info.phone.value.lastIndexOf('-')){
			alert('회원전화번호는 000-0000-0000 형식으로 입력해주세요.');
			info.phone.focus();
			return false;
		}
		if(info.address.value.length==0){
			alert('회원주소가 입력되지 않았습니다.');
			info.address.focus();
			return false;
		}
		if(info.joindate.value.length==0){
			alert('회원가입일자가 입력되지 않았습니다.');
			info.joindate.focus();
			return false;
		}
		if(info.grade.value.length==0){
			alert('회원등급이 입력되지 않았습니다.');
			info.grade.focus();
			return false;
		}
		if(info.grade.value.length!=0 && (info.grade.value!='A' && info.grade.value!='B' && info.grade.value!='C')){
			alert('회원등급은 A/B/C 중 하나로만 입력하세요.');
			info.grade.focus();
			return false;
		}
		if(info.city.value.length==0){
			alert('회원도시정보가 입력되지 않았습니다.');
			info.city.focus();
			return false;
		}
		if(info.city.value.length>2){
			alert('회원도시정보는 2글자 이내로만 입력하세요.');
			info.city.focus();
			return false;
		}
		info.submit();
	}
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<div>
	<h3>홈쇼핑 회원등록</h3>
	<form action="<%=conPath %>/pro/register.jsp" method="get" name="info">
	<%
		MemberDao mDao = MemberDao.getInstance();
		int custno = mDao.custno();
	%>
		<table>
			<tr>
				<th>회원번호(자동발생)</th>
				<td><input type="text" name="custno" value="<%=custno%>"></td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text" name="custname"></td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type="date" name="joindate"></td>
			</tr>
			<tr>
				<th>고객등급(A:VIP/B:일반/C:직원)</th>
				<td><input type="text" name="grade"></td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td><input type="text" name="city"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="등록" onclick="infoConfirm()">
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