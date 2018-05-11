window.onload = function () {
	document.getElementById("btn_login").onclick = checkValid;
	
}

var checkValid = function(){
	var id  = document.getElementById("ip_id").value;
	var pw = document.getElementById("ip_pw").value;
	alert(id+"/"+pw);
};

	