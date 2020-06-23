<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<title>QNA LIST</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
function go_view(qno) {
    var theForm = document.frm;
    theForm.qno.value = qno;
    theForm.action = "admin_qna_detail";
    theForm.submit();
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
	div#container_box {  margin-left: 220px;}
	
	#container_title { border-bottom : 2px solid #000000;}
	
	#qnaList th,td{ text-align:center; padding: 15px; vertical-align: middle;}
	#qnaList { width:1000 px; }
	#qnaList td { border-bottom : 1px solid #eee; height:40px; padding: 10 0;}
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0; }
	aside ul li a:hover { background:#eee; }
	
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px }
	
	.pull-center { text-align : center; }
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
		<form method="post" name="frm">
			<input type="hidden" name="qno">
			<div id="container_title">
			<h2>Q &amp; A List</h2><br>
			</div><br>
			<table id="qnaList" class="table table-hover table-striped">
				<tr>
					<th style="width:25%">번호(답변여부)</th>
					<th style="width:25%">제목</th>
					<th style="width:25%">작성자</th>
					<th style="width:25%">작성일</th>
				</tr>
				<c:forEach items="${qnaList}" var="qnaVO">
					<tr>
						<td>
							${qnaVO.qno}&emsp;
							<c:choose>
								<c:when test='${qnaVO.rep == "1"}'><span style="color:blue">(미처리)</span></c:when>
								<c:otherwise><span style="color:red">(처리완료)</span></c:otherwise>
							</c:choose>
						</td>
						<td>
							<a href="#" onclick="javascript:go_view('${qnaVO.qno}')">
								${qnaVO.subject}
							</a>
						</td>
						<td>${qnaVO.userid}</td>
						<td><fmt:formatDate value="${qnaVO.indate}"/></td>
					</tr>
				</c:forEach>
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