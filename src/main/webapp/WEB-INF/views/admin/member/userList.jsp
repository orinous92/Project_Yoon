<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<title>USER LIST</title>
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
	document.uform.action = "admin_user_list";
	document.uform.submit();
}

function go_all(){
	document.uform.key.value="";
	document.uform.action = "admin_user_list";
	document.uform.submit();
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
	
	.table th,td{ text-align:center; }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0; }
	aside ul li a:hover { background:#eee; }
	
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px }
	
	#user_table th { background-color:#007BFF; color:white; }
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
		<form method="get" action="" name="uform">
			<div id="container_title">
			<h2>User List</h2><br>
			</div><br>
			<table style="width:1400px;" >
				<tr>
					<td>
						<input type="text" name="key" style="width:400px;" placeholder = "사용자를 검색 해 주세요.">
						<input class="btn btn-default" type="button" name="btn_search" value="검색" onclick="go_search()">
						<input class="btn btn-default" type="button" name="btn_all" value="전체보기" onclick="go_all()">
					</td>
				</tr>
			</table><br>
			<table id="user_table" class="table table-striped table-hover">
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>생년월일</th>
						<th>이메일</th>
						<th>연락처</th>
						<th>주소</th>
						<th>등급</th>
						<th>가입일자</th>
						<th>탈퇴여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${userList}" var="userList">
						<tr>
							<td style="width:120px;">${userList.userid }</td>
							<td style="width:100px;">${userList.username }</td>
							<td style="width:120px;"><fmt:formatDate value="${userList.birthdate }" pattern="yyyy-MM-dd"/></td>
							<td style="width:200px;">${userList.email }</td>
							<td style="width:150px;">${userList.phone }</td>
							<td style="width:500px;">${userList.address }</td>
							<td style="width:150px;">
								<c:choose>
									<c:when test="${userList.grade == 1}">
										<span style="color:red;">관리자</span>
									</c:when>
									<c:otherwise>
										일반회원
									</c:otherwise>
								</c:choose>
							</td>
							<td style="width:120px;"><fmt:formatDate value="${userList.regdate }" pattern="yyyy-MM-dd"/></td>
							<td style="width:100px;">
								<c:choose>
									<c:when test='${userList.useyn == "y"}'>
										<span style="color:blue;">사용</span>
									</c:when>
									<c:otherwise>
										<span style="color:red;">미사용</span>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- start Pagination -->
			<div class="pull-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous"><a href="${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>
					
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
						<li class="paginate_button"><a href="admin_user_list${pageMaker.makeQuery(num)}">${num}</a></li>
					</c:forEach>
					
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next"><a href="admin_user_list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>
			<!-- end Pagination  -->
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