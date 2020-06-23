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
	function boardWrite(){
		document.formm.action = "board_register";
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
	
	#board_table th { padding: 20px 0 ; ; border-bottom : 2px solid #000000; border-top : 2px solid #000000; text-align:center;}
	#board_table td { padding : 15px 0 ; margin: auto; border-bottom : 1px solid gray;}
	
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
			<h2>자유 게시판</h2>
			<hr>
			<form method="get" action="" name="formm">
			<div id="btn_list">
				<button type="button" class="btn btn-default" name="btn_list" onclick="list_btn()">목록</button>
			</div>
			<table id="board_table" class="table table-hover table-striped" style="text-align:center;">
				<thead>
					<tr>
						<th width="15%">번호</th>
						<th width="35%">제목</th>
						<th width="15%">작성자</th>
						<th width="25%">작성일</th>
						<th width="10%">조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${boardList}" var="boardVO">
					<tr>
						<td>${boardVO.bno}</td>
						<td><a href="board_detail?bno=${boardVO.bno}">${boardVO.title}</a></td>
						<td>${boardVO.writer}</td>
						<td>${boardVO.regdate}</td>
						<td>${boardVO.viewcnt}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="btn-group" style="float:right; margin-right:0;">
						<input type="hidden" id="pageNum" name="pageNum" value="${pageMaker.cri.pageNum}"> 
		 	 		<input type="hidden" id="amount" name="amount" value="${pageMaker.cri.amount}"> 
				<button type="button" class="btn btn-primary" onclick="boardWrite()">글쓰기</button>
			</div>
			
			<div class="pull-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous">
							<a href="board_list${pageMaker.makeQuery(pageMaker.startPage-1)}">[이전]</a>
						</li>
					</c:if>
					
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
						<li class="paginate_button" >	
							<a href="board_list${pageMaker.makeQuery(index)}">${index}</a>
						</li>
					</c:forEach>
					
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next">
							<a href="board_list${pageMaker.makeQuery(pageMaker.endPage+1)}">[다음]</a>
						</li>
					</c:if>
					
				</ul>
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			</div>
			</form>
			</div>
		</section>
	<footer id="footer">
		<%@ include file="../footer.jsp" %>
	</footer>
</body>
</html>