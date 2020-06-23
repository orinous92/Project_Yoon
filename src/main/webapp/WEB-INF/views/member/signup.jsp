<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="js/member.js"></script>

<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<!-- jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  


<script>
	// password 체크 스크립트
	function pwdCheckFunction(){
		var userPwd1 = $('#password').val();
		var userPwd2 = $('#passwordCheck').val();
		
		if(userPwd1 != userPwd2){
			
			$('#passwordCheckmessage').html('비밀번호가 서로 일치하지 않습니다.');
		} else {
			$('#passwordCheckmessage').html('');
		}
	}
	

</script>

<style>

#container { margin-left:150px; margin-right:150px; padding: 15px;}
#content { width:700px; left:0; right:0; margin-left:auto; margin-right:auto;}

.dot { color : red; }
#bg { background-color: #337AB7; color: white; }
</style>

	<title>메인화면</title>
</head>
<body>
<div id="root">
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
		<div id="container_box">
			
			<section id="content">
					<form method="post" autocomplete="off" role="form" name="formm">
						<div class="form-group">
						<table class="table table-bordered table-hover" style="text-align: center; border= 1px solid #dddddd">
							<thead>
								<tr>
									<th colspan="3" style="text-align: center;"><h2>회원 가입</h2></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td id="bg" style="width: 110px;"><h5>아이디</h5></td>
									<td style="text-align: left;">
									<div class="form-inline">
										<input type="text" class="form-control" placeholder="아이디" name="userid" maxlength="20">
										<input type="hidden" name="reid">&emsp;
										<button type="button" id="idCheckBtn" class="btn btn-primary" onclick="confirmId()">중복확인</button>&emsp;<span class="dot">*&nbsp;<small>필수입력</small></span>
									</div>
									</td>
								</tr>
								<tr>
									<td id="bg" style="width: 100px;"><h5>비밀번호</h5></td>
									<td colspan="2"><div class="form-inline" style="text-align: left;"><input type="password" onkeyup="pwdCheckFunction()" class="form-control" placeholder="비밀번호"  name="password" maxlength="20" size="60">&emsp;<span class="dot">*</span></div></td>
								</tr>
								<tr>
									<td id="bg" style="width: 100px;"><h5>비밀번호 확인</h5></td>
									<td colspan="2"><div class="form-inline" style="text-align: left;"><input type="password" onkeyup="pwdCheckFunction()" class="form-control" placeholder="비밀번호 확인"  name="passwordCheck" maxlength="20"  size="60">&emsp;<span class="dot">*</span>
										<h5 style="color:red;" id="passwordCheckmessage"></h5></div>
									</td>
								</tr>
								<tr>
									<td id="bg" style="width: 100px;"><h5>이름</h5></td>
									<td colspan="2"  style="text-align: left;"><div class="form-inline"><input type="text" class="form-control" placeholder="이름" name="username" maxlength="40">&emsp;<span class="dot">*</span></div></td>
								</tr>
								<tr>
									<td id="bg" style="width: 100px;"><h5>생년월일</h5></td>
									<td colspan="2"  style="text-align: left;">
										<div class="form-inline">
										  <input type="text" class="form-control" name="birthyy" maxlength="4" placeholder="년(4자)"  size="6" >&emsp;
					                        <select name="birthmm" class="form-control">
					                            <option value="">월</option>
					                            <option value="01" >1</option>
					                            <option value="02" >2</option>
					                            <option value="03" >3</option>
					                            <option value="04" >4</option>
					                            <option value="05" >5</option>
					                            <option value="06" >6</option>
					                            <option value="07" >7</option>
					                            <option value="08" >8</option>
					                            <option value="09" >9</option>
					                            <option value="10" >10</option>
					                            <option value="11" >11</option>
					                            <option value="12" >12</option>
					                        </select>&emsp;
					                        <select name="birthdd" class="form-control">
					                            <option value="">일</option>
					                            <option value="01" >1</option><option value="02" >2</option><option value="03" >3</option>
					                            <option value="04" >4</option><option value="05" >5</option><option value="06" >6</option>
					                            <option value="07" >7</option><option value="08" >8</option><option value="09" >9</option>
					                            <option value="10" >10</option><option value="11" >11</option><option value="12" >12</option>
					                            <option value="13" >13</option><option value="14" >14</option><option value="15" >15</option>
					                            <option value="16" >16</option><option value="17" >17</option><option value="18" >18</option>
					                            <option value="19" >19</option><option value="20" >20</option><option value="21" >21</option>
					                            <option value="22" >22</option><option value="23" >23</option><option value="24" >24</option>
					                            <option value="25" >25</option><option value="26" >26</option><option value="27" >27</option>
					                            <option value="28" >28</option><option value="29" >29</option><option value="30" >30</option>
					                            <option value="31" >31</option>
					                        </select>
					                        &emsp;<span class="dot">*</span>
										 </div>
									</td>
								</tr>
								<tr>
									<td id="bg" style="width: 100px;"><h5>이메일</h5></td>
									<td colspan="2"  style="text-align: left;"><div class="form-inline"><input type="email" class="form-control" placeholder="이메일" name="email" size="70">&emsp;<span class="dot">*</span></div></td>
								</tr>
								<tr>
									<td id="bg" style="width: 100px;"><h5>핸드폰</h5></td>
									<td colspan="2"  style="text-align: left;">
										<div class="form-inline">
										<input type="text" name="phone1" class="form-control" style="width:60px;" value="010" readonly="readonly">&emsp;-&emsp;
										<input type="text" name="phone2" class="form-control" style="width:60px;">&emsp;-&emsp;
										<input type="text" name="phone3" class="form-control" style="width:60px;">&emsp;<span class="dot">*</span>
										</div>
									</td>
								</tr>
								<tr>
									<td id="bg" style="width: 100px;"><h5>우편번호</h5></td>
									<td colspan="2" style="text-align: left;">
									<div class="form-inline"><input type="text" class="form-control" placeholder="우편번호" name="zipnum" maxlength="7">&emsp;
									<button type="button" id="btn_zipnum" class="btn btn-primary" onclick="post_zip()">주소찾기</button></div>
									</td>
								</tr>
								<tr>
									<td id="bg" style="width: 100px;"><div style="margin-top:30px;"><h5>주소</h5></div></td>
									<td colspan="2" >
									<input type="text" class="form-control" placeholder="주소" name="addr1" size="50"><input type="text" class="form-control" placeholder="상세주소" name="addr2" size="50" style="margin-top: 5px">
									</td>
								</tr>
								<tr>
									<td colspan="3"  style="width: 500px; text-align: right">
										<button  type="button"  id="insertMember" class="btn btn-primary" onclick="go_save()">회원가입</button>
										<input type="reset" class="btn btn-primary" value="취소">
									</td>
								</tr>
								
							</tbody>
							</table>
						</div>
					</form>
				</section>
				
		</div>
	</section>
	
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../footer.jsp" %>
		</div>
	</footer>
</div>
</body>
</html>