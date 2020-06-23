<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

<style>
#container { height: 600px; width:500px; margin: 0 auto;}

.form { margin: 10% auto; padding :20px;}

#findPwd div { padding : 0 20px; }

</style>

<title>로그인 화면</title>
</head>
<body>
<div id="root">
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
		<div id="container_box">
			<section id="content">
				<div class="finduser-nav" style="text-align:center; margin-bottom: 30px;">
					<ul class="nav nav-pills">
						<li role="presentation"><a href="find_id">아이디 찾기</a></li>
						<li role="presentation" class="active"><a href="#">비밀번호 찾기</a></li>
					</ul>
				</div>
				<div class="jumbotron" style="padding-top:20px;">
						<form method="post" action="" id="findPwd" name="findPwd">
							<div class="form-group">
							<h3 style="text-align:center;">비밀번호 찾기</h3>
							</div><br>
							<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userid" maxlength="20">
					</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="이름" name="username" maxlength="20">
							</div>
							<div class="form-group">
								<input type="email" class="form-control" placeholder="이메일" name="email" maxlength="20">
							</div>
							<div class="form-group" style="margin-top:60px;">
								<input type="button" class="btn btn-primary form-control" value="비밀번호 찾기" onclick="findMemberPwd()">
							</div>
					</form>
					<script type="text/javascript">
						function findMemberPwd(){
							if(document.findPwd.userid.value == ""){
								alert("아이디를 입력 해 주세요.");
								document.findPwd.userid.focus();
								return false;
							} else if(document.findPwd.username.value == ""){
								alert("이름을 입력 해 주세요.");
								document.findPwd.username.focus();
								return false;
							} else if(document.findPwd.email.value == ""){
								alert("이메일을 입력 해 주세요.");
								document.findPwd.email.focus();
								return false;
							} else {
								document.findPwd.action = "find_pwd"; // 요청 문자열
								document.findPwd.submit();
							}
						}
					</script>
				</div>
			</section>
		</div>
	</section>
	
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../footer.jsp" %>
		</div>
	</footer>
</div>
</body>
</html>