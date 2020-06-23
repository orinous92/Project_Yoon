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
<script type="text/javascript">
	var regExp = /[^0-9]/gi;
	
	$("#price").keyup(function(){ numCheck($(this)); });
	$("#inventory").keyup(function(){ numCheck($(this)); });
	
	function numCheck(selector){
		var tempVal = selector.val();
		selector.val(tempVal.replace(regExp, ""));
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
	
	.inputArea { margin:10px 0; }
	select { width:100px; }
	label { display:inline-block; width:70px; padding:5px; }
	label[for='pdesc'] { display:block;}
	input { width:150px; }
	textarea#pdesc { width:400px; height:180px; margin-left:10px;}
	
	.select_img img { width:500px; margin:20px 0; }
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
		<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
		<div id="container_box_left" style="width:50%; float:left">
			<h2>상품 수정</h2>
			
				<div class="selectArea">
				<label for="cateCode">브랜드</label>
				<c:if test="${!empty category}">
				<select class="category" name="cateCode">
					<c:forEach items="${category}" var="category">
					<c:if test="${category.level == 1 }">
							<option value="${category.cateCode}">${category.cateName}</option>
					</c:if>
					</c:forEach>
				</select>
				</c:if>
				</div>
				
				<div class="inputArea">
					 <label for="pname">상품명</label>
					 <input type="text" id="pname" name="pname" value="${product.pname }"/>
				</div>
				
				<div class="inputArea">
					 <label for="price">상품가격</label>
					 <input type="text" id="price" name="price" value="${product.price }"/>
				</div>
				
				<div class="inputArea">
					 <label for="inventory">상품수량</label>
					 <input type="text" id="inventory" name="inventory" value="${product.inventory }"/>
				</div>
				
				<div class="inputArea">
					 <label for="pdesc">상품소개</label>
					 <textarea rows="5" cols="50" id="pdesc" name="pdesc">${product.pdesc }</textarea>
				</div>
			</div>
		<div id="container_box_right" style="width:50%; float:right">
			<div class="inputArea">
					<label for="image">이미지</label>
					<input type="file" id="image" name="uploadFile"/>
					<div class="select_img">
						<c:choose>
						<c:when test="${product.image != null }">
							<img src="uploadImg/${product.image }"/>
						</c:when>
						<c:otherwise>
							<img src="img/noimage.gif"/>
						</c:otherwise>
						</c:choose>
						<input type="hidden" name="image" value="${product.image}">
					</div>
					<script type="text/javascript">
						$("#image").change(function(){
							if(this.files && this.files[0]){
								var reader = new FileReader;
								reader.onload = function(data){
									$(".select_img img").attr("src", data.target.result).width(500);
								}
								reader.readAsDataURL(this.files[0]);
							}
						});
					</script>
					<%= request.getRealPath("/") %>
				</div>
		</div>
		<div class="inputArea">
			<button type="submit" id="update_btn" class="btn btn-primary">수정</button>
			<button type="button" id="delete_btn" class="btn btn-danger">삭제</button>
			<button type="button" id="back_btn" class="btn btn-warning">취소</button>
			<input type="hidden" name="pno" value="${product.pno}">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		</div>
		<script>
			
			
			$("#back_btn").click(function(){
				location.href="viewPaging?pno=" + ${product.pno};
			});
			
			var formObj = $("form[role='form']");
			
			$('#delete_btn').click(function(){
	  			var con = confirm("삭제 하시겠습니까?");
	  			
	  			if(con){
		  			formObj.attr("action", "delete");
		  			formObj.attr("method","get")
		  			formObj.submit();
	  			}
	  		});
		</script>
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