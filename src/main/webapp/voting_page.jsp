<%@page import="in.fssa.evotingsystem.service.ElectionService"%>
<%@page import="in.fssa.evotingsystem.model.Election"%>
<%@page import="in.fssa.evotingsystem.model.Candidate"%>
<%@page import="in.fssa.evotingsystem.service.CandidateService"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidates List</title>
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
    cursor: pointer;
  }
  
  button.voteBtn {
  background : #1ecbe1;
  border: none;
  color: white;
  padding:10px 15px 10px 15px;
  border-radius: 5px;
  cursor: pointer;
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
				href="<%=request.getContextPath() + "/index" %>">
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
				href="<%=request.getContextPath() + "/index" %>">
				<p>BallotBox</p>
			</a>
		</div>

		<div>
			<a href="<%=request.getContextPath() + "/select"%>"><button>Election</button></a>
			<a href="<%=request.getContextPath() + "/profile"%>"><button>Profile</button></a>
			<a href="<%=request.getContextPath() + "/userlogout"%>"><button>Logout</button></a>
		</div>
	</header>
	<%
	}
	%>

<%
CandidateService newCandidate = new CandidateService();
List<Candidate> candidateList = newCandidate.getAllCandidates();

// Retrieve the electionId from the request parameter
int electionId = Integer.parseInt(request.getParameter("id"));

// Assuming you have a method to retrieve the election object by ID
ElectionService electionService = new ElectionService();
Election election = electionService.findByElectionId(electionId);

// Check if the election object is not null before proceeding
if (election != null) {
    String electionName = election.getElectionName();
%>

<h1><%= electionName %></h1>

<h2>Think and Vote</h2>
<table>
    <thead>
        <tr>
            <th>Symbol</th>
            <th>Party</th>
            <th>Candidate Name</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <%
        for (Candidate candidate : candidateList) {
            if (candidate.getElectionId() == electionId) {
        %>
        <tr>
            <td><img src="<%=candidate.getImageUrl() %>" alt ="party_symbols" style ="max-width: 7rem;"/></td>
            <td><%= candidate.getPartyName() %></td>
            <td><%= candidate.getName() %></td>
            <td><a href="#"><button class="voteBtn">Vote</button></a></td>
        </tr>
       <%
            }
        }
        %>
    </tbody>
</table>
<%
} else {
    // Handle the case when the selected election is not found
    out.println("<p>Selected election not found.</p>");
}
%>

</body>
</html>
