<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<title>상품 목록 화면</title>
	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
	function go_search(){
		document.frm.action = "admin_product_list";
		document.frm.submit();
	}
	
	function go_all(){
		document.frm.key.value="";
		document.frm.action = "admin_product_list";
		document.frm.submit();
	}
	
	function go_write(){
		document.frm.action = "admin_product_write_form";
		document.frm.submit();
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
	
	section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee;}
	section#container::after { content:""; display:block; clear:both;}
	aside { float:left; width:200px; height:2000px;}
	div#container_box { width:1000px; margin-left: 220px;}
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0; }
	aside ul li a:hover { background:#eee; }
	
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px }
	
	textarea#pdesc { width:400px; height:180px; margin-left:10px;}

	#container_box table th { font-size:20px; font-weight:bold; text-align:center; padding:10px; border-bottom:2px solid #666; border-top:2px solid #666; background-color:#007BFF; color:white;}
	#container_box table tr:hover {background : #eee; }
	#container_box table td { padding:10px; text-align:center; border-bottom: 1px solid #000000;}
	#container_box table img { width:150px; height:90px; }
	
	.pull-center{ text-align: center;}
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
			<div id="pro_title">
			<h2>Product List</h2><br>
			</div>
			<br><br>
			<form name="frm" method="get">
			<table style="width:1400px;">
				<tr>
					<td>
						<input type="text" name="key" style="width:400px;">
						<input class="btn btn-default" type="button" name="btn_search" value="검색" onclick="go_search()">
						<input class="btn btn-default" type="button" name="btn_all" value="전체보기" onclick="go_all()">
						<input class="btn btn-primary" type="button" name="btn_write" value="상품등록" onclick="go_write()">
					</td>
				</tr>
			</table>
			<table style="width:1400px;">
				<thead>
					<tr>
						<th style="width:10%">사진</th>
						<th style="width:20%">상품명</th>
						<th style="width:10%">분류</th>
						<th style="width:20%">가격</th>
						<th style="width:10%">재고</th>
						<th style="width:20%">등록일</th>
						<th style="width:10%">사용여부</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${productListSize <= 0 }">
							<tr>
								<td width="100%" colspan="7" align="center" height="150px;">
									등록된 상품이 없습니다.
								</td>
							</tr>
						</c:when>
					<c:otherwise>
					<c:forEach items="${productList}" var="productList">
						<tr>
							<td>
								<c:choose>
									<c:when test="${productList.image != null }">
										<img src="uploadImg/${productList.image }" id="list_img"/>
									</c:when>
									<c:otherwise>
										<img src="img/noimage.gif" id="list_img"/>
									</c:otherwise>
								</c:choose>
							</td>
							<td><a href="admin_product_detail?pno=${productList.pno}&
														pageNum=${pageMaker.cri.pageNum}&
														amount=${pageMaker.cri.amount}">${productList.pname }</a></td>
							<td>
								<c:if test="${productList.cateName == '1'}">
									MOTORCYCLE
								</c:if>
								<c:if test="${productList.cateName == '2'}">
									HELMET
								</c:if>
								<c:if test="${productList.cateName == '3'}">
									EQUIPMENT
								</c:if>
							</td>
							<td><fmt:formatNumber value="${productList.price}" pattern="###,###,###"/>원</td>
							<td>
								<c:choose>
								<c:when test="${productList.inventory == 0}">
									<span style="color:red;">재고 없음</span>
								</c:when>
								<c:otherwise>
									${productList.inventory}&nbsp;EA
								</c:otherwise>
								</c:choose>
							</td>
							<td><fmt:formatDate value="${productList.productdate}" pattern="yyyy-MM-dd"/></td>
							<td>
								<c:choose>
									<c:when test='${productList.useyn == "n" }'><span style="color:red">미사용</span></c:when>
									<c:otherwise>사용</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
					</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<!-- start Pagination -->
			<div class="pull-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous"><a href="${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>
					
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
						<li class="paginate_button"><a href="admin_product_list${pageMaker.makeQuery(num)}">${num}</a></li>
					</c:forEach>
					
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next"><a href="admin_product_list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>
			<!-- end Pagination  -->
			</form>
		</div>
		
	</section>
	
	<footer id="footer">
			<%@ include file="../include/footer.jsp" %>
	</footer>
</div>
</body>
</html>