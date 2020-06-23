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
<script type="text/javascript">
//password 체크 스크립트
function pwdCheckFunction(){
	var userPwd1 = $('#password').val();
	var userPwd2 = $('#passwordCheck').val();
	
	if(userPwd1 != userPwd2){
		
		$('#passwordCheckmessage').html('비밀번호가 서로 일치하지 않습니다.');
	} else {
		$('#passwordCheckmessage').html('');
	}
}
		
</script>
<style>
#container { height: 600px; width:500px; margin: 0 auto;}


#pwd_upd div { text-align:center; padding : 10 0 ;}
#userid { color : red; }

#pwdresult { padding : 10px;  border : 1px solid #000000; }
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
				<div style="align:center">
					<h3>비밀번호 찾기 결과</h3><br><br>
					<form method="post" action="" name="formm" id="pwdresult">
						<div id="pwd_upd" class="form-group">
							<c:if test="${message == 1}">
								<input type="hidden" name="userid" value="${user.userid}">
								<div class="form-inline" >입력하신 아이디 &emsp;:&emsp;<input type="text" id="userid" class="form-control" readonly="readonly" value="${user.userid}"></div>					
								<div class="form-inline" ><input type="password" onkeyup="pwdCheckFunction()" class="form-control" placeholder="새 비밀번호 "  name="password" maxlength="20"  size="60"></div>
								<div class="form-inline" ><input type="password" onkeyup="pwdCheckFunction()" class="form-control" placeholder="새 비밀번호 확인"  name="passwordCheck" maxlength="20"  size="60"></div>
								<div class="form-inline" ><input type="button" class="btn btn-danger" value="수정" onclick="upd_pwd()"></div>
							</c:if>
							<c:if test="${message == -1}">
								입력된 정보가 없습니다.
								<input type="button" class="btn btn-default" value="돌아가기" onclick="history.go(-1)">
							</c:if>
							<script>
								function upd_pwd(){
									alert("비밀번호가 변경 되었습니다.")
									document.formm.action="upd_pwd"
									document.formm.submit();	
								}
					
							</script>
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