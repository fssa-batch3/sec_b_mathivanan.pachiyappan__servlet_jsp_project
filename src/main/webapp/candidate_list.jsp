<%@page import="in.fssa.evotingsystem.model.Candidate"%>
<%@page import="in.fssa.evotingsystem.service.CandidateService"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidates List</title>
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
	background-image: linear-gradient(blue, #0091ff);
	padding: 0.3em;
	width: 7%;
	border-bottom-right-radius: 1em;
	border-top-right-radius: 1em;
}
</style>
</head>
<body>

	<h1>Candidate List</h1>

	<h2>Select Candidate</h2>
	
	<p class="add_new">
		<a href="<%=request.getContextPath() + "/candidate/new"%>">Add New<i
			class="fa fa-plus-circle"></i></a>
	</p>
	
	<%
	CandidateService newCandidate = new CandidateService();
	List<Candidate> candidateList = newCandidate.getAllCandidates();
	%>

	<table>
		<thead>
			<tr>
				<th>Reg.No</th>
				<th>Election Number</th>
				<th>Candidate</th>
				<th>Candidate Name</th>
				<th>Party Symbol</th>
				<th>Party Name</th>
				<th>Account Created</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Candidate candidate : candidateList) {
			%>
			<tr>
				<td><%=candidate.getId()%></td>
				<td><%=candidate.getElectionId()%></td>
				<td><img src="<%=candidate.getProfilePic() %>" alt="candidate_picture"
					style="max-width: 7rem; border-radius: 1rem;" /></td>
				<td><%=candidate.getName()%></td>
				<td><img src="<%=candidate.getImageUrl()%>" alt="party_symbols"
					style="max-width: 7rem;" /></td>
				<td><%=candidate.getPartyName()%></td>
				<td><%=candidate.getCreatedAt()%></td>
				<td><a href="candidate/edit?id=<%=candidate.getId()%>"><button
							class="updateBtn">Edit</button></a></td>
				<td><a href="candidate/delete?id=<%=candidate.getId()%>"><button
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
