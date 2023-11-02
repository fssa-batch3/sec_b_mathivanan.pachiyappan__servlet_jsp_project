<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Registration</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/user_register.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/bb_logo.png" type="image/x-icon">
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/interactive-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>

body {
    font-family: Arial, sans-serif;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: contain;
	background-image: url("<%= request.getContextPath() %>/images/register.png");
}

div.container {
	max-width: 400px;
	float: right;
	margin-right: 9rem;
	padding: 20px;
	width: 100%;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: rgba(186, 177, 177, 0.5);
}

p a {
   text-decoration: none;
   font-size: 150%;
   margin : 2rem;
}

span {
	margin-bottom: 15px;
	font-weight: bold;
	font-size: 80%;
}

.password-input {
    position: relative;
    display: inline-block;
}

#password {
    padding-left: -1px; /* Adjust the padding to make space for the icon */
    width: 95%;
}

#eye-icon {
    position: absolute;
    top: 65%;
    right: 5px; /* Adjust the right distance from the input field */
    transform: translateY(-50%);
    cursor: pointer;
    font-size: 130%;
}

/* Style the eye icon when password is visible */
#password[type="text"] + #passwordToggle #eye-icon {
    font-size: 130%;
    color: #007bff; /* Change the color when password is visible */
}

</style>
</head>

<body>
    <p><a href="<%=request.getContextPath() + "/index"%>"><i class="fas fa-arrow-circle-left" aria-hidden="true"></i> Go Back</a></p>
    
    <div class="container">
        <img class="form_logo" src="<%= request.getContextPath() %>/images/bb_logo.png" alt="logo" />
        <h2>Voters Registration</h2>
        
        
        <c:if test="${not empty errorMessage}">
			<p
				style="color: #f30c0f; font-weight: bold; text-align: center; background-color: #fcb5b6; border-radius: 4px; padding: 0.5rem;">
				${errorMessage}</p>
		</c:if>
        
        <form action="create" method="post" onsubmit="registerUser()">
            <label for="phoneNo">Phone No:</label>
            <input type="tel" id="phoneNo" name="phone_number" value="${empty phoneNumber ? '' : phoneNumber}" autofocus >
            <span id="phoneNoError" style="color: red;"></span>
            
            <label for="password">Password:</label>
            <div class="password-input">
                <input type="password" id="password" name="password" value="${empty password ? '' : password}" >
                <span id="passwordToggle" onclick="togglePasswordVisibility()">
                <i class="fas fa-eye-slash" id="eye-icon"></i>
                </span>
            </div>
            <span id="passwordError" style="color: red;"></span>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="${empty address ? '' : address}" >
            <span id="addressError" style="color: red;"></span>
            
            <label for="voterId">Voter ID No:</label>
            <input type="number" id="voterId" name="voter_number" value="${empty voterId ? '' : voterId}" >
            <span id="voterIdError" style="color: red;"></span>

            <label for="talukId">Taluk ID No:</label>
            <input type="number" id="talukId" name="taluk_number" value="${empty talukId ? '' : talukId}" >
            <span id="talukIdError" style="color: red;"></span>

            <button type="submit" style="color: white;">Register</button>
        </form>
    </div>	
	
	<script>
	    function registerUser() {
	        // Get form inputs
	        const phoneNoInput = document.getElementById("phoneNo");
	        const passwordInput = document.getElementById("password");
	        const addressInput = document.getElementById("address");
	        const voterIdInput = document.getElementById("voterId");
	        const talukIdInput = document.getElementById("talukId");

	        // Get error message elements
	        const phoneNoError = document.getElementById("phoneNoError");
	        const passwordError = document.getElementById("passwordError");
	        const addressError = document.getElementById("addressError");
	        const voterIdError = document.getElementById("voterIdError");
	        const talukIdError = document.getElementById("talukIdError");

	        // Initialize a flag to check if the form is valid
	        let isValid = true;

	        // Reset previous error messages
	        phoneNoError.textContent = "";
	        passwordError.textContent = "";
	        addressError.textContent = "";
	        voterIdError.textContent = "";
	        talukIdError.textContent = "";

	        // Perform validation
	        if (phoneNoInput.value.trim() === "") {
	            phoneNoError.textContent = "Phone Number is required";
	            isValid = false;
	        } else if (!/^[6-9]\d{9}$/.test(phoneNoInput.value.trim())) {
	            phoneNoError.textContent = "Phone Number must start with a digit from 6 to 9 and be 10 digits in total";
	            isValid = false;
	        }

	        if (passwordInput.value.trim() === "") {
	            passwordError.textContent = "Password is required";
	            isValid = false;
	        } else if (!/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#$%^&+=]).{8,}$/.test(passwordInput.value.trim())) {
	            passwordError.textContent = "Password must contain at least one uppercase letter, one lowercase letter, one digit, one special character, and be at least 8 characters long";
	            isValid = false;
	        }

	        if (addressInput.value.trim() === "") {
	            addressError.textContent = "Address is required";
	            isValid = false;
	        }

	        if (voterIdInput.value.trim() === "") {
	            voterIdError.textContent = "Voter ID Number is required";
	            isValid = false;
	        } else if (!/^[1-9]\d{7}$/.test(voterIdInput.value.trim())) {
	            voterIdError.textContent = "Voter ID Number must be 8 digits ex: 28755431";
	            isValid = false;
	        }

	        if (talukIdInput.value.trim() === "") {
	            talukIdError.textContent = "Taluk ID Number is required";
	            isValid = false;
	        } else if (!/^\d$/.test(talukIdInput.value.trim())) {
	            talukIdError.textContent = "Taluk ID Number must be only digits";
	            isValid = false;
	        }

	        // If the form is not valid, prevent submission
	        if (!isValid) {
	            event.preventDefault();
	        }
	    }

	    //Password eye-view icon js
	    
	    function togglePasswordVisibility() {
        const passwordInput = document.getElementById("password");
        const eyeIcon = document.getElementById("eye-icon");

        if (passwordInput.type === "password") {
        passwordInput.type = "text";
        eyeIcon.classList.remove("fa-eye-slash");
        eyeIcon.classList.add("fa-eye");
        } else {
        passwordInput.type = "password";
        eyeIcon.classList.remove("fa-eye");
        eyeIcon.classList.add("fa-eye-slash");
        }
        }

	</script>

</body>

</html>
