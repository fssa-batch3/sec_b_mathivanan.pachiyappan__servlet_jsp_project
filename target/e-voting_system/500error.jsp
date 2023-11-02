<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>500 - Error</title>
<link rel="icon" href="./images/bb_logo.png" type="image/x-icon">
<link rel="stylesheet" href="./styles/interactive-style.css">

<style>
body {
    font-family: 'Encode Sans Semi Condensed', sans-serif;
    background-color: #f2f2f2;
    text-align: center;
    margin: 0;
    padding: 0;
}

h2 {
    color: black;
    font-size: 2rem;
    margin-top: 10px;
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
<link
	href="https://fonts.googleapis.com/css?family=Encode+Sans+Semi+Condensed:100,200,300,400"
	rel="stylesheet">

</head>
<body class="loading">
	  
	<img src ="./images/500_image.png" alt="500_error-image" >
	
	<h2>
		Unexpected Error <b>:(</b>
	</h2>
	
	<div class="backBtn">
		<a href="<%=request.getContextPath()%>/index">Back to home page</a>
	</div>

</body>