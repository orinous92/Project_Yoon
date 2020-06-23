<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width", initial-scale="1">

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="js/member.js"></script>
<script type="text/javascript">
function result(zipnum, sido, gugun, dong){
	opener.document.formm.zipnum.value = zipnum;
	opener.document.formm.addr1.value=sido +" "+gugun+" "+dong;
	self.close();
}

</script>
</head>
<body>
	<div id="popup">
		<div class="zipcode-heading" style="text-align:center;">
		<h3>우편번호 검색</h3>
		</div><hr>
		<form method="post" name="formm" action="find_zipnum">
			<table class="table table-bordered table-hover" border="1" style="align:center;">
			<tr>
				<th style="width: 110px;">동 이름 :</th>					
				<td>
					<div class="form-group">
					<input type="text" class="form-control" placeholder="주소를 입력 해 주세요."name="dong" style="width:300px">
					</div>
				</td>
				<td>
					<div class="form-group">
					<input type="submit" value="찾기"  class="btn btn-primary">
					</div>
				</td>
			</tr>
			</table>
		</form><br>
		<table id="zipcode" class="table table-bordered table-hover" border="1">
			<tr>
				<th style="width: 110px;">우편번호</th>
				<th style="width: 350px;">주소</th>
			</tr>
			<c:forEach items="${addressList}" var="addressVO">
			<tr>
				<td>${addressVO.zipnum}</td>
				<td>
					<a href="#" onclick="return result('${addressVO.zipnum}','${addressVO.sido}','${addressVO.gugun}','${addressVO.dong}')">
						${addressVO.sido} ${addressVO.gugun} ${addressVO.dong}
					</a>
				</td>
			</tr>
			</c:forEach>
			</table>
	</div>
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>