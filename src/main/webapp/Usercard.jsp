<!DOCTYPE html>
<html>
<head>
    <title>User Card</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        
        .card {
            max-width: 300px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
        }
        
        .card:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        .card h2 {
            margin-top: 0;
            color: #333;
        }
        
        .user-info {
            margin-top: 15px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            background-color: #f9f9f9;
            transition: background-color 0.3s ease;
        }
        
        .user-info:hover {
            background-color: #f0f0f0;
        }
        
        .user-info p {
            margin: 0;
            padding: 5px 0;
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>User Card</h2>
        <div class="user-info">
            <p><strong>Phone Number:</strong> ${user.phoneNumber}</p>
            <p><strong>Address:</strong> ${user.address}</p>
            <p><strong>Voter Id:</strong> ${user.voterId}</p>
            <p><strong>Taluk Id:</strong> ${user.talukId}</p>
        </div>
    </div>
</body>
</html>
