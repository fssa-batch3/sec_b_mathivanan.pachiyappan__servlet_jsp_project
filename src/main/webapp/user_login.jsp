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
	background-image: url(./images/login_bg.jpg);
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
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
		<h2>Login</h2>

		<c:if test="${not empty errorMessage}">
			<p
				style="color: #85a88c; font-weight: bold; text-align: center; background-color: #d4edda; border-radius: 4px; padding: 0.5rem;">
				${errorMessage}</p>
		</c:if>

		<form action="userlogin" method="post">
			<div class="input-container">
				<i class="fas fa-mobile"></i> <input type="tel"
					placeholder="Mobile Number" name="phone_number" autofocus required>
			</div>
			<div class="input-container">
				<i class="fas fa-lock"></i> <input type="password"
					placeholder="Password" name="password" required>
			</div>
			<p style="text-align: center;">Or</p>
			<p style="text-align: center;">
				Click here to <a href="<%=request.getContextPath() + "/create"%>">Register
					User</a>
			</p>
			<button class="login-button" type="submit">Login</button>
		</form>
	</div>

	

</body>

</html>
