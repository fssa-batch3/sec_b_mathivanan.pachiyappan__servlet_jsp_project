<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Candidate</title>
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
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            margin-bottom: 15px;
            font-size: 14px;
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
    <form action="create" method="POST">
        <label>Candidate Reg.No:</label>
        <input type="number" name="candidateRegNo" autofocus required />
        <label>Candidate Name:</label>
        <input type="text" name="candidateName" required />
        <label>Election ID:</label>
        <input type="number" name="electionId" required />
        <label>Party Name:</label>
        <input type="text" name="partyName" required />
        <label>Party Symbol:</label>
        <input type="text" name="imageUrl" />
        <label>Created At:</label>
        <input type="date" name="createdAt" required min="<%= LocalDate.now() %>" />
        <button type="submit">Add Candidate</button>
    </form>
</body>
</html>
