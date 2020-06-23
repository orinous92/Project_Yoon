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

<script type="text/javascript">
					function del_cart(){
						var count = 0;
						
						// 삭제할 항목이 하나인 경우 배열로 인식을 못하므로 이렇게..
						if(document.formm.select.length == undefined){
							if(document.formm.select.checked == true){
								count++;
							}
						}
						
						// 삭제할 항목이 체크되어 있는지 개수 확인
						for(var i = 0; i < document.formm.select.length; i++){
							if(document.formm.select[i].checked == true){
								count++;
							}
						}
						
						if(count == 0){
							alert("삭제 할 항목을 선택해 주세요!");
						} else {
							document.formm.action = "cart_delete";
							document.formm.submit();
						}
					}
					
					function go_order_insert() {
						if(confirm("주문하시겠습니까?")){
							document.formm.action = "order_insert";
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
	
	section#container { }
	section#container::after { content:""; display:block; clear:both;}
	aside { float:left; width:200px; height:2000px; }
	div#container_box { margin-left: 220px; margin-right: 100px;}
	
	div #section_title { border-bottom : 3px solid #000000 }
	
	div #container_table { width:1580px; text-align:center; }
	div #container_table th { padding: 30px 0 ; ; border-bottom : 2px solid #000000; ; text-align:center;}
	div #container_table td { height: 120px; padding : 10px 0 ; margin: auto; border-bottom : 1px solid gray;}
	
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
					<h3><strong>장바구니</strong></h3>
					<br>
				</div>
				<form name="formm" method="post">
				<div id="container_table">
					<table style="width:1580px;">
							<tr>
								<th style="width:5%"><input type="checkbox" name="select"></th>
								<th style="width:35%">상품 정보</th>
								<th style="width:10%">주문 일자</th>
								<th style="width:10%">주문 번호</th>
								<th style="width:15%">주문 금액(수량)</th>
								<th style="width:25%">주문 상태</th>
							</tr>
						<c:choose>
							<c:when test="${cartList.size() == 0 }">
								<tr>
									<td colspan="6" style="height:300px; text-align: center;">
										<h3 style="color : #777777; ">장바구니가 비었습니다.</h3>
									</td>
								</tr>
							</c:when>
						<c:otherwise>
						<c:forEach items="${cartList}" var="cartVO">
							<tr>
								<td><input type="checkbox" name="cno" value="${cartVO.cno}"></td>
								<td>
									<div id="product">
										<div id="product_l">
											<img src="uploadImg/${cartVO.image}">
										</div>
										<div id="product_r">
											<a href="product_view?pno=${cartVO.pno}" >${cartVO.pname}</a>
										</div>
									</div>
								</td>
								<td><fmt:formatDate value="${cartVO.indate}" pattern="yyyy-MM-dd"/></td>
								<td>${cartVO.pno}</td>
								<td>
									<fmt:formatNumber value="${cartVO.price * cartVO.quantity}" type="currency"/>
									<br>(&nbsp;${cartVO.quantity}&nbsp;개&nbsp;)
								</td>
								<td>
									<c:if test="${cartVO.result eq '1'}">
										<span>미주문</span>&emsp;&emsp;&emsp;<input type="button" name="ok_btn" class="btn btn-primary" value="주문하기" onclick="go_order_insert()">
									</c:if>
								</td>
							</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
						<tr>
							<td colspan="6" style="text-align: right; height:60px; padding:20px;">
								<span>최종 결제 금액 : <fmt:formatNumber value="${totalPrice}" pattern="###,###,###,###"/>&nbsp;원</span>
							</td>
						</tr>
					</table>
					<input type="hidden" name="userid" value="${cartVO.userid}">
				</div><br>
				<div id="del_btn">
						<button type="button" class="btn btn-default" name="del_cart" onclick="del_cart()">선택삭제</button>
				</div>
				<div id="buttons" style="text-align: center">
						<input type="button" class="btn btn-dark" value="쇼핑 계속하기" name="go_shop" onclick="location='index'">
				</div>
				</form>
			</div>
		</section>
	<footer id="footer">
		<%@ include file="../footer.jsp" %>
	</footer>
</body>
</html>