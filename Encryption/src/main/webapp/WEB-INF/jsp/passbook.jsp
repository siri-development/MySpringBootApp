<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
    <title>Bank Passbook</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #2C3E50, #4CA1AF);
            position: relative;
            border: 10px solid white;
            padding: 20px;
        }

        .container {
            width: 500px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        .title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            text-transform: uppercase;
            color: #2C3E50;
        }

        .info {
            text-align: left;
            font-size: 16px;
            margin: 10px 0;
        }

        .label {
            font-weight: bold;
            color: #34495E;
        }

        .value {
            color: #2C3E50;
        }

        .footer {
            margin-top: 20px;
        }

        .back-btn {
            background: linear-gradient(to right, #ff512f, #dd2476);
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: 0.3s;
        }

        .back-btn:hover {
            background: linear-gradient(to right, #dd2476, #ff512f);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="title">Bank Passbook</div>
        <div class="info">
            <span class="label">Account Holder:</span> <span class="value">siri</span>
        </div>
        <div class="info">
            <span class="label">Account Number:</span> <span class="value">38768638</span>
        </div>
        <div class="info">
            <span class="label">Bank Name:</span> <span class="value">kotak</span>
        </div>
        <div class="info">
            <span class="label">Branch:</span> <span class="value">terpole}</span>
        </div>
        <div class="info">
            <span class="label">IFSC Code:</span> <span class="value">fbdsfuhfuhsd</span>
        </div>
        <div class="info">
            <span class="label">Account Type:</span> <span class="value">dsfbjkdhf</span>
        </div>
        <div class="footer">
            <button class="back-btn" onclick="window.history.back()">Go Back</button>
        </div>
    </div>
</body>
</html>
