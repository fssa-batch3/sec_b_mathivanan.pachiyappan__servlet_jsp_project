<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Generic Error</title>
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

h1 {
    color: #0e6453;
    font-size: 2rem;
    margin-top: 20px;
}

p {
    color: #555;
    font-size: 1.2rem;
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

</style>
</head>
<body>
   <h1>An error occurred</h1>
    <p>We're sorry, but an error occurred while processing your request. Please try again later.</p>
    <div style="text-align: center;">
    <a href="<%=request.getContextPath() %>/index" style="color:#0e6453; font-size:1.5rem;">Back to home page</a>
</body>
</html>