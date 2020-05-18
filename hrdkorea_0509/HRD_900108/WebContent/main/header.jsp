<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin:0 auto;		
	}
	header{
		height:100px;
		background-color:blue;
	}
	header h2{
		text-align:center;
		line-height:100px;
		color:white;
	}
	nav{
		background-color:purple;
		padding:5px 0 5px 30px;
	}
	nav a{
		color: white;
		font-weight:bold;
		padding-right:50px;
	}
	section{
		padding: 30px 0 0 20px;
		height:500px;
	}
	section h3{
		text-align:center;
		margin-bottom:20px;
	}
	footer{
		height:100px;
		background-color:blue;
	}
	footer h4{
		text-align:center;
		line-height:100px;
		color:white;
	}
</style>
</head>
<body>
	<header>
		<h2>쇼핑몰 회원관리 ver 1.0</h2>
	</header>
	<nav>
		<a href="memberReigsterView.do">회원 등록</a>
		<a href="memberList.do">회원 목록 조회/수정</a>
		<a>회원 매출 조회</a>
		<a href="main.do">홈으로.</a>
	</nav>
</body>
</html>