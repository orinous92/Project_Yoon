<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	div #product_info_right { width:50%; float:right; }
	div #product_info_right #board_img { width: 500px; height:400px; padding: 40px 10px; left:0; right:0; margin-left:auto; margin-right:auto;}
	
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
					<h2>Board Detail</h2>
				</div>
				<div id="product_info">
				<div id="product_info_left">
					<form method="get" name="formm">
					<div id="info_title">
					<p><span style="color:#b2b2b2">BIKEFIT 게시판을 이용해주셔서 감사합니다. </span>&emsp;&emsp;
							<c:if test="${sessionScope.member.userid == boardVO.writer}">
								<button type="button" class="btn btn-dark " name="modify_board" onclick="location.href='board_modify?bno=${boardVO.bno}'">수정하기</button>&emsp;
							</c:if>
								<button type="button" class="btn btn-primary" name="board_list" onclick="location.href='board_list'">목록</button>
					</p>
					</div>
					<div id="info_content">
					
					<p><h4>Board Detail</h4></p>
						<table id="content_table">
							<tr>
								<th>게시물 번호 </th>
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
								<td>${boardVO.writer }</td>
							</tr>
							<tr>
								<th style="width:150px;">게시물 제목 </th>
								<td style="width:350px;">${boardVO.title }</td>
							</tr>
							<tr>
								<th>게시물 내용 </th>
								<td>${boardVO.content}</td>
							</tr>
						</table>
						</div>
						</form>
					</div>
				<div id="product_info_right">
					<c:if test="${!empty boardVO.image}">
						<img id="board_img" src="uploadImg/${boardVO.image}">
					</c:if>
					<c:if test="${empty boardVO.image}">
						<img id="board_img" src="img/noimage.gif">
					</c:if>
					<input type="hidden" name="image" value="${boardVO.image}">
				</div>
				
				<div id="product_info_comment">
					<%@include file="board_comment.jsp" %> 
				</div>
				</div>
			</div>
		</section>
	<footer id="footer">
		<%@ include file="../footer.jsp" %>
	</footer>
</body>
</html>