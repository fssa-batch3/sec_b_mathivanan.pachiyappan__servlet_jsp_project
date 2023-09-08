<%@page import="in.fssa.evotingsystem.model.User"%>
<%@page import="in.fssa.evotingsystem.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="./styles/style.css">
    <link rel="icon" href="./images/bb_logo.png" type="image/x-icon">
    <link rel="stylesheet" href="./styles/interactive-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        h1 {
            text-align: center;
        }
        .profile {
            text-align: center;
            margin-bottom: 20px;
        }
        .profile img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #333;
        }
        .profile h2 {
            margin-top: 10px;
        }
        .profile p {
            color: #777;
        }
        .edit-button {
            display: block;
            margin: 0 auto;
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        .edit-button:hover {
            background-color: #0056b3;
        }
        .edit-mode input[type="text"] {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
        }
        .edit-mode button {
            display: block;
            margin: 0 auto;
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
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
			<a href="<%=request.getContextPath() + "/userprofile"%>"><button>Profile</button></a>
			<a href="<%=request.getContextPath() + "/userlogout"%>"><button>Logout</button></a>
		</div>
	</header>
	<%
	}
	%>
	
	<%
	User user = (User) request.getSession().getAttribute("loggedUser"); 
	
	%>

<div class="container">
        <h1>User Profile</h1>
        <div class="profile">
            <img src="./images/profile_upload.jpg" alt="User Profile Picture"> <!-- Replace with your default image URL -->
            <h2>User Profile</h2>
            <p>Phone Number:<%= user.getPhoneNumber() %></p>
            <p>Address: <%=user.getAddress() %></p>
            <p>Taluk No:<%=user.getTalukId() %></p>
        </div>
        <button class="edit-button" onclick="toggleEditMode()">Edit Profile</button>
        <div class="edit-mode" style="display: none;">
            <input type="text" placeholder="Name">
            <input type="text" placeholder="Email">
            <input type="text" placeholder="Location">
            <button onclick="saveProfile()">Save</button>
        </div>
    </div>

    <script>
        function toggleEditMode() {
            const editMode = document.querySelector('.edit-mode');
            const editButton = document.querySelector('.edit-button');

            if (editMode.style.display === 'none') {
                editMode.style.display = 'block';
                editButton.textContent = 'Cancel';
            } else {
                editMode.style.display = 'none';
                editButton.textContent = 'Edit Profile';
            }
        }

        function saveProfile() {
            // Add code here to save the updated profile information
            // For simplicity, we'll just hide the edit mode here
            const editMode = document.querySelector('.edit-mode');
            const editButton = document.querySelector('.edit-button');

            editMode.style.display = 'none';
            editButton.textContent = 'Edit Profile';
        }
    </script>
</body>
</html>
