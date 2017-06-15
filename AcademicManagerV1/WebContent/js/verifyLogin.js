/**
 * 
 */
var usernameField;
var passwordField;
var loginButton;

usernameField = document.getElementById("username");
passwordField = document.getElementById("password");
loginButton = document.querySelector('#login-btn');
hideAlertBox();
loginButton.addEventListener('click',checkFields);

//checkFields();


function checkFields(){
	if( usernameField.value ==="" || passwordField.value === "" ){
		//both fields are empty. throw a warning
		alert("Username or password is empty !!");
	}
	else{
		localStorage.setItem("username",usernameField.value);
	}
}

function hideAlertBox(){
	document.querySelector('#alertBox').style.display = 'none';
}