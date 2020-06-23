/**
 * 		상품 관련 자바스크립트
 */


var formObj = $("form[role='form']");

		$('#cancel_Btn').click(function(){
			var confirm = confrim("등록을 취소 하시겠습니까?");
		if(confirm == true){
			window.history.go(-1);
		} else {
			return false;
		}
					
});
		
		
function reg_btn(){
	if(document.reg_form.pname.value = ""){
		alert("상품명을 입력하세요.");
		document.reg_form.pname.focus();
	} else if(document.reg_form.price.value = ""){
		alert("상품가격을 입력하세요.");
		document.reg_form.price.focus();
	} else if(document.reg_form.inventory.value = ""){
		alert("상품수량을 입력하세요.");
		document.reg_form.inventory.focus();
	} else if(document.reg_form.pdesc.value = ""){
		alert("상품소개을 입력하세요.");
		document.reg_form.pdesc.focus();
	} else {
		return;
	} 
	
}