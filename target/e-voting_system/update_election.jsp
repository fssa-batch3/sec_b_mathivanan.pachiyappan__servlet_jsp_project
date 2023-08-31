<%@page import="java.time.LocalDate"%>
<%@page import="in.fssa.evotingsystem.model.Election"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Elections</title>
<style>
/* Apply some basic styling to the body */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

/* Style the form container */
form {
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    padding: 2rem;
    width: 400px;
    margin: 20px auto;
}

/* Style labels */
label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

/* Style input fields */
input[type="text"],
input[type="number"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    margin-bottom: 15px;
    font-size: 14px;
}

input[type="date"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    margin-bottom: 15px;
    font-size: 14px;
    text-transform: uppercase;
}
/* Style submit button */
button[type="submit"] {
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 3px;
    padding: 10px 20px;
    font-size: 14px;
    cursor: pointer;
}

button[type="submit"]:hover {
    background-color: #0056b3;
}

/* Apply some responsiveness */
@media (max-width: 480px) {
    form {
        width: 90%;
    }
}

</style>
</head>
<body>
<% Election election = new Election(); %>
<% election = (Election)request.getAttribute("elections"); %>
<%String elc_id = (String)request.getAttribute("id"); %>
<%int id = Integer.parseInt(elc_id); %>

	<form action="update?id=<%=id%>" method="post">
	    <label>Election Name: </label>
		<input type="text" name="name" required value = "<%=election.getElectionName()%>"/> 
		<label>Election Date: </label>
		<input type="date" name="date" required value = "<%=election.getElectionDate() %>" />
		<label>Booth Address: </label>
		<input type="text" name="booth_address" required value = "<%=election.getBoothAddress() %>"/>
		<label>Taluk Id: </label>
		<input type="number" name="taluk_number" readonly value = "<%=election.getTalukId() %>"/>
		<button type="submit">Submit</button>
	</form>
</body>
</html>