<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link rel="stylesheet" href="./styles/user_register.css">
    <link rel="icon" href="./images/bb_logo.png" type="image/x-icon">
    <link rel="stylesheet" href="./styles/interactive-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>
    
    <img src="./images/register.png" alt="login_image" width="40%" />
    <div class="container">
        <!-- <div id="google_element"></div> -->
        <img class ="form_logo" src="./images/bb_logo.png" alt="logo"/>
        <h2>Voters Registration</h2>

        <form action="create" method="post">

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

    <!-- Main Js link -->
</body>

</html>
