<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>404 - Error</title>
<link rel="icon" href="./images/bb_logo.png" type="image/x-icon">
<link rel="stylesheet" href="./styles/interactive-style.css">

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	text-align: center;
	margin: 0;
	padding: 0;
}

p {
	color: #555;
	font-size: 1.5rem;
	margin-top: 10px;
}

a {
	color: #0e6453;
	font-size: 1.5rem;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

img {
	max-width: 60%;
	height: 40rem;
	margin: 20px 0;
}

div.backBtn {
	text-align: center;
	margin-top: 4rem;
}

div.backBtn a {
	text-decoration: none;
	background-color: #ffc727;
	color: white;
	font-size: 1.5rem;
	padding: 10px 20px 10px 20px;
	border-radius: 2rem;
}

div.backBtn a:hover {
	text-decoration: none;
	background-color: orange;
	color: white;
	font-size: 1.5rem;
	padding: 10px 20px 10px 20px;
	border-radius: 2rem;
}
</style>
</head>
<body>

	<div style="text-align: center;">
		<img src="./images/404_image.png" alt="404_error-image">
	</div>
	<p style="font-size: 1.5rem;">The requested page could not be
		found. Please check the URL or use the search bar to find what you're
		looking for.</p>
	<div class="backBtn">
		<a href="<%=request.getContextPath()%>/index">Back to home page</a>
	</div>
</body>
</html>