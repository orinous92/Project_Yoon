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
	
	
	#list_cate_wrap ul { border : 1px solid #000000; width:90%; margin-left:50px;}
	#list_cate_wrap li { display:inline; padding: 0 10px; }
	#list_cate_wrap label { width:9%; text-align: center; }
	#list_cate_wrap label input { margin-top: 8px;}
	#list .product { height: 220px; text-align:center; margin-bottom: 20px; padding: 20px;}
	.img-fluid { width: 200px; height: 150px;}
	
</style>
<title>바이크핏 - Motorcycle</title>
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
				<div id="list">
					<div class="row">
						<c:forEach items="${productCateList}" var="productCateList">
							<div class="col-md-6 col-lg-3">
								<div class="product">
									<a href="product_view?pno=${productCateList.pno}" class="img-prod"><img class="img-fluid" src="uploadImg/${productCateList.image}"></a>
									<p><a href="#"><img class="view_max" src="uploadImg/view_max.gif" onclick="window.open('uploadImg/${productCateList.image}','_blank_1', 'toolbar-no, menubar=no,' +
									' scrollbars=yes, resizable=no, width=550px, height=400px, top=150, left=300')"/></a></p>
									<p><span><fmt:formatNumber value="${productCateList.price}" pattern="###,###,###"/>원</span></p>
									<p><span><a href="product_view?pno=${productCateList.pno}">${productCateList.pname}</a></span></p>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</section>
	<footer id="footer">
		<%@ include file="../footer.jsp" %>
	</footer>
</body>
</html>