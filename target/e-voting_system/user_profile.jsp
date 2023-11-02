<%@page import="in.fssa.evotingsystem.model.User"%>
<%@page import="in.fssa.evotingsystem.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Profile</title>
<link rel="stylesheet" href="./styles/style.css">
<link rel="icon" href="./images/bb_logo.png" type="image/x-icon">
<link rel="stylesheet" href="./styles/interactive-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--Header JSP-->
<jsp:include page="header.jsp" />

<style>
body {
	font-family: Arial, sans-serif;
	background-image: url(./images/login_bg.jpg);
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
}

.container {
	max-width: 600px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ccc;
	background-color: rgba(186, 177, 177, 0.5);
}

header {
	margin-top: -rem;
}

h1 {
   font-family: "Poppins", sans-serif;
	font-size: 250%;
	margin: 1rem;
	color: black;
}
img {
	font-family: "Poppins", sans-serif;
	font-size: 250%;
	margin: 1rem;
	color: black;
}

.profile {
	text-align: center;
	margin-bottom: 20px;
}

.profile img {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	object-fit: cover;
	border: 2px solid #333;
}

.profile h2 {
	margin-top: 10px;
}

.profile p {
	color: black;
}

.edit-button {
	display: block;
	margin: 0 auto;
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	font-weight: bold;
	cursor: pointer;
}

.edit-button:hover {
	background-color: #0056b3;
}

.edit-mode input[type="text"] {
	width: 100%;
	padding: 5px;
	margin-bottom: 10px;
}

.edit-mode button {
	display: block;
	margin: 0 auto;
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
}

div.icons {
	position: fixed;
	bottom: 0;
	width: 100%;
}

table {
	border-collapse: collapse;
	width: 200%;
	max-width: 400px; /* Adjust the maximum width as needed */
	border: 1px solid #ccc;
	background-color: rgba(186, 177, 177, 0.5);
	margin: 10px auto; /* Add some margin for spacing */
}

th, td {
	padding: 10px;
	text-align: left;
}

th {
	background-color: #333; /* Header background color */
	color: #fff; /* Header text color */
}

/* Add hover effect to table rows */
tr:hover {
	background-color: #ddd;
}
</style>
</head>
<body>
	<%
	User user = (User) request.getSession().getAttribute("loggedUser");
	%>

	<div class="container">
		<div class="profile">
			<img src="./images/votesymbol.png" alt="User Profile Picture">
			<!-- Replace with your default image URL -->
			<h1>User Profile</h1>
			<!-- Table 1: User Information -->
			<table>
				<tr>
					<th>Field</th>
					<th>Value</th>
				</tr>
				<tr>
					<td>Phone Number</td>
					<td><%=user.getPhoneNumber()%></td>
				</tr>
				<tr>
					<td>Password</td>
					<td>********</td>
				</tr>
				<tr>
					<td>Address</td>
					<td><%=user.getAddress()%></td>
				</tr>
			</table>

			<!-- Table 2: Additional Information -->
			<h3>Additional Fields</h3>
			<table>
				<tr>
					<th>Field</th>
					<th>Value</th>
				</tr>
				<tr>
					<td>Voter Id No</td>
					<td><%=user.getVoterId()%></td>
				</tr>
				<tr>
					<td>Taluk No</td>
					<td><%=user.getTalukId()%></td>
				</tr>
			</table>

		</div>
		<a href="user/edit?id=<%=user.getId()%>"><button
				class="edit-button">Edit Profile</button></a>
	</div>

	<div class="icons">
		<p class="footer_text">© Copyright BallotBox.com All rights
			reserved 2023</p>
	</div>
</body>
</html>
