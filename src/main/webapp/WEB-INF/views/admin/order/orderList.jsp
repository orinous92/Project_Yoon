<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<title>주문 목록 화면</title>
	
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
		document.frm.action = "admin_order_list";
		document.frm.submit();
	}
	
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
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0; }
	aside ul li a:hover { background:#eee; }
	
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px }
	
	textarea#pdesc { width:400px; height:180px; margin-left:10px;}

	#container_box table th { font-size:20px; font-weight:bold; text-align:center; padding:10px; border-bottom:2px solid #666; border-top:2px solid #666; background-color:#007BFF; color:white;}
	#container_box table tr:hover {background : #eee; }
	#container_box table td { padding:10px; text-align:center; border-bottom: 1px solid #000000;}
	
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
			<h2>Order List</h2><br>
			</div>
			<br><br>
			<form name="frm" method="post">
			<table style="width:1400px;">
				<tr>
					<td>
						<input type="text" name="key" style="width:400px;">
						<input class="btn btn-default" type="button" name="btn_search" value="검색" onclick="go_search()">
					</td>
				</tr>
			</table>
			<table id="orderList" style="width:1400px;">
					<tr>
						<th>주문번호(처리여부)</th>
						<th>주문자</th>
						<th>상품명</th>
						<th>수량</th>
						<th>우편번호</th>
						<th>배송주소</th>
						<th>전화</th>
						<th>주문일자</th>
					</tr>
					<c:forEach items="${orderList}" var="orderVO">
					<tr>
						<td>
							<c:choose>
								<c:when test='${orderVO.result == "1" }'>
									<span style="font-weight:bold; color: blue">${orderVO.odno}</span>
									(<input type="checkbox" name="result" value="${orderVO.odno }"> 미처리)
								</c:when>
								<c:otherwise>
									<span style="font-weight:bold; color: red">${orderVO.odno}</span>
									(<input type="checkbox" checked="checked" disabled="disabled"> 처리완료)
								</c:otherwise>
							</c:choose>
						</td>
						<td>${orderVO.mname}</td><td>${orderVO.pname}</td><td>${orderVO.quantity}</td><td>${orderVO.zipnum}</td>
						<td>${orderVO.address}</td><td>${orderVO.phone}</td><td><fmt:formatDate value="${orderVO.indate}"/></td>
					</tr>
				</c:forEach>
			</table><br>
			<div id="btn" style="text-align:center">
			<input type="button" class="btn btn-dark" style="width:150px;" value="주문처리(입금확인)" onclick="go_order_save()">
			</div>
			</form>
		</div>
		
	</section>
	
	<footer id="footer">
			<%@ include file="../include/footer.jsp" %>
	</footer>
</div>
</body>
</html>