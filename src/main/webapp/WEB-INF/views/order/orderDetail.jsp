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
	
	div #container_table { width:1580px; }
	
	div #table_member th { padding: 20px 0 ; ; border-bottom : 2px solid #b2b2b2; border-top : 2px solid #b2b2b2; text-align:center; background-color:#b2b2b2; color:white;}
	div #table_member td { height: 50px; padding : 10px 0 ; margin: auto; border-bottom : 2px solid #000000; text-align:center;}
	
	div #table_product th { padding: 20px 0 ; ; border-bottom : 2px solid #b2b2b2; border-top : 2px solid #b2b2b2; text-align:center; background-color:#b2b2b2; color:white;}
	div #table_product td { height: 50px; padding : 10px 0 ; margin: auto; border-bottom : 2px solid #000000; text-align:center;}
	
	div #product_l { width:30%; float:left; text-align:right;}
	div #product_l img { width: 120px; height:80px;}
	div #product_r { width:60%; float:right; text-align:left; height: 80px; padding: 0 5;}
	
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
					<h3><strong>My Order Page (주문 상세 정보)</strong></h3><br>
				</div><br><br>
				<form name="formm" method="post">
				<div id="container_table">
					<div id="table_member">
					<span style="color:#b2b2b2"><h4>Member Info</h4></span>
					<table style="width:1580px;" id="orderList">
							<tr>
								<th>주문 일자</th>
								<th>주문 번호</th>
								<th>주문자</th>
								<th>주문 총액</th>
							</tr>
							<tr>
								 <td><fmt:formatDate value="${orderDetail.indate}" type="date" /></td> 
								 <td>${orderDetail.ono}</td>
							     <td>${orderDetail.mname}</td>
							     <td><fmt:formatNumber value="${orderDetail.price}" type="currency"/></td>
							</tr>
					</table>
					</div><br><br><br><br>
					<div id="table_product">
					<span style="color:#b2b2b2"><h4>Product Info</h4></span>
					<table id="cartList" style="width:1580px;">
						<tr>
							<th>상품명</th>
							<th>상품별 주문번호</th>
							<th>수량</th>
							<th>가격</th>
							<th>처리 상태</th>
						</tr>
						<c:forEach items="${orderList}" var="orderVO">
							<tr>
								<td>${orderVO.pname }</td>
								<td>${orderVO.odno }</td>
								<td>${orderVO.quantity }</td>
								<td>
									<fmt:formatNumber type="currency" value="${orderVO.price * orderVO.quantity}"/>
								</td>
								<td>
									<c:choose>
										<c:when test='${orderVO.result == "1" }'> 진행중 </c:when>
										<c:otherwise>
											<span style="color:red"> 처리완료</span>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>	
					</table>
					</div>
				</div><br>
				<div id="buttons" style="text-align: center">
					<input type="button" class="btn btn-dark" value="쇼핑 계속하기" name="go_index" onclick="location='index'">
					<input type="button" class="btn btn-default" value="뒤로" name="go_back" onclick="history.go(-1)">
				</div>
				</form>
			</div>
		</section>
	<footer id="footer">
		<%@ include file="../footer.jsp" %>
	</footer>
</body>
</html>