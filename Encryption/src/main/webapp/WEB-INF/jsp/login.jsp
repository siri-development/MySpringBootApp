<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
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
            max-width: 1000px;
            height: 75vh;
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
            width: 150px;
            height: 150px;
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
            text-align: center;
        }

        .right-section h2 {
            color: #007bff;
            font-size: 28px;
            margin-bottom: 20px;
        }

        /* Form Styling */
        form {
            background-color: white;
            padding: 20px;
            width: 100%;
            max-width: 350px;
            margin: auto;
            text-align: left;
        }

        div.form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="password"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
            font-size: 16px;
        }

        /* Buttons */
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            width: 100%;
            transition: background 0.3s ease-in-out;
        }

        button:hover {
            background-color: #0056b3;
        }

        .signup-link {
            margin-top: 15px;
            text-align: center;
        }

        .signup-link a {
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }

        /* Error Message */
        .error-message {
            color: #f44336;
            font-size: 14px;
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Left Section (Green Background) -->
        <div class="left-section">
            <h2>Welcome Back!</h2>
            <img src="${pageContext.request.contextPath}/images/Lock.jpeg" alt="Login Image">
            <p>Login to access your account and manage your details.</p>
        </div>

        <!-- Right Section (White Background) -->
        <div class="right-section">
            <h2>Login</h2>
            <form method="post" action="login">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <button type="submit">Login</button>
                
                <!-- Display error message if exists -->
                <c:if test="${not empty message}">
                    <p class="error-message">${message}</p>
                </c:if>
                
                <div class="signup-link">
                    <p>Don't have an account? <a href="getSignUpPage">Sign up here</a></p>
                </div>
                <div class="signup-link">
                    <p>Forgot password? <a href="getforgotPage">Reset password</a></p>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
