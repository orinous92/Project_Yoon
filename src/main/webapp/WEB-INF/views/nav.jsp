<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<head>

<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>



#nav_wrap_view_l li { display:inline; padding:  0 10px; }

#nav_wrap_view_r li { display:inline; padding: 0 10px; }


</style>
</head>

<nav class="navbar navbar-default">

		<div id="nav_wrap_left" class="dropdown">
		  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
		    	카테고리
		  </button>
		  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
		    <li role="presentation"><a role="menuitem" tabindex="-1" href="category?cateName=1">Motorcycle</a></li>
		    <li role="presentation"><a role="menuitem" tabindex="-1" href="category?cateName=2">Helmet</a></li>
		    <li role="presentation"><a role="menuitem" tabindex="-1" href="category?cateName=3">Equipment</a></li>
		  </ul>
		</div>

	<div id="nav_wrap_right">
	<ul id="nav_wrap_view_r">
		<c:if test="${member == null}">
			<li class="icon_nav">
				<a href="signin">로그인</a>
			</li>
			<li class="icon_nav">
				<a href="contract">회원가입</a>
			</li>
			<li class="icon_nav">
				<a href="cart_list">마이페이지</a>
			</li>
			<li class="icon_nav">
				<a href="notice_list">고객센터</a>
			</li>
		</c:if>
		<c:if test="${member != null }">
			<c:if test="${member.grade == 1 }">
			<li class="icon_nav">	
				<a href="admin">관리자 화면</a>
			</li>
			</c:if>
			<li class="icon_nav">
				<span style="color:red;">${member.username}</span> 님
			</li>
			<li class="icon_nav">
				<a href="signout">로그아웃</a>
			</li>
			<li>
				<a href="cart_list">마이페이지</a>
			</li>
			<li>
				<a href="notice_list">고객센터</a>
			</li>	
		</c:if>
	</ul>
	</div>
</nav>
