<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
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
            min-height: 100vh;
        }

        /* Main Container */
        .container {
            display: flex;
            width: 80%;
            max-width: 900px;
            min-height: 85vh;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            overflow: hidden;
        }

        /* Left Section */
        .left-section {
            background-color: #4CAF50;
            color: white;
            width: 35%;
            padding: 25px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .left-section h2 {
            font-size: 24px;
            margin-bottom: 15px;
        }

        /* Right Section */
        .right-section {
            background-color: white;
            width: 65%;
            padding: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            box-sizing: border-box;
            overflow: auto;
        }

        .right-section h2 {
            color: #007bff;
            font-size: 22px;
            margin-bottom: 15px;
        }

        /* Form Styling */
        form {
            width: 100%;
            max-width: 350px;
            margin: auto;
            text-align: left;
            box-sizing: border-box;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            color: #333;
            margin-bottom: 3px;
            font-size: 14px;
        }

        input[type="text"], input[type="password"], input[type="email"], input[type="date"] {
            padding: 6px; /* Reduced size */
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
            font-size: 14px; /* Smaller font */
            box-sizing: border-box;
        }

        /* Buttons */
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px; /* Reduced padding */
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            margin-top: 15px;
            transition: background 0.3s ease-in-out;
            box-sizing: border-box;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* Error Message */
        .error-message {
            color: red;
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
            <h2>Join Us Today!</h2>
            <img src="${pageContext.request.contextPath}/images/Lock.jpeg" alt="Sign Up Image">
            <p>Create your account to start your journey with us.</p>
        </div>

        <!-- Right Section (White Background) -->
        <div class="right-section">
            <h2>Sign Up</h2>
            <form method="post" action="/saveSignUpDetails">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="mobileNumber">Mobile Number:</label>
                    <input type="text" id="mobileNumber" name="mobileNumber" required>
                </div>
                <div class="form-group">
                    <label for="aadhaarNumber">Aadhaar Number:</label>
                    <input type="text" id="aadhaarNumber" name="aadhaarNumber" required>
                </div>
                <div class="form-group">
                    <label for="dob">Date of Birth:</label>
                    <input type="date" id="dob" name="dob" required>
                </div>
                <button type="submit">Sign Up</button>
            </form>
        </div>
    </div>
</body>
</html>
