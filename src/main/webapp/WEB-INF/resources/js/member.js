/**
 * 
 */

function go_next(){
	if(document.formm.okon1.checked == true){
		document.formm.action = "join_form";
		document.formm.submit();
	} else {
		alert("약관에 동의 하셔야 합니다!");
	}
	
}

//아이디 체크

function confirmId(){
	if(document.formm.userid.value == ""){
		alert("아이디를 입력하세요.");
		document.formm.userid.focus();
		return;
	} else {
		
		var url = "userid_check?userid=" + document.formm.userid.value;
		
		window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=400");
	}
}


function post_zip(){
	
		var url="find_zipnum";
	
		window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=700, height=400");
	
}

function go_save(){
	
	if(document.formm.userid.value == ""){
		alert("아이디를 입력 해 주세요.");
		document.formm.userid.focus();
	} else if(document.formm.userid.value != document.formm.reid.value){
		alert("중복확인 필수");
		document.formm.id.focus();
	} else if(document.formm.password.value == ""){
		alert("비밀번호를 입력 해 주세요.");
		document.formm.password.focus();
	} else if(document.formm.password.value != document.formm.passwordCheck.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.formm.password.focus();
	} else if(document.formm.username.value == ""){
		alert("이름을 입력 해 주세요.");
		document.formm.username.focus();
	} else if(document.formm.birthyy.value == ""){
		alert("생년월일을 입력 해 주세요.");
		document.formm.birthyy.focus();
	} else if(document.formm.email.value == ""){
		alert("이메일을 입력 해 주세요.");
		document.formm.email.focus();
	} else if(document.formm.phone2.value == "" && document.formm.phone3.value == ""){
		alert("핸드폰 번호를 입력 해 주세요.");
		document.formm.phone2.focus();
	} else {
		document.formm.action = "signup";
		document.formm.submit();
	}
}
