<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	caption{
		font-weight:bold;
	}
	td{
		padding:5px 0;
	}
	.lastRow{
		text-align:center;
	}
</style>
<script>
	function infoConfirm(){
		if(register_frm.custname.value.length==0){
			alert('회원성명이 입력되지 않았습니다.');
			register_frm.custname.focus();
			return;
		}
		if(register_frm.phone.value.length==0){
			alert('전화번호가 입력되지 않았습니다.');
			register_frm.custname.focus();
			return;
		}
		if(register_frm.phone.value.length!=0 && (register_frm.phone.value.indexOf('-')==-1 || register_frm.phone.value.indexOf('-')==register_frm.phone.value.lastIndexOf('-'))){
			alert('유효하지 않은 전화번호 형식입니다. 000-000-000 형식 요망');
			register_frm.phone.focus();
			return;
		}
		if(register_frm.address.value.length==0){
			alert('주소가 입력되지 않았습니다.');
			register_frm.address.focus();
			return;
		}
		if(register_frm.joindate.value.length==0){
			alert('가입 날짜가 입력되지 않았습니다.');
			register_frm.joindate.focus();
			return;
		}
		if(register_frm.grade.value.length==0){
			alert('고객등급이 입력되지 않았습니다.');
			register_frm.grade.focus();
			return;
		}
		if(register_frm.grade.value.length!=0 && (register_frm.grade.value!='A' && register_frm.grade.value!='B' && register_frm.grade.value!='C')){
			alert('고객등급은 반드시 A/B/C 중 하나의 알파벳으로만 기입하세요.');
			register_frm.grade.focus();
			return;
		}
		if(register_frm.city.value.length==0){
			alert('도시정보가 입력되지 않았습니다.');
			register_frm.city.focus();
			return;
		}
		if(register_frm.city.value.length>2){
			alert('도시정보는 2글자 이하로 입력하세요.');
			register_frm.city.focus();
			return;
		}
		register_frm.submit();
	}
alert('${registerResultMsg}');
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<section>
		<form action="memberRegister.do" method="get" name="register_frm">
			<table>
				<caption>홈쇼핑 회원등록</caption>
				<tr>
					<th>
						회원번호(자동발생)
					</th>
					<td>
						<input type="text" name="custno" value="${custno }" readonly="readonly">
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
						회원 전화
					</th>
					<td>
						<input type="text" name="phone">
					</td>
				</tr>
				<tr>
					<th>
						회원 주소
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
						고객등급(A:VIP,B:일반,C:직원)
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
					<td colspan="2" class="lastRow">
						<input type="button" value="등록" onclick="infoConfirm()">
						<input type="button" value="조회" onclick="location.href='memberList.do'">
					</td>
				</tr>
			</table>
		</form>
	</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>