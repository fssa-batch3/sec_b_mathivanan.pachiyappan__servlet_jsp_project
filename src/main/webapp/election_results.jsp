<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Election Results</title>
    <link rel="stylesheet" href="./styles/style.css">
    <link rel="icon" href="./images/bb_logo.png" type="image/x-icon">
    <link rel="stylesheet" href="./styles/interactive-style.css">
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
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        img {
            max-width: 100px;
            max-height: 100px;
        }
    </style>
</head>
<body>
    <!-- Header before login -->
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
			<a href="<%=request.getContextPath() + "/select"%>"><button>Elections</button></a> 
			<a href="<%=request.getContextPath() + "/profile"%>"><button>Profile</button></a> 
			<a href="<%=request.getContextPath() + "/userlogout"%>"><button>Logout</button></a>
		</div>
	</header>
	<%
	}
	%>
	
    <h1>Election Results</h1>
    <table>
        <tr>
            <th>Candidate ID</th>
            <th>Name</th>
            <th>Party Name</th>
            <th>Symbole</th>
            <th>Votes Count</th>
        </tr>
        <c:forEach items="${candidates}" var="candidate">
            <tr>
                <td>${candidate.id}</td>
                <td>${candidate.name}</td>
                <td>${candidate.partyName}</td>
                <td>
                    <img src="${candidate.imageUrl}" alt="Candidate Image">
                </td>
                <td>${candidate.voteCount}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
