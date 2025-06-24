<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload File</title>
<style>
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

    .container {
        border: 2px solid #333;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 600px; /* Adjust as needed */
        box-sizing: border-box;
    }

    h1 {
        color: #333;
        text-align: center;
    }

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 20px;
    }

    input[type="file"] {
        margin-bottom: 20px;
    }

    button {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        cursor: pointer;
        border-radius: 4px;
    }

    button:hover {
        background-color: #45a049;
    }

    p {
        color: #ff0000;
        text-align: center;
    }
</style>
</head>
<body>
<div class="container">
    <h1>Upload File</h1>
    <form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/uploadFile">
        <label for="file">Select a file:</label>
            <input type="file" name="file" id="file" required />
            <input type="hidden" name="accountId" value="${id}" />
            <button type="submit">Upload</button>
    </form>
    <p>${message}</p>
</div>
</body>
</html>
