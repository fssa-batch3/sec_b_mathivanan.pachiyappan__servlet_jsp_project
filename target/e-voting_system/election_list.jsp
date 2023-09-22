<%@page import="in.fssa.evotingsystem.model.Election"%>
<%@page import="in.fssa.evotingsystem.service.ElectionService"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Elections List</title>
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
	background-color: #f7f7f7;
	margin: 0;
	padding: 0;
}

p.footer_text {
    position: fixed;
}

header {
	margin-top: -7rem;
}

h1 {
	text-align: center;
	margin-top: 7rem;
}

table {
	width: 80%;
	margin: 20px auto;
	margin-bottom: 10rem;
	border-collapse: collapse;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
	background-color: #ffffff;
}

th, td {
	padding: 12px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
	font-weight: bold;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #e0e0e0;
	cursor: pointer;
}

button.updateBtn {
	background: #1ecbe1;
	border: none;
	color: white;
	padding: 0.5rem;
	border-radius: 5px;
}

button.deleteBtn {
	background: #ed3612;
	border: none;
	color: white;
	padding: 0.5rem;
	border-radius: 5px;
}

.add_new a {
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: space-evenly;
	text-align: center;
	text-decoration: none;
	position: fixed;
	font-size: 110%;
	top: 1;
	color: white;
	background-image: linear-gradient(blueviolet, #ff589e);
	padding: 0.3em;
	width: 7%;
	border-bottom-right-radius: 1em;
	border-top-right-radius: 1em;
}
</style>
</head>
<body>

	<h1>Election List</h1>

	<%
	ElectionService newElection = new ElectionService();
	List<Election> electionList = newElection.getAllElections();
	%>

	<h2>Select Election</h2>
	<p class="add_new">
		<a href="<%=request.getContextPath() + "/election/new"%>">Add New<i
			class="fa fa-plus-circle"></i></a>
	</p>
	<table>
		<thead>
			<tr>
				<th>Election Name</th>
				<th>Election Date</th>
				<th>Booth Address</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Election election : electionList) {
			%>
			<tr>
				<td><%=election.getElectionName()%></td>
				<td><%=election.getElectionDate()%></td>
				<td><%=election.getBoothAddress()%></td>

				<td><a href="election/edit?id=<%=election.getId()%>"><button
							class="updateBtn">Edit</button></a></td>
				<td><a href="election/delete?id=<%=election.getId()%>"><button
							class="deleteBtn">Delete</button></a></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<div class="icons">
		<p class="footer_text">© Copyright BallotBox.com All rights
			reserved 2023</p>
	</div>

</body>
</html>
