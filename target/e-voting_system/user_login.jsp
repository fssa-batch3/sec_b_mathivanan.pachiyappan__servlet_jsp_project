<%@page import="in.fssa.evotingsystem.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Login</title>
<link rel="stylesheet" href="./styles/style.css">
<link rel="icon" href="./images/bb_logo.png" type="image/x-icon">
<link rel="stylesheet" href="./assets/styles/interactive-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body {
	background-image: url(./images/Login_cuate.png);
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: contain;
}

header {
	margin-top: -9rem;
}

h2 {
	font-family: "Poppins", sans-serif;
	font-size: 250%;
	margin: 1rem;
	color: black;
}

.login-container {
	max-width: 400px;
	margin: auto;
	margin-top: 9rem;
	margin-right: 9rem;
	padding: 20px;
	width: 100%;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: rgba(186, 177, 177, 0.5);
}

.login-container h2 {
	text-align: center;
}

.input-container {
	margin: 10%;
	position: relative;
	margin-left: -0.2rem;
}

.input-container i {
	position: absolute;
	top: 10px;
	left: 10px;
	color: #777;
}

.input-container input {
	padding-left: 40px;
	width: 100%;
	height: 40px;
	border: 1px solid #ccc;
	border-radius: 5px;
	outline: none;
}

.login-button {
	width: 100%;
	padding: 10px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 120%;
}

.login-button:hover {
	background-color: #0056b3;
}

span {
	font-weight: bold;
	font-family: sans-serif;
	background-color: #9624E210;
	font-size: 90%;
}

img.form_logo {
	margin-left: 40%;
	margin-bottom: -1rem;
	width: 20%;
}

</style>
</head>

<body>
	<header>
		<div class="logo_text">
			<img src="./images/bb_logo.png" alt="e_commison-logo" width="10%"
				heigth="10%" style="border-radius: 1.5rem;" /> <a
				href="<%=request.getContextPath() + "/index"%>">
				<p>BallotBox</p>
			</a>
		</div>
	</header>

	<div class="login-container">
	     <img class="form_logo" src="./images/bb_logo.png" alt="logo" />
		<h2>Login</h2>

		<c:if test="${not empty errorMessage}">
			<p
				style="color: #f30c0f; font-weight: bold; text-align: center; background-color: #fcb5b6; border-radius: 4px; padding: 0.5rem;">
				${errorMessage}</p>
		</c:if>

		<form action="userlogin" method="post" onsubmit="loginUser()">
			<div class="input-container">
				<i class="fas fa-mobile"></i> <input type="tel"
					placeholder="Mobile Number" name="phone_number" value="${empty phoneNumber ? '' : phoneNumber}" id="phoneNo" autofocus />
				<span id="phoneNoError" style="color: red;"></span>
			</div>
			
			 
			<div class="input-container">
				<i class="fas fa-lock"></i> <input type="password" value="${empty password ? '' : password}" placeholder="Password" name="password" id="password" />
				<span id="passwordError" style="color: red;"></span>
			</div>
			 
			<p style="text-align: center;">Or</p>
			<p style="text-align: center;">
				Don't have an account? <a href="<%=request.getContextPath() + "/user/new"%>">Register</a>
			</p>
			<button class="login-button" type="submit">Login</button>
		</form>
	</div>
<script>
    function loginUser(){
    	// Get form inputs
    	const phoneNoInput = document.getElementById("phoneNo");
        const passwordInput = document.getElementById("password");
        
     // Get error message elements
        const phoneNoError = document.getElementById("phoneNoError");
        const passwordError = document.getElementById("passwordError");
        
     // Initialize a flag to check if the form is valid
        let isValid = true;

        // Reset previous error messages
        phoneNoError.textContent = "";
        passwordError.textContent = "";
        
     // Perform validation
        if (phoneNoInput.value.trim() === "") {
            phoneNoError.textContent = "Phone Number is required";
            isValid = false;
        } else if (!/^[6-9]\d{9}$/.test(phoneNoInput.value.trim())) {
            phoneNoError.textContent = "Phone Number must start with a digit from 6 to 9 and be 10 digits in total";
            isValid = false;
        }

        if (passwordInput.value.trim() === "") {
            passwordError.textContent = "Password is required";
            isValid = false;
        } else if (!/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#$%^&+=]).{8,}$/.test(passwordInput.value.trim())) {
            passwordError.textContent = "Password must contain at least one uppercase letter, one lowercase letter, one digit, one special character, and be at least 8 characters long";
            isValid = false;
        }
        
     // If the form is not valid, prevent submission
        if (!isValid) {
            event.preventDefault();
        }
    }
</script>
	

</body>

</html>
