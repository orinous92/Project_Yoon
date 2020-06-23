<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<title>메인화면</title>
	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<script src="js/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="js/bootstrap.min.js"></script>


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
	
	section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee;}
	section#container::after { content:""; display:block; clear:both;}
	aside { float:left; width:200px; height:2000px;}
	
	div#container_box { width:1400px; margin-left: 220px;}
	
	#product_list { border:1px solid #FFFFFF; }
	#product_list th { width:120px; padding: 10 5 ; text-align:center; background-color:#007BFF; color:white; }
	#product_list td { width:350px; padding: 10 5 ; text-align:left;  }
	#container_title { width:1000px; border-bottom : 2px solid #000000; }
	
	#product_list td select { width:150px; }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0; }
	aside ul li a:hover { background:#eee; }
	
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px }
	
	
	#product_list td img { width:400px; height:300px;margin:20px 0; }
</style>
</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp"%>
		</div>
	</header>
	
	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/nav.jsp" %>
		</div>
	</nav>
	
	<section id="container">
		<aside>
			<%@ include file="../include/aside.jsp" %>
		</aside>
		<div id="container_box">
			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data" name="formm">
			<div id="container_title">
			<h2>Product Detail</h2>
			<br>
			</div><br>
			<br>
			<table id = "product_list">
				<tr>
					<th>상품 분류</th>
					<td colspan="3">
						<c:if test="${productVO.cateName == '1'}">
							MOTORCYCLE
						</c:if>
						<c:if test="${productVO.cateName == '2'}">
							HELMET
						</c:if>
						<c:if test="${productVO.cateName == '3'}">
							EQUIPMENT
						</c:if>
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td colspan="3">${productVO.pname}</td>
				</tr>
				<tr>
					<th>상품 가격</th>
					<td>${productVO.price}&nbsp;원</td>
					<th>상품 재고</th>
					<td>${productVO.inventory}&nbsp;EA</td>
				</tr>
				<tr>
					<th>상품소개</th>
					<td colspan="3">${productVO.pdesc }</td>
				</tr>
				<tr>
					<th>이미지</th>
					<td colspan="3">
						<c:choose>
						<c:when test="${productVO.image != null }">
							<img src="uploadImg/${productVO.image}" />
						</c:when>
						<c:otherwise>
							<img src="img/noimage.gif">
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<div class="inputArea" style="text-align:center;">
							 <button type="button" id="modify_btn" class="btn btn-danger" onclick="go_modify()">수정</button>
							 <button type="button" id="list_btn" class="btn btn-default">목록</button>
							 <input type="hidden" name="pno" value="${productVO.pno}">
							 <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
							 <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						</div>
						<script type="text/javascript">
					  	
					  		var formObj = $("form[role='form']");
					  		
					  		$('#modify_btn').click(function(){
					  			formObj.attr("action", "admin_product_modify_form");
					  			formObj.attr("method", "get");
					  			formObj.submit();
					  		});

					  		$('#list_btn').click(function(){
					  			self.location = "admin_product_list?pno=${product.pno}&"
											+ 	"pageNum=${pageMaker.cri.pageNum}&"
											+	"amount=${pageMaker.cri.amount}";
					  		});
					  		
					  
					  </script>	
					</td>
				</tr>
			</table>
			</form>
		</div>
	</section>
	
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>
	</footer>
</div>
</body>
</html>