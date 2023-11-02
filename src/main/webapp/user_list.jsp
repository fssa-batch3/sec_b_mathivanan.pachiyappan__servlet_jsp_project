<%@page import="java.util.Collections"%>
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
<title>Voters List</title>
<link rel="icon" href="./images/bb_logo.png" type="image/x-icon">
<link rel="stylesheet" href="./styles/interactive-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!--Header JSP-->
<jsp:include page="header.jsp" />

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f7f7f7;
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
	border: none;
	color: white;
	padding: 0.5rem;
	border-radius: 5px;
}

button.approvedBtn {
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

input[type="search"] {
	align-items: ceneter;
}

div.search {
	margin-left: 10rem;
}

button.searchBtn {
	background: #0091ff;
	color: white;
	font-size: 80%;
	font-weight: bold;
}
</style>
</head>
<body>

	<h1>Voters List</h1>

	<h2>Select User</h2>
	<%
	UserService newElection = new UserService();
	List<User> userList = newElection.getAllUsers();
	%>

	<!-- <div class="search">
		<i class="fa fa-search" aria-hidden="true" style="font-size: 80%;"></i><input
			type="text" id="searchInput" placeholder="Search user...">
		<button class="searchBtn" onclick="searchUsers()">Search</button>
	</div> -->

	<table>
		<thead>
			<tr>
				<th>Phone Number</th>
				<th>Address</th>
				<th>Voter Id</th>
				<th>Taluk Id</th>
				<th>Status</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<%
			// Reverse the order of the userList
			Collections.reverse(userList);

			for (User user : userList) {
				int isApprove = user.isApprove() ? 0 : 1;
				String buttonLabel = isApprove == 0 ? "Approved" : "Approve";
				String buttonClass = isApprove == 0 ? "approvedBtn" : "updateBtn";
				String buttonStyle = isApprove == 0 ? "background: gray;" : "background: #1ecbe1;";
			%>
			<tr>
				<td><%=user.getPhoneNumber()%></td>
				<td><%=user.getAddress()%></td>
				<td><%=user.getVoterId()%></td>
				<td><%=user.getTalukId()%></td>
				<td><span
					style="color: <%=user.isApprove() ? "green" : "orange"%>; font-weight: bold;"><%=user.isApprove() ? "Active" : "Pending"%>
				</span></td>
				<td><a href="javascript:void(0);"
					onclick="toggleAction(<%=user.getId()%>, <%=isApprove%>);">
						<button class="<%=buttonClass%>" style="<%=buttonStyle%>"
							<%if (buttonLabel.equals("Approved")) {%> disabled <%}%>>
							<%=buttonLabel%>
						</button>
				</a></td>
				<td><a href="user/delete?id=<%=user.getId()%>">
				<button class="deleteBtn">Remove</button></a>
				</td>
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

	<script>
         function toggleAction(userId, isApprove) {
         if (isApprove === 0) {
         // Perform the Remove action here
         window.location.href = 'user/approve?id=' + userId;
         } else {
         // Perform the Approve action here
         window.location.href = 'user/approve?id=' + userId;
        }
    }
         
   </script>
</body>
</html>
