<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<title>ADMIN_PRODUCT_REGISTER</title>
	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<script src="js/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="js/bootstrap.min.js"></script>
<script src="ckeditor/ckeditor.js"></script>
<script src="//cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
<script src="js/product.js"></script>

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
	
	div#container_box { width:1400px; margin-left: 220px;}
	
	#product_list table { border:2px solid #white; }
	#product_list th { width:120px; padding: 10 5 ; text-align:center; background-color:#007BFF; color:white; }
	#product_list td { width:350px; padding: 10 5 ; text-align:left;  }
	#container_title { width:1000px; border-bottom : 2px solid #000000; }
	
	#product_list td select { width:150px; }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0; }
	aside ul li a:hover { background:#eee; }
	
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px }
	
	
	.select_img img { width:400px; height:300px;margin:20px 0; }
	
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
			<input type="hidden" name="pno" value="${productVO.pno }">
			<div id="container_title">
			<h2>Product Modify</h2>
			<br>
			</div><br>
			<div id="btn" style="width:1000px; text-align:right;">
				<a href="admin_product_list" name="go_list" class="btn btn-default" style="align:right">목록</a>
			</div>
			<br>
			<table id = "product_list">
				<tr>
					<th>상품 분류</th>
					<td colspan="3">
						<select name=cateName>
							<c:forEach items="${cateList}" var="cate" varStatus="status">
								<option value="${status.count}">${cate}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td colspan="3"><input type="text" id="pname" name="pname" value="${productVO.pname}" style="width:450px;"/></td>
				</tr>
				<tr>
					<th>상품 가격</th>
					<td><input type="text" id="price" name="price" value="${productVO.price}" style="width:250px;"/>&nbsp;원</td>
					<th>상품 재고</th>
					<td><input type="text" id="inventory" name="inventory" value="${productVO.inventory}" style="width:120px;"/>&nbsp;EA</td>
				</tr>
				<tr>
					<th>사용 여부</th>
					<td style="padding:0 15px;" colspan="3">
						<c:choose>
							<c:when test='${productVO.useyn == "y" }'>
								<input type="checkbox" name="useyn" value="y" checked="checked">
							</c:when>
							<c:otherwise>
								<input type="checkbox" name="useyn" value="n">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>상품소개</th>
					<td colspan="3"><textarea rows="15" cols="90" id="pdesc" name="pdesc" >${productVO.pdesc}</textarea></td>
				</tr>
				<tr>
					<th>이미지</th>
					<td colspan="3">
						<input type="file" id="image" name="product_image" />
						<c:if test="${!empty productVO.image}">
						<div class="select_img">
							<img src="uploadImg/${productVO.image}"/>
							<input type="hidden" name="image" value="${productVO.image}">
						</div>
						</c:if>
						<c:if test="${empty productVO.image }">
						<div class="select_img">
							<img src="img/noimage.gif"/>
						</div>
						</c:if>
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
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<div class="inputArea" style="text-align:center;">
							 <button type="button" id="modify_Btn" class="btn btn-primary" onclick="go_modify()">수정</button>
							 <button type="button" id="cancel_Btn" class="btn btn-danger" onclick="go_reset()">취소</button>
						</div>	
					</td>
				</tr>
			</table>
			<script type="text/javascript">
				function go_modify(){
					
					var theForm = document.formm;
					
					if(theForm.cateName.value == ''){
						alert('상품분류를 선택하세요.');
						theForm.cateName.focus();
					} else if(theForm.pname.value == ''){
						alert('상품명을 입력하세요.');
						theForm.pname.focus();
					} else if(theForm.price.value == ''){
						alert('상품가격을 입력하세요.');
						theForm.price.focus();
					} else if(theForm.inventory.value == ''){
						alert('상품재고를 입력하세요.');
						theForm.inventory.focus();
					} else if(theForm.pdesc.value == ''){
						alert('상품설명을 입력하세요.');
						theForm.pdesc.focus();
					} else {
						if(confirm('수정 하시겠습니까?')){
							// [1] 상품을 삭제하지 않는 대신 사용하지 않음을 product 테이블의 useyn 컬럼에 1을 채워 넣기 위해 useyn hidden 태그에 1을 지정한다.
							if(theForm.useyn.checked == true){
								theForm.useyn.value = "y";
							} else {
								theForm.useyn.value = "n";
							}
							
							theForm.encoding = "multipart/form-data";
							theForm.action = "admin_product_modify";
							theForm.submit();
						}
					}
				}
				
				function go_reset(){
					var con = confirm("취소 하시겠습니까?");
					
					if(con){
						document.formm.action = "admin_product_list";
						document.formm.submit();
					}
				}
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