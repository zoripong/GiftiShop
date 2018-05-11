window.onload = function () {
	document.getElementById("btn_signin").onclick = checkValid;
	
}

var checkValid = function(){
	var pw = document.getElementById("ip_pw").value;
	var repw = document.getElementById("ip_re_pw").value;
	
	if(pw!=repw){
		alert("비밀번호를 확인해주세요.")
		document.getElementById("ip_pw").focus();
		return;
	}
	
	document.getElementById("sigin_form").submit();
		
};

	