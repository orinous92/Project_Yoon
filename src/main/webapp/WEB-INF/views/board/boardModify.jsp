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


<style>
	body {
		font-family:'맑은 고딕', verdana;
		padding:0;
		margin:0;
	}
	
	ul{ padding:0; margin:0; list-style:none; }
	
	
	header#header { font-size:60px; padding:20px 0; }
	header#header h1 a { color:#000; font-weight:bold; }
	
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
	
	
	section#container::after { content:""; display:block; clear:both;}
	aside { float:left; width:200px; height:2000px; }
	div#container_box { margin-left: 320px; width:1220px; }
	
	div #section_title { border-bottom : 3px solid #000000 }
	
	div #product_info_left {  width:50%; float:left; }
	div #product_info_left #info_title{ text-align:center; padding:20px 0 ; border-bottom:2px solid #000000; }
	
	div #product_info_right { width:50%; float:right; padding: 20px;}
	div #product_info_right #board_img { width: 500px; height:400px; padding: 40px 10px; margin-left:30px; margin-top:30px;}
	
	div #info_content h4 { padding:10px;}
	
	#content_table th { padding: 10px; }
	#content_table td { padding: 10px; }
	
	div #cart_btn { margin-top : 15px;}
	
	aside ul { margin-top:10px; }
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0; }
	aside ul li a:hover { background:#eee; }
	
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px }
	
	.select_img img {width:500px; height:400px;}
	
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
				<div id="section_title">
					<h2>Board Modify</h2>
				</div>
				<div id="product_info">
				<div id="product_info_left">
					<div id="info_title">
					<p><span style="color:#b2b2b2">BIKEFIT 게시판 수정 화면입니다. 신중하게 수정하세요.</span></p>
					</div>
					<div id="info_content">
					<form method="post" name="formm" action="board_modify" enctype="multipart/form-data">
					<p><h4>Board Modify</h4></p>
						<table id="content_table">
							<tr>
								<th>상품번호 </th>
								<td>
									${boardVO.bno }
									<input type="hidden" name="bno" value="${boardVO.bno}">
								</td>
							</tr>
							<tr>
								<th>게시물 조회수 </th>
								<td>${boardVO.viewcnt}</td>
							</tr>
							<tr>
								<th>게시물 작성자 </th>
								<td>
									${boardVO.writer }
									<input type="hidden" name="writer" value="${boardVO.writer}">
								</td>
							</tr>
							<tr>
								<th style="width:150px;">게시물 제목 </th>
								<td style="width:500px;"><input type="text" name="title" value="${boardVO.title }"></td>
							</tr>
							<tr>
								<th>게시물 내용 </th>
								<td><textarea cols="50" rows="8" name="content">${boardVO.content}</textarea></td>
							</tr>
							
						</table>
						<div id="cart_in" style="text-align:center; padding:50px;">
							<button type="submit" class="btn btn-dark " name="modify_board">수정</button>&emsp;&emsp;
							<a href="board_delete?bno=${boardVO.bno}" class="btn btn-danger " name="delete_board">삭제</a>&emsp;&emsp;
							<button type="button" class="btn btn-primary" name="order_in" onclick="history.go(-1)">목록</button>
						</div>
						</form>
					</div>
				</div>
				<div id="product_info_right">
						<label for="image">게시물 이미지</label>&emsp;&emsp;
						<div class="select_img">
							<c:if test="${empty boardVO.image}">
								<img src="img/noimage.gif">
							</c:if>
							<c:if test="${!empty boardVO.image}">
								<img src="uploadImg/${boardVO.image}">
							</c:if>
						</div><br><br>
				
				</div>
			</div>
			</div>
		</section>
	<footer id="footer">
		<%@ include file="../footer.jsp" %>
	</footer>
</body>
</html>