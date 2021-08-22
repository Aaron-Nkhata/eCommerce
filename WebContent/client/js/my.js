var interval;

window.onload = function() {
	interval = window.setInterval("changeSecond()", 1000);
};

function changeSecond() {
	var second = document.getElementById("second");
	var svalue = second.innerHTML;
	svalue = svalue - 1;
	if (svalue == 0) {
	window.clearInterval(interval);
	// webpage：bookstore
	var pathName = window.location.pathname.substring(1);
	var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));
	// servers ：http://localhost:8080/bookstore/index.jsp
	location.href = window.location.protocol + '//' + window.location.host + '/'+ webName +'/index.jsp';
	return;
	}
	second.innerHTML = svalue;
}