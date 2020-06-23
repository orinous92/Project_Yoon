<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
function idok(){
  opener.formm.userid.value=document.formm.userid.value; 
  opener.formm.reid.value=document.formm.userid.value;
  self.close();
}
</script>
<style>
	#wrap{
		margin-left : 30px;
		margin-top : 30px;
		margin-right : 30px;
	}
</style>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="js/bootstrap.js"></script>
<script src="js/member.js"></script>
</head>
<body>
	<div id="wrap">
		<form method="post" name="formm" style="margin-right:0" action="userid_check">
			<table class="table table-bordered table-hover" style="text-align: left; border= 1px solid #dddddd">
				<tr>
					<td colspan="2"><h4>아이디 중복 체크</h4></td>
				</tr>
				<tr>
					<th>User ID</th>
					<td>
						<input type="text" name="userid" value="${userid}">
						<input type="submit" value="검색" class="submit">
					</td>
				</tr>
			</table>
				<div class="wrap_1">
					중복 여부 : 
					<c:if test="${message == 1}">
						<script type="text/javascript">
							opner.document.formm.userid.value="";
						</script>
						${userid}는 이미 사용중인 아이디 입니다.
					</c:if>
					<c:if test="${message==-1}">
						${userid}는 사용 가능한 아이디 입니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button id="okId" class="btn btn-primary" onclick="idok()">사용</button>
					</c:if>
				</div>
				</form>
			</div>
</body>
</html>