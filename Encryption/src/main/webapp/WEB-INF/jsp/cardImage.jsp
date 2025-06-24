<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Credit Card Sample</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card-container {
            width: 350px;
            height: 200px;
            background: linear-gradient(135deg, #007bff, #00c6ff);
            border-radius: 15px;
            color: white;
            padding: 20px;
            position: relative;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .chip {
            width: 40px;
            height: 30px;
            background: gold;
            border-radius: 5px;
            position: absolute;
            top: 20px;
            left: 20px;
        }

        .bank-name {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 18px;
            font-weight: bold;
        }

        .card-number {
            font-size: 20px;
            letter-spacing: 2px;
            margin-top: 50px;
            text-align: center;
        }

        .card-holder {
            position: absolute;
            bottom: 20px;
            left: 20px;
            font-size: 14px;
        }

        .expiry {
            position: absolute;
            bottom: 20px;
            right: 20px;
            font-size: 14px;
        }

        .input-form {
            margin-top: 20px;
            text-align: center;
        }

        input {
            padding: 10px;
            margin: 5px;
            width: 250px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
        }
    </style>
</head>
<body>

    <div>
        <div class="card-container">
            <div class="chip"></div>
            <div class="bank-name">${param.bankName != null ? param.bankName : "Your Bank"}</div>
            <div class="card-number">${param.cardNumber != null ? param.cardNumber : "**** **** **** ****"}</div>
            <div class="card-holder">Card Holder: ${param.cardHolder != null ? param.cardHolder : "Your Name"}</div>
            <div class="expiry">Exp: ${param.expiryDate != null ? param.expiryDate : "MM/YY"}</div>
        </div>

        <!-- Form to enter credit card details -->
        <form class="input-form" method="post">
            <input type="text" name="bankName" placeholder="Bank Name" required><br>
            <input type="text" name="cardNumber" placeholder="Card Number" required><br>
            <input type="text" name="cardHolder" placeholder="Card Holder Name" required><br>
            <input type="text" name="expiryDate" placeholder="MM/YY" required><br>
            <button type="submit">Update Card</button>
        </form>
    </div>

</body>
</html>
