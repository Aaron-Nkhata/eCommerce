var emailObj;
var usernameObj;
var passwordObj;

var confirmObj;
var emailMsg;
var usernameMsg;
var passwordMsg;
var confirmMsg;

window.onload = function() { // Get objects from form
	emailObj = document.getElementById("email");
	usernameObj = document.getElementById("username");
	passwordObj = document.getElementById("password");
	confirmObj = document.getElementById("repassword");
	emailMsg = document.getElementById("emailMsg");
	usernameMsg = document.getElementById("usernameMsg");
	passwordMsg = document.getElementById("passwordMsg");
	confirmMsg = document.getElementById("confirmMsg");
};

function checkForm() { // check form
	var bEmail = checkEmail();
	var bUsername = checkUsername();
	var bPassword = checkPassword();
	var bConfirm = checkConfirm();
	return bUsername && bPassword && bConfirm && bEmail ; // return false, event will be
canceled
}

function checkEmail() { // check mail
	var regex = /^[\w-]+@([\w-]+\.)+[a-zA-Z]{2,4}$/;
	var value =emailObj.value;
	var msg = "";
	
	if (!value)
		msg = "Need mail";
	else if (!regex.test(value))
		msg = "invalid mail";
	emailMsg.innerHTML = msg;
	emailObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	return msg == "";
}

function checkUsername() { // check name
	var regex = /^[a-zA-Z_]\w{0,9}$/; // letter,_,and number
	var value = usernameObj.value;// get the text of usernameObj
	var msg = ""; // tips
	if (!value) // user name is empty
	msg = "Need username"; // add msg content
	else if (!regex.test(value)) // check username
	msg = "Invalid user name"; // tips
	usernameMsg.innerHTML = msg; // set tips
	usernameObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red"; 

	return msg == ""; // if msg is empty, returen true
}

function checkPassword() { // check password
	var regex = /^.{6,16}$/; // character,
	var value = passwordObj.value;
	var msg = "";
	
	if (!value)
		msg = "Need password";
	else if (!regex.test(value))
		msg = "Invalid password";
	passwordMsg.innerHTML = msg;
	passwordObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	return msg == "";
}

function checkConfirm() { // check password
	var passwordValue = passwordObj.value;
	var confirmValue = confirmObj.value;
	var msg = "";
	
	if(!confirmValue){
		msg = "Need password";
	}
	else if (passwordValue != confirmValue){
		msg = "Passwords aren't same";
	}
	confirmMsg.innerHTML = msg;
	confirmObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	return msg == "";
}