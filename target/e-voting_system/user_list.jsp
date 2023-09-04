<%@page import="in.fssa.evotingsystem.model.User"%>
<%@page import="in.fssa.evotingsystem.service.UserService"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Election List</title>

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f7f7f7;
	margin: 0;
	padding: 0;
}

h1 {
	text-align: center;
	margin: 20px 0;
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

	<h1>User List</h1>

	<%
	UserService newElection = new UserService();
	List<User> userList = newElection.getAllUsers();
	%>

	<table>
		<thead>
			<tr>
				<th>Phone Number</th>
				<th>Address</th>
				<th>Voter Id</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (User user : userList) {
			%>
			<tr>
				<td><%=user.getPhoneNumber() %></td>
				<td><%=user.getAddress() %></td>
				<td><%=user.getVoterId() %></td>
				<td><a href="user/edit?id=<%=user.getId()%>"><button
							class="updateBtn">Edit</button></a></td>
				<td><a href="user/delete?id=<%=user.getId()%>"><button
							class="deleteBtn">Delete</button></a></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

</body>
</html>
