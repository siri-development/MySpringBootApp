<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
    <title>Debit & Credit Card Details</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #f4f4f4, #e0e0e0);
            position: relative;
            border: 10px solid white;
            padding: 20px;
        }

        .go-back {
            position: absolute;
            top: 20px;
            left: 20px;
            background: linear-gradient(to right, #ff512f, #dd2476);
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: 0.3s;
        }

        .go-back:hover {
            background: linear-gradient(to right, #dd2476, #ff512f);
        }

        .card-container {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .card-wrapper {
            text-align: center;
        }

        .card-title {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .card {
            width: 430px;
            height: 250px;
            border-radius: 12px;
            background: linear-gradient(135deg, #2D3E50, #1E2A38);
            color: white;
            padding: 20px;
            position: relative;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
            transition: transform 0.3s ease-in-out;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            overflow: hidden;
        }

        .card.credit {
            background: linear-gradient(135deg, #FF512F, #DD2476);
        }

       /*  .card:hover {
            transform: scale(1.05);
        } */

        .bank-logo {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .bank-logo img {
            width: 90px;
        }

        .chip {
            width: 50px;
            position: absolute;
            top: 70px;
            left: 20px;
        }

        .card-number {
            font-size: 22px;
            letter-spacing: 2px;
            text-align: center;
            margin-top: 40px;
            font-weight: bold;
            background: rgba(255, 255, 255, 0.1);
            padding: 5px;
            border-radius: 5px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.3);
        }

        .card-info {
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            margin-top: 15px;
            padding: 0 15px;
        }

        .expiry, .cvv {
            font-weight: bold;
        }

        .card-holder {
            text-transform: uppercase;
            font-size: 18px;
            font-weight: bold;
            text-align: left;
            margin-top: 15px;
            padding-left: 15px;
        }
    </style>
</head>
<body>
    <button class="go-back" onclick="window.history.back()">Go Back</button>
    <div class="card-container">
        <div class="card-wrapper">
            <div class="card-title">Debit Card</div>
            <div class="card">
                <div class="bank-logo">
                    <span>${dc.bankName}</span>
                    <img src="${pageContext.request.contextPath}/images/Kotak_Mahindra_Bank_logo_image_picture.png" alt="Bank Logo">
                </div>
                <img src="${pageContext.request.contextPath}/images/Chip.jpeg" class="chip" alt="Chip">
                <div class="card-number">${dc.debitCardNbr}</div>
                <div class="card-info">
                    <div class="expiry">VALID THRU: ${dc.expiryDate}</div>
                    <div class="cvv">CVV: ${dc.cvv}</div>
                </div>
                <div class="card-holder">${dc.nameOnCard}</div>
            </div>
        </div>
        <div class="card-wrapper">
            <div class="card-title">Credit Card</div>
            <div class="card credit">
                <div class="bank-logo">
                    <span>${dc.bankName}</span>
                    <img src="${pageContext.request.contextPath}/images/Kotak_Mahindra_Bank_logo_image_picture.png" alt="Bank Logo">
                </div>
                <img src="${pageContext.request.contextPath}/images/Chip.jpeg" class="chip" alt="Chip">
                <div class="card-number">${dc.debitCardNbr}</div>
                <div class="card-info">
                    <div class="expiry">VALID THRU: ${dc.expiryDate}</div>
                    <div class="cvv">CVV: ${dc.cvv}</div>
                </div>
                <div class="card-holder">${dc.nameOnCard}</div>
            </div>
        </div>
    </div>
</body>
</html>
