<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<script>
	function qnaRegister(){
		document.formm.action = "qna_register";
		document.formm.submit();
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
	aside { float:left; width:200px; height:2000px; }
	div#container_box { margin-left: 220px; margin-right: 100px;}
	
	div #section_title { border-bottom : 3px solid #000000 }
	
	#table th { padding: 20px;  text-align:center;}
	#table td { padding : 20px; margin: auto; }
	
	div #btn_list { padding: 20px 0; float:right;}
	
	div #product_l { width:30%; float:left; text-align:right;}
	div #product_l img { width: 120px; height:80px;}
	div #product_r { width:60%; float:right; text-align:left; height: 80px; padding: 0 5;}
	
	div #cart_btn { margin-top : 15px;}
	
	aside ul { margin-top:10px; }
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0; }
	aside ul li a:hover { background:#eee; }
	
	.pull-center {text-align:center;}
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px }
	
</style>
<title>QNA LIST</title>
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
			<h2>Q & A 고객 게시판</h2>
			<hr>
			<form method="post" action="" name="formm">
			<div>
				<table id="table">
					<tr>
						<td colspan="2" style="border-bottom:2px solid #000000; border-top:2px solid #000000">
							<span><strong>고객님의 질문에 대해서 운영자가 1:1 답변을 드립니다.</strong></span>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" placeholder="질문을 입력하세요."></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="5" cols="80" name="content" placeholder="질문 내용을 입력하세요."></textarea></td>
					</tr>
				</table>
			</div>
			<div class="btn-group" style="float:left;">
				<button type="button" class="btn btn-success" onclick="qnaRegister()">문의하기</button>
			</div>
			</form>
			</div>
		</section>
	<footer id="footer">
		<%@ include file="../footer.jsp" %>
	</footer>
</body>
</html>