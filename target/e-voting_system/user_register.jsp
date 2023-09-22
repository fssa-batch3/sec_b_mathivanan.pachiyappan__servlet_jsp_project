<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Registration</title>
<link rel="stylesheet" href="./styles/user_register.css">
<link rel="icon" href="./images/bb_logo.png" type="image/x-icon">
<link rel="stylesheet" href="./styles/interactive-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">


<style>

body {
    font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: space-evenly;
	align-items: center;
	height: 100vh;
}

p a {
   text-decoration: none;
   font-size: 150%;
}

</style>
</head>

<body>
    <!--  Back button -->
    <p><a href="<%=request.getContextPath() + "/index"%>"><i class="fas fa-arrow-circle-left" aria-hidden="true"></i> Go Back</a></p>
       
	<img src="./images/register.png" alt="login_image" width="40%" />
	<div class="container">
		<!-- <div id="google_element"></div> -->
		<img class="form_logo" src="./images/bb_logo.png" alt="logo" />
		<h2>Voters Registration</h2>
		
		<form action="create" method="post" onsubmit="registerUser()">

			<label for="phoneNo">Phone No:</label> 
			<input type="tel" id="phoneNo" name="phone_number" autofocus required> 
			<label for="password">Password:</label> 
			<input type="password" id="password" name="password" required>
			<label for="address">Address:</label>
			<input type="text" id="address" name="address" required> 
			<label for="voterId">Voter ID No:</label> 
			<input type="number" id="voterId" name="voter_number" required>
			<label for="talukId">Taluk ID No:</label> 
			<input type="number" id="voterId" name="taluk_number" required>

			<button type="submit" style="color: white;">Register</button>
		</form>
	</div>
	
	<script>
    function registerUser() {
        var phoneNo = document.getElementById("phoneNo");
        var password = document.getElementById("password");
        var address = document.getElementById("address");
        var voterId = document.getElementById("voterId");
        var talukId = document.getElementById("talukId");

        var phoneNoPattern = /^\d{10}$/; // Assumes a 10-digit phone number
        var passwordPattern = /^.{6,}$/; // Assumes a minimum of 6 characters for the password
        var addressPattern = /^.{5,}$/; // Assumes a minimum of 5 characters for the address
        var voterIdPattern = /^\d+$/; // Assumes the voter ID contains only digits
        var talukIdPattern = /^\d+$/; // Assumes the taluk ID contains only digits

        var isValid = true;

        // Validate Phone Number
        if (!phoneNoPattern.test(phoneNo.value)) {
            alert("Invalid Phone Number. Please enter a 10-digit phone number.");
            isValid = false;
        }

        // Validate Password
        if (!passwordPattern.test(password.value)) {
            alert("Invalid Password. Password must be at least 8 characters long. ex: Njcat#10");
            isValid = false;
        }

        // Validate Address
        if (!addressPattern.test(address.value)) {
            alert("Invalid Address. Address must be at least 20 characters long.");
            isValid = false;
        }

        // Validate Voter ID Number
        if (!voterIdPattern.test(voterId.value)) {
            alert("Invalid Voter ID Number. Please enter a valid number.");
            isValid = false;
        }

        // Validate Taluk ID Number
        if (!talukIdPattern.test(talukId.value)) {
            alert("Invalid Taluk ID Number. Please enter a valid number.");
            isValid = false;
        }

        return isValid;
    }
</script>

</body>

</html>
