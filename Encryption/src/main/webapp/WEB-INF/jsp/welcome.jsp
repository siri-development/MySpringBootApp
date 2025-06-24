<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bank & Cards Details</title>
    <style>
        /* General Page Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Main Container */
        .container {
            display: flex;
            width: 90%;
            max-width: 1200px;
            height: 90vh;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            overflow: hidden;
        }

        /* Left Section (Green Background) */
        .left-section {
            background-color: #4CAF50;
            color: white;
            width: 40%;
            padding: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .left-section h2 {
            font-size: 28px;
            margin-bottom: 20px;
        }

        .left-section img {
            width: 180px; /* Adjust image size */
            height: 180px;
            border-radius: 50%;
            border: 4px solid white;
            margin-bottom: 20px;
            object-fit: cover;
        }

        /* Right Section (White Background) */
        .right-section {
            background-color: white;
            width: 60%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .right-section h2 {
            color: #007bff;
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
        }

        /* Buttons */
        .button-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
        }

        .button-container a {
            background-color: #007bff;
            color: white;
            padding: 14px 25px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 18px;
            margin: 10px;
            width: 80%;
            text-align: center;
            font-weight: bold;
            transition: background 0.3s ease-in-out;
        }

        .button-container a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Left Section (Green Background) -->
        <div class="left-section">
            <h2>Bank & Cards Details</h2>
            <img src="${pageContext.request.contextPath}/images/Lock.jpeg" alt="User Image">
            <p>Manage your bank accounts and card details easily.</p>
        </div>

        <!-- Right Section (White Background) -->
        <div class="right-section">
            <h2>Bank & Cards Management</h2>
            <div class="button-container">
                <a href="/login">Back</a>
                <a href="/getSignUpDetails">View All Bank Details</a>
                <a href="/addBank">Add Bank Details</a>
                <a href="/getByID">Get Bank Details By ID</a>
            </div>
        </div>
    </div>
</body>
</html>
