<%@page import="java.time.LocalDate"%>
<%@page import="in.fssa.evotingsystem.model.Vote"%>
<%@page import="in.fssa.evotingsystem.dto.VoteDTO"%>
<%@page import="in.fssa.evotingsystem.service.VoteService"%>
<%@page import="in.fssa.evotingsystem.model.User"%>
<%@page import="in.fssa.evotingsystem.service.ElectionService"%>
<%@page import="in.fssa.evotingsystem.model.Election"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Election Results</title>
<link rel="stylesheet" href="./styles/style.css">
<link rel="icon" href="./images/bb_logo.png" type="image/x-icon">
<link rel="stylesheet" href="./styles/interactive-style.css">
<link rel="stylesheet" href="./styles/style.css">
<link rel="icon" href="./images/bb_logo.png" type="image/x-icon">
<link rel="stylesheet" href="./styles/interactive-style.css">
<!--Header JSP-->
<jsp:include page="header.jsp" />

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
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

p.footer_text {
	position: fixed;
}

table {
	width: 80%;
	margin: 20px auto;
	border-collapse: collapse;
	margin-bottom: 10rem;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
	background-color: #ffffff;
	align-items: center;
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
}

img {
	max-width: 100px;
	max-height: 100px;
}
</style>
</head>
<body>

	<%
	User user = (User) request.getSession().getAttribute("loggedUser");
	%>

	<%
	int electionId = Integer.parseInt(request.getParameter("electionId"));

	// Assuming you have a method to retrieve the election object by ID
	ElectionService electionService = new ElectionService();
	Election election = electionService.findByElectionId(electionId);

	// Check if the election object is not null before proceeding
	if (election != null) {
		String electionName = election.getElectionName();
	%>

	<h1><%=electionName%></h1>

	<h2 style="color: red;">Result</h2>
	<table>
		<thead>
			<tr>
				<th>Candidate</th>
				<th>Candidate Name</th>
				<th>Party</th>
				<th>Total Votes</th>
				<th>Timing</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<VoteDTO> candidateList = null;

			try {
				VoteService newVote = new VoteService();
				candidateList = newVote.getVoteCountForCandidates(electionId);

				if (candidateList != null) {
					// Initialize variables to keep track of the winning candidate and their vote count
					String winningCandidateName = "";
					int winningVoteCount = -1;

					for (VoteDTO votedCandidate : candidateList) {
				if (votedCandidate.getElectionId() == electionId && votedCandidate.isActive() == true) {
			%>
			<tr>
				<td><img src="<%=votedCandidate.getCandidatePicture()%>"
					alt="candidate_profile"
					style="max-width: 7rem; border-radius: 1rem;" /></td>
				<td><%=votedCandidate.getCandidateName()%></td>
				<td><%=votedCandidate.getPartyName()%></td>
				<td><%=votedCandidate.getVoteCount()%></td>
				<td><%=votedCandidate.getVoteTimeStamp()%></td>
			</tr>
			<%
			// Check if this candidate has more votes than the current winning candidate
			if (votedCandidate.getVoteCount() > winningVoteCount) {
				winningCandidateName = votedCandidate.getCandidateName();
				winningVoteCount = votedCandidate.getVoteCount();
			}
			}
			}
			// Display the winning candidate
			%>
		</tbody>
	</table>
	<%
	
	LocalDate inputDate = election.getElectionDate();
	LocalDate currentDate = LocalDate.now();
	
	if (inputDate.isAfter(currentDate)) {
	%>
	<h2
		style="margin-top: 16.6rem; position: fixed; top: 0; left: 50%; transform: translateX(-50%); text-align: center;">
		Winner:
		<%=winningCandidateName%>
	</h2>
	<%
	} else if (inputDate.isBefore(currentDate)) {
	%>
	<h2
		style="margin-top: 16.6rem; position: fixed; top: 0; left: 50%; transform: translateX(-50%); text-align: center;">
		Leading:
		<%=winningCandidateName%>
	</h2>
	<%
	} else {
	%>
	<h2
		style="margin-top: 16.6rem; position: fixed; top: 0; left: 50%; transform: translateX(-50%); text-align: center;">
		Leading:
		<%=winningCandidateName%>
	</h2>
	<%
	}
	%>


	<%
	}
	} catch (Exception e) {
	out.println("<p>An error occurred: " + e.getMessage() + "</p>");
	e.printStackTrace();
	}
	%>
	<%
	} else {
	out.println("<p>Selected election not found.</p>");
	}
	%>


</body>
</html>
