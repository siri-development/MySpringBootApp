<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
    <style>
        /* Style for the body */
        body {
            font-family: Arial, sans-serif; /* Font style for the page */
            background-color: white; /* Grey background color */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh; /* Full viewport height */
        }

        /* Style for the form container */
        form {
            background-color: #fff; /* White background for the form */
            padding: 20px;
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            width: 300px; /* Fixed width for the form */
            text-align: center; /* Center text inside form */
        }

        /* Style for the form fields */
        div {
            display: flex;
            justify-content: space-between; /* Ensure labels are beside inputs */
            margin-bottom: 15px;
            align-items: center; /* Align labels and inputs vertically */
        }

        label {
            margin-right: 10px; /* Space between label and input */
            font-weight: bold; /* Make the label text bold */
            color: #333; /* Dark grey color for labels */
            width: 80px; /* Fixed width for labels */
            text-align: right; /* Align label text to the right */
        }

        input[type="text"], input[type="password"] {
            padding: 8px;
            border: 1px solid #ccc; /* Light grey border */
            border-radius: 4px; /* Rounded corners */
            width: 180px; /* Fixed width for input fields */
        }

        button {
            background-color: blue; /* Orange background color */
            color: white; /* White text color */
            border: none;
            padding: 10px;
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Pointer cursor on hover */
            font-size: 16px; /* Font size */
            width: 100%; /* Full width button */
        }

        button:hover {
            background-color: ligth blue; /* Slightly darker orange on hover */
        }

        .signup-link {
            margin-top: 15px;
        }

        .signup-link a {
            color: #007BFF; /* Blue color for the link */
            text-decoration: none;
        }

        .signup-link a:hover {
            text-decoration: underline; /* Underline on hover */
        }

        /* Style for the error message */
        .error-message {
            color: #f44336; /* Red color for error messages */
            font-size: 14px; /* Slightly smaller font size */
            margin-top: 10px;
            opacity: 1; /* Start fully visible */
            animation: fadeOut 5s forwards; /* Apply fadeOut animation */
        }

        /* Keyframes for fade out animation */
        @keyframes fadeOut {
            0% {
                opacity: 1; /* Fully visible */
            }
            100% {
                opacity: 0; /* Fully transparent */
            }
        }
    </style>
</head>
<body>
        <h2>The Forgot functionality in  progress</h2>
     
</body>
</html>
