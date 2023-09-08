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
  background : #1ecbe1;
  border: none;
  color: white;
  padding: 0.5rem;
  border-radius: 5px;
  }
  button.deleteBtn {
  background : #ed3612;
  border: none;
  color: white;
  padding: 0.5rem;
  border-radius: 5px;
  }
  
</style>
</head>
<body>

<h1>Candidate List</h1>

<%
CandidateService newCandidate = new CandidateService();
List<Candidate> candidateList = newCandidate.getAllCandidates();
%>

<table>
    <thead>
        <tr>
            <th>Candidate Reg.No</th>
            <th>Election Number</th>
            <th>Candidate Name</th>
            <th>Account Created</th>
        </tr>
    </thead>
    <tbody>
        <% for (Candidate candidate : candidateList) { %>
        <tr>
            <td><%= candidate.getCandidateId() %></td>
            <td><%= candidate.getElectionId() %></td>
            <td><%= candidate.getCandidateName() %></td>
            <td><%= candidate.getCreatedAt() %></td>
            <td><a href="candidate/edit?id=<%=candidate.getId()%>"><button class = "updateBtn">Edit</button></a></td>
            <td><a href="candidate/delete?id=<%=candidate.getId()%>"><button class = "deleteBtn">Delete</button></a></td>
        </tr>
        <% } %>
    </tbody>
</table>

</body>
</html>
