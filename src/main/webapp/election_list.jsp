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
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f7f7f7;
	margin: 0;
	padding: 0;
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
</style>
</head>
<body>

	<%
	if (session.getAttribute("loggedUser") == null) {
	%>
	<header>
		<div class="logo_text">
			<img src="./images/bb_logo.png" alt="e_commison-logo" width="10%"
				height="10%" style="border-radius: 1.5rem;" /> <a
				href="./index.html">
				<p>BallotBox</p>
			</a>
		</div>

		<div>
			<a href="<%=request.getContextPath() + "/userlogin"%>"><button>Sign-In</button></a>
		</div>
	</header>
	<%
	} else {
	%>
	<!-- Header after login -->
	<header>
		<div class="logo_text">
			<img src="./images/bb_logo.png" alt="e_commison-logo" width="10%"
				height="10%" style="border-radius: 1.5rem;" /> <a
				href="./index.html">
				<p>BallotBox</p>
			</a>
		</div>

	</header>
	<%
	}
	%>

	<h1>Election List</h1>

	<%
	ElectionService newElection = new ElectionService();
	List<Election> electionList = newElection.getAllElections();
	%>

    <h2>Select Election</h2>
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

</body>
</html>
