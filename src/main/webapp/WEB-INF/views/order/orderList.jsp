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
  function go_order_save() {
    var count = 0;
    if (document.frm.result.length == undefined) {
      if (document.frm.result.checked == true) {
        count++;
      }
    } else {
      for ( var i = 0; i < document.frm.result.length; i++) {
        if (document.frm.result[i].checked == true) {
          count++;
        }
      }
    }
    if (count == 0) {
      alert("주문처리할 항목을 선택해 주세요.");
    } else {
      document.frm.action = "admin_order_save";
      document.frm.submit();
    }
  }
  
  function order_page(){
	  document.frm.action ="my_order_page";
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
					<h3><strong>주문 리스트</strong></h3>
					<br>
				</div>
				<form name="frm" method="get">
				<div id="container_table">
					<table style="width:1580px;" id="orderList">
							<tr>
								<th style="width:20%">상품명</th>
								<th style="width:10%">가격</th>
								<th style="width:5%">수량</th>
								<th style="width:10%">우편번호</th>
								<th style="width:20%">배송지</th>
								<th style="width:10%">전화</th>
								<th style="width:10%">주문일</th>
								<th style="width:15%">진행상태</th>
							</tr>
						<c:choose>
							<c:when test="${orderList.size() == 0 }">
								<tr>
									<td colspan="5" style="height:300px; text-align: center;">
										<h3 style="color : #777777;">주문 내역이 비었습니다.</h3>
									</td>
								</tr>
							</c:when>
						<c:otherwise>
						<c:forEach items="${orderList}" var="orderVO">
							<tr>
								 <td><a href="product_view?pno=${cartVO.pno}"><h4>${orderVO.pname}</h4></a></td> 
								 <td><fmt:formatNumber value="${orderVO.price}" type="currency"/></td>
							     <td>${orderVO.quantity}</td> <td>${orderVO.zipnum}</td>
							     <td>${orderVO.address}</td>  <td>${orderVO.phone}</td>
							     <td><fmt:formatDate value="${orderVO.indate}" type="date" /></td>
							     <td> 처리 진행 중 </td>
							</tr>
						</c:forEach>
							<tr>
								<th colspan="2"> 총액 </th>
								<th colspan="5"> <fmt:formatNumber value="${totalPrice}" type="currency"/></th>
								<th> 주문 처리가 완료 되었습니다. </th>
							</tr>
						</c:otherwise>
						</c:choose>
					</table>
				</div><br>
				<div id="buttons" style="text-align: center">
					<input type="button" class="btn btn-dark" value="쇼핑 계속하기" name="go_index" onclick="location='index'">
					<input type="button" class="btn btn-default" value="주문내역 확인" name="go_order_page" onclick="order_page()">
				</div>
				</form>
			</div>
		</section>
	<footer id="footer">
		<%@ include file="../footer.jsp" %>
	</footer>
</body>
</html>