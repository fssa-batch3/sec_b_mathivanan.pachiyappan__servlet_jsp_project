<%@page import="in.fssa.evotingsystem.model.Election"%>
<%@page import="in.fssa.evotingsystem.service.ElectionService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./styles/style.css">
<link rel="icon" href="./images/bb_logo.png" type="image/x-icon">
<link rel="stylesheet" href="./styles/interactive-style.css">
<!--Header JSP-->
<jsp:include page="header.jsp" />

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
	background-color: #007bff;
	color: #fff;
	padding: 10px;
	margin-top: 7rem;
}

button.result {
	background: green;
	color: white;
	font-weight: bold;
	font-size: 150%;
	letter-spacing: 3px;
	border-radius: 1rem;
	padding: 10px 60px;
	display: block;
	margin: 0 auto;
	cursor: pointer;
}

</style>
</head>
<body>
<%
	int electionId = Integer.parseInt(request.getParameter("id"));

	// Assuming you have a method to retrieve the election object by ID
	ElectionService electionService = new ElectionService();
	Election election = electionService.findByElectionId(electionId);

	// Check if the election object is not null before proceeding
	if (election != null) {
		String electionName = election.getElectionName();
	%>

	<h1><%=electionName%></h1>

	<h4
		style="color: gray; font-size: 280%; text-align: center; margin-top: 15rem; margin-bottom: 5rem;">Already
		Voted</h4>

	<a
		href="<%=request.getContextPath() + "/results?electionId=" + electionId%>"><button
			class="result">Result</button></a>
	<%
	} else {
	out.println("<p>Selected election not found.</p>");
	}
	%>
</body>
</html>