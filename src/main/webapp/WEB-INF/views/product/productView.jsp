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



<script>
	function cart_in(){
		if (document.formm.quantity.value == "") {
			alert("수량을 입력해 주세요!");
			document.formm.quantity.focus;
		} else {
			document.formm.action = "cart_insert";
			document.formm.submit();
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
	

	section#container::after { content:""; display:block; clear:both;}
	aside { float:left; width:200px; height:2000px; }
	div#container_box { margin-left: 320px; width:1200px; }
	
	div #section_title { border-bottom : 3px solid #000000 }
	
	div #product_info_left {  width:50%; float:left; }
	div #product_info_left #product_img { width: 500px; height: 500px; padding: 80px 10px; left:0; right:0; margin-left:auto; margin-right:auto;}
	
	div #product_info_right { width:50%; float:right; }
	div #product_info_right #info_title{ text-align:center; padding:20px 0 ; border-bottom:2px solid #000000; }
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
					<h2>Product Info</h2>
				</div>
				<div id="product_info">
				<div id="product_info_left">
					<img id="product_img" src="uploadImg/${productVO.image}">
				</div>
				<div id="product_info_right">
					<div id="info_title">
					<p><span style="color:#b2b2b2">BIKEFIT을 포함한 제한된 판매처에서만 구입이 가능합니다.</span></p>
					</div>
					<div id="info_content">
					<form method="post" name="formm" action="cart_insert">
					<p><h4>Product Info</h4></p>
						<table id="content_table">
							<tr>
								<th>상품번호 </th>
								<td>
									${productVO.pno }
									<input type="hidden" name="pno" value="${productVO.pno}">
								</td>
								
							</tr>
							<tr>
								<th style="width:150px;">상품명 </th>
								<td style="width:350px;">${productVO.pname }</td>
							</tr>
							<tr>
								<th>상품소개 </th>
								<td>${productVO.pdesc }</td>
							</tr>
							<tr>
								<th>상품가격 </th>
								<td><fmt:formatNumber value="${productVO.price }" pattern="###,###,###,###원"/></td>
							</tr>
							<tr>
								<th>상품재고 </th>
								<td>${productVO.inventory}&emsp;EA</td>
							</tr>
							<tr>
								<th>수량 </th>
								<td><input type="text" name="quantity" size="1" value=1></td>
							</tr>
						</table>
						<div id="cart_in" style="text-align:center; padding:50px;">
							<button type="submit" class="btn btn-dark submit" name="cart_in">장바구니 담기</button>&emsp;&emsp;
							<button type="button" class="btn btn-primary" name="order_in" onclick="history.go(-1)">뒤로가기</button>
						</div>
						</form>
					</div>
				</div>
				<div id="product_info_comment">
					<%@include file="comment.jsp" %>  
				</div>
				</div>
			</div>
		</section>
	<footer id="footer">
		<%@ include file="../footer.jsp" %>
	</footer>
</body>
</html>