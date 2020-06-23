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


<script>
	function del_notice(){
		confirm("삭제하시겠습니까?")
	}
</script>
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
	
	
	#content_table th{ padding: 20px 0 ; border-bottom : 2px solid #000000; border-top : 2px solid #000000; text-align:center; background-color:gray; color: white;}
	
	#notice_img img { width: 1220px; height:300px; }
	#info_title { text-align:center; padding: 15px;}
	#info_content  table th, td{ padding: 15px; width:1220px;}
	
	#notice_list { text-align: right; }
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
				<div id="section_title">
					<h2>공지 사항</h2><br>
				</div>
				<div id="product_info">
				<form method="get" name="formm" action="">
					<div id="info_title">
					<p><span style="color:#b2b2b2">BIKEFIT 게시판을 이용해주셔서 감사합니다. 공지사항 게시판 입니다.</span>&emsp;&emsp;
						<button type="button" class="btn btn-primary" id="notice_list" onclick="location.href='admin_notice_list'">목록</button>
						<a href="admin_notice_delete?bno=${notice.bno}" class="btn btn-danger" id="notice_del" onclick="del_notice()">삭제</a>
					</p><hr>
					</div>
					<div id="info_content">
					<input type="hidden" name="bno" value="${notice.bno}">
						<table id="content_table">
							<tr>
								<th>${notice.title }</th>
							</tr>
							<tr>
								<td>
									<div id="notice_img" style="padding:20px;">
										<img src="uploadImg/1-1.jpg">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div>
										${notice.content}
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div id="info_footer" style="text-align:right">
					<hr>
					<p><span style="color:#b2b2b2">From. BikeFit 운영진</span>&emsp;&emsp;
					</p><hr>
					</div>
				
				</form>
				</div>
			</div>
		</section>
	<footer id="footer">
		<%@ include file="../include/footer.jsp" %>
	</footer>
</body>
</html>