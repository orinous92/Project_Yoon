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
#container { height: 600px;}
#login_box { width:500px; margin: 0 auto; }

.form { margin: 10% auto; padding :20px;}

#userid_form { padding : 0 30 0 30;}
#pwd_form { padding : 0 30 0 30;}

section #content { margin-top:30px;}
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
				<div id="login_box">
				<form class="jumbotron" method="post" autocomplete="off" role="form">
					<div class="form-group" style="margin-bottom:20px;">
						<h3 style="text-align:center;"> 로그인 </h3>
					</div>
					<div id="userid_form"  class="form-group ">
						<label for="userid">ID</label>
						<input type="text" id="userid" name="userid" class="form-control" placeholder="ID" required="required" size=10/>
					</div>
					
					<div id="pwd_form" class="form-group">
						<label for="password">비밀번호</label>
						<input type="password" id="password" name="password" class="form-control" placeholder="Password" required="required"/>
					</div>
					<div class="form-group" style="text-align:center; padding:20px;">
						<button type="submit" id="signin_btn" class="btn btn-primary">로그인</button>&emsp;&emsp;
						<button type="button" id="signup_btn" class="btn btn-success">회원가입</button>
					</div>
					<script type="text/javascript">
						var formUser = $("form[role='form']");
					
						 $("#signin_btn").click(function(){
							 formUser.attr("action", "signin");
							 formUser.attr("method", "post")
							 formUser.submit();
						});
						 
						 $("#signup_btn").click(function(){
							 formUser.attr("action", "contract");
							 formUser.attr("method", "get")
							 formUser.submit();
						});
					</script>
					<div class="form-group" style="text-align:center;">
						<a href="find_id" >아이디 찾기 / 비밀번호 찾기</a>
					</div>	
				</form>
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