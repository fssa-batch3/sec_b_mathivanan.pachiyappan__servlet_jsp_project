<%@page import="in.fssa.evotingsystem.dao.VoteDAO"%>
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
<title>Candidates List</title>
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

button.voteBtn {
	background: #1ecbe1;
	border: none;
	color: white;
	padding: 10px 15px 10px 15px;
	border-radius: 5px;
	cursor: pointer;
	letter-spacing: 3px;
	font-weight: bold;
	font-size: 110%;
	font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande',
		'Lucida Sans', Arial, sans-serif;
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
	boolean hasVoted = (boolean) request.getAttribute("hasVoted");
	User user = (User) request.getAttribute("userData");
	List<Vote> votes = (List<Vote>) request.getAttribute("voteList");
	Vote vote = null;
	for (Vote voteList : votes) {
		vote = voteList;
	}
	%>

	<%
	if (!hasVoted || user.getId() != vote.getUserId()) {
	%>
	
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

	<h2>Think and Vote</h2>
	<table>
		<thead>
			<tr>
				<th>Symbol</th>
				<th>Party</th>
				<th>Candidate Name</th>
				<th>Vote</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<VoteDTO> candidateList = null;

			try {
				VoteService newVote = new VoteService();
				candidateList = newVote.getVoteCountForCandidates(electionId);

				if (candidateList != null) {
					for (VoteDTO votedCandidate : candidateList) {
				if (votedCandidate.getElectionId() == electionId && votedCandidate.isActive() == true) {
			%>
			<tr>
				<td><img src="<%=votedCandidate.getSymbolUrl()%>"
					alt="party_symbols" style="max-width: 7rem;" /></td>
				<td><%=votedCandidate.getPartyName()%></td>
				<td><%=votedCandidate.getCandidateName()%></td>
				<td>
					<form action="<%=request.getContextPath() + "/voting"%>"
						method="post">
						<input type="hidden" name="userId" value="<%=user.getId()%>">
						<input type="hidden" name="candidateId"
							value="<%=votedCandidate.getCandidateId()%>"> <input
							type="hidden" name="electionId"
							value="<%=votedCandidate.getElectionId()%>">
						<button type="submit" class='voteBtn'>Vote</button>
					</form>
				</td>
			</tr>

			<%
			}
			}
			}
			} catch (Exception e) {
			out.println("<p>An error occurred: " + e.getMessage() + "</p>");
			e.printStackTrace();
			}
			%>
		</tbody>
	</table>
	<%
	} else {
	out.println("<p>Selected election not found.</p>");
	}
	%>

	<%
	} else {
	%>
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

	<%
	}
	%>


</body>
</html>
