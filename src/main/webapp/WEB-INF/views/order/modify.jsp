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

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="js/header.js"></script>

<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
			function update_btn(){
				document.formm.action = "modify_user";
				document.formm.submit();
			}
			
			function delete_btn(){
				var confirm = ("아이디를 삭제 하시겠습니까?");
				if(confirm == true){
					document.formm.action = "delete_user";
					document.formm.submit();	
				} else {
					return false;
				}
				
			}
</script>
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

	#btn { width: 520px;}

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
				<form method="post" name="formm" action="">	
				<table>
					<tr>
						<td colspan="2" style="height:100px;"><h1>회원 정보</h1></td>
					</tr>
					<tr>
						<th style="width:120px;">아이디</th>
						<td style="width:600px;"><input type="text" class="form-control" name="userid" value="${member.userid}" readonly="readonly"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" class="form-control" name="username" value="${member.username}"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" class="form-control" name="email" value="${member.email}" ></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<div class="form-inline">
							<input type="text" name="phone1" class="form-control" style="width:60px;" value="010" readonly="readonly">&emsp;-&emsp;
							<input type="text" name="phone2" class="form-control" style="width:60px;">&emsp;-&emsp;
							<input type="text" name="phone3" class="form-control" style="width:60px;">
							</div>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="2" >
							<input type="text" class="form-control" name="address" size="50" value="${member.address}">
						</td>
					</tr>
				</table><br>
						<div>
							<div id="btn_left" style="width:50%; float:left">
							<input type="submit" name="update_btn" class="btn btn-primary" onclick="update_btn()" value="확인">
							<input type="button" name="back_btn" class="btn btn-default" onclick="location:history.go(-1)" value="뒤로가기">
							</div>
							<div id="btn_right" style="width:50%; float:right">
							<button type="button"  id="delete_btn" class="btn btn-danger" onclick="delete_btn()">탈퇴</button>
							</div>
						</div>
				</form>
			</div>
		</section>
	<footer id="footer">
		<%@ include file="../footer.jsp" %>
	</footer>
</body>
</html>