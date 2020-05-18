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
			return;
		}
		if(info.phone.value.length==0){
			alert('회원 전화번호가 입력되지 않았습니다.');
			info.phone.focus();
			return;
		}
		if(info.phone.value.length!=0 && info.phone.value.indexOf('-')==-1){
			alert('전화번호는 000-0000-0000 형식으로 입력하세요.');
			info.phone.focus();
			return;
		}
		if(info.phone.value.length!=0 && info.phone.value.indexOf('-')==info.phone.value.lastIndexOf('-')){
			alert('전화번호는 000-0000-0000 형식으로 입력하세요.');
			info.phone.focus();
			return;
		}
		if(info.address.value.length==0){
			alert('회원 주소가 입력되지 않았습니다.');
			info.address.focus();
			return;
		}
		if(info.joindate.value.length==0){
			alert('회원 가입일이 입력되지 않았습니다.');
			info.joindate.focus();
			return;
		}
		if(info.grade.value.length==0){
			alert('회원 등급이 입력되지 않았습니다.');
			info.grade.focus();
			return;
		}
		if(info.grade.value.length!=0 && (info.grade.value!='A' && info.grade.value!='B' && info.grade.value!='C')){
			alert('회원 등급은 A/B/C 중 하나로만 입력하세요.');
			info.grade.focus();
			return;
		}
		if(info.city.value.length==0){
			alert('회원 도시코드가 입력되지 않았습니다.');
			info.city.focus();
			return;
		}
		if(info.city.value.length!=0 && info.city.value.length>2){
			alert('회원 도시코드는 2글자로만 입력하세요.');
			info.city.focus();
			return;
		}
		info.submit();
	}
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<div>
	<h3>쇼핑몰 회원등록</h3>
	<div>
		<form action="<%=conPath %>/view/registerMemberPro.jsp" method="get" name="info">
			<table>
				<tr>
					<th>
						회원정보(자동생성)
					</th>
					<td>
						<% MemberDao mDao = MemberDao.getInstance();
						   int custno = mDao.custno();
						%>
						<input type="text" name="custno" value="<%=custno %>" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>
						회원성명
					</th>
					<td>
						<input type="text" name="custname">
					</td>
				</tr>
				<tr>
					<th>
						회원전화
					</th>
					<td>
						<input type="text" name="phone">
					</td>
				</tr>
				<tr>
					<th>
						회원주소
					</th>
					<td>
						<input type="text" name="address">
					</td>
				</tr>
				<tr>
					<th>
						가입일자
					</th>
					<td>
						<input type="date" name="joindate">
					</td>
				</tr>
				<tr>
					<th>
						고객등급(A:Vip, B:일반, C:직원)
					</th>
					<td>
						<input type="text" name="grade">
					</td>
				</tr>
				<tr>
					<th>
						도시코드
					</th>
					<td>
						<input type="text" name="city">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="등록" onclick="infoConfirm()">
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