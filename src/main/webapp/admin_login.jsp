<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="./styles/style.css">
    <link rel="icon" href="./images/bb_logo.png" type="image/x-icon">
    <link rel="stylesheet" href="./assets/styles/interactive-style.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body {
            background-image: url(./images/admin2.jpg);
            background-attachment: fixed;
            background-repeat: no-repeat;
            background-size: cover;
        }

        header {
            margin-top: -9rem;
        }

        h2 {
            font-family: "Poppins", sans-serif;
            font-size: 250%;
            margin: 1rem;
            color: black;
        }

        .login-container {
            max-width: 400px;
            margin: auto;
            margin-top: 9rem;
            padding: 20px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: rgba(247, 242, 242, 0.734);
        }

        .login-container h2 {
            text-align: center;
        }

        .input-container {
            margin: 10%;
            position: relative;
            margin-left: -0.2rem;
        }

        .input-container i {
            position: absolute;
            top: 10px;
            left: 10px;
            color: #777;
        }

        .input-container input {
            padding-left: 40px;
            width: 100%;
            height: 40px;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
        }

        .login-button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 120%;
        }

        .login-button:hover {
            background-color: #0056b3;
        }

        span.error {
            color: red;
            font-weight: bold;
            font-family: sans-serif;
            background-color: #9624E210;
            font-size: 90%;
        }

        img.form_logo {
            margin-left: 40%;
            margin-bottom: -1rem;
            width: 20%;
        }
    </style>
</head>

<body>
    <header>
        <div class="logo_text">
            <img src="./images/bb_logo.png" alt="e_commison-logo" width="10%" height="10%"
                style="border-radius: 1.5rem;" /> <a href="<%=request.getContextPath() + "/index"%>">
                <p>BallotBox</p>
            </a>
        </div>
    </header>

    <div class="login-container">
        <h2>Admin</h2>

        <c:if test="${not empty errorMessage}">
            <p
                style="color: #f30c0f; font-weight: bold; text-align: center; background-color: #fcb5b6; border-radius: 4px; padding: 0.5rem;">
                ${errorMessage}</p>
        </c:if>

        <form action="adminlogin" method="post" onsubmit="validateAdminLogin()">
            <div class="input-container">
                <i class="fas fa-envelope"></i> <input type="email"
                    placeholder="Email" name="admin_email" autofocus >
                <span class="error" id="emailError"></span>
            </div>

            <div class="input-container">
                <i class="fas fa-lock"></i> <input type="password"
                    placeholder="Password" name="password" >
                <span class="error" id="passwordError"></span>
            </div>

            <button class="login-button" type="submit">Login</button>
        </form>
    </div>

    <script>
        function validateAdminLogin() {
            const emailInput = document.querySelector('input[name="admin_email"]');
            const passwordInput = document.querySelector('input[name="password"]');
            const emailError = document.getElementById('emailError');

            let isValid = true;

            emailError.textContent = '';

            if (emailInput.value.trim() === '') {
                emailError.textContent = 'Email is required';
                isValid = false;
            } else if (!isValidEmail(emailInput.value.trim())) {
                emailError.textContent = 'Invalid email format';
                isValid = false;
            }

            if (passwordInput.value.trim() === '') {
                passwordError.textContent = 'Password is required';
                isValid = false;
            }

            if (!isValid) {
                event.preventDefault();
            }
        }

        function isValidEmail(email) {
            // Basic email format validation
            const emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
            return emailRegex.test(email);
        }
    </script>
</body>

</html>
