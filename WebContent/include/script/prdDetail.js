window.onload = function() {
	document.getElementById("btn_submit").onclick = checkValid;
	document.getElementById("btn_minus").onclick = minusNum;
	document.getElementById("btn_plus").onclick = plusNum;
}

var checkValid = function() {

	var messageBox = document.getElementById("text_message");
	if (messageBox.value == "") {

	}

};

var plusNum = function() {
	if (parseInt(document.getElementById("text_number").value) >= 100) {
		alert("최대 구매 수는 100개 입니다.");
		return;
	}

	document.getElementById("text_number").value
	= parseInt(document.getElementById("text_number").value) + 1;

};

var minusNum = function() {
	if (parseInt(document.getElementById("text_number").value) <= 1) {
		alert("최소 구매 수는 1개 입니다.");
		return;
	}

	document.getElementById("text_number").value
	= parseInt(document.getElementById("text_number").value) - 1;
};