<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>

body {
		font-family:'맑은 고딕', verdana;
		padding:0;
		margin:0;
	}
	
	ul{ padding:0; margin:0; list-style:none; }
	
	div#root{ width:90%; margin:0 auto; }
	
	header#header { font-size:60px; padding:20px 0; }
	header#header h1 a { color:#000; font-weight:bold; }
	
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
	
	section#container { }
	section#container::after { content:""; display:block; clear:both;}
	
	div#container_box { margin-left: 220px; margin-right: 100px; }
	div #container_box table th,td { padding : 20px 0 ; height:60px; }
	
	div #section_title { border-bottom : 3px solid #000000 }

	aside { float:left; width:200px; height:2000px;}
	aside ul { margin-top:10px; }
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0; }
	aside ul li a:hover { background:#eee; }
	
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px }
</style>
<title>Insert title here</title>
</head>
<body>
	<header id="header">
		<div id="header_box">
			<%@ include file="../header.jsp"%>
		</div>
	</header>
	
	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../nav.jsp" %>
		</div>
	</nav>
		<section id="container">
			<aside>
				<%@ include file="aside.jsp" %>
			</aside>
			<div id="container_box">
				<form name="formm" method="get" action="modify_user">
				<input type="hidden" name="grade" id="grade" value="${memberVO.grade}">
				<input type="hidden" name="password" id="password" value="${memberVO.password}">
				<input type="hidden" name="regdate" id="regdate" value="${memberVO.regdate}">
				<input type="hidden" name="birthdate" id="birthdate" value="${memberVO.birthdate}">
				<input type="hidden" name="useyn" id="useyn" value="${memberVO.useyn}">
				<table>
					<tr>
						<td colspan="2" style="height:100px;"><h1>회원 정보</h1></td>
					</tr>
					<tr>
						<th style="width:120px;">아이디</th>
						<td style="width:400px;"><input type="text" class="form-control" id="userid" name="userid" value="${memberVO.userid}" readonly="readonly"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" class="form-control" id="username" name="username" value="${memberVO.username}" readonly="readonly"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" class="form-control" id="email" name="email" value="${memberVO.email}" readonly="readonly"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" class="form-control" id="phone" name="phone" value="${memberVO.phone}" readonly="readonly"></td>
					</tr>
					<tr>
					<th>주소</th>
					<td>
							<input type="text" class="form-control" id="address" name="address" size="50" value="${memberVO.address}" readonly="readonly">
					</td>
					</tr>

				</table>
				</form>
			</div>
		</section>
	<footer id="footer">
		<%@ include file="../footer.jsp" %>
	</footer>
</body>
</html>