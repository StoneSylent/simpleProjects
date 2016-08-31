function generate() {
	var d = new Date();
	var withTime = d.toLocaleString();
	var temp = document.getElementsByName("timestamp")[0].innerHTML;
	document.getElementsByName("timestamp")[0].innerHTML = temp+"</br>"+withTime;
	//links open in new tab, excluding # targets
	$('a:not([href="#"])').attr("target","_blank");
};

