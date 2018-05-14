window.onload = function () {
	document.getElementById("btn_signin").onclick = checkValid;
	
}

var checkValid = function(){
	var pw = document.getElementById("ip_pw").value;
	var repw = document.getElementById("ip_re_pw").value;
	var id = document.getElementById("ip_id").value;
	
	if(id==""){
		alert("아이디를 입력하세요.");
		document.getElementById("ip_id").focus();
		return;
	}
		
	if(pw!=repw){
		alert("비밀번호가 동일하지 않습니다.");
		document.getElementById("ip_pw").focus();
		return;
	}
	
	document.getElementById("sigin_form").submit();
		
};

	