<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Bank Details</title>
   <style>
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
        .container {
            border: 2px solid #4CAF50;
            padding: 20px;
            width: 90%;
            max-width: 800px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            box-sizing: border-box;
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="date"], input[type="password"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }
        input:focus {
            border-color: #4CAF50;
            outline: none;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            margin-top: 20px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Bank Details</h2>
        <form method="post" action="/saveSignUpDetails">
            <div class="form-group">
                <label for="accountId">Account ID:</label>
                <input type="text" id="accountId" name="accountId" value="${bank.accountId}">
            </div>
            <div class="form-group">
                <label for="accountType">Account Type:</label>
                <input type="text" id="accountType" name="accountType" value="${bank.accountType}">
            </div>
            <div class="form-group">
                <label for="bankName">Bank Name:</label>
                <input type="text" id="bankName" name="bankName" value="${bank.bankName}">
            </div>
            <div class="form-group">
                <label for="accountHolderName">Account Holder Name:</label>
                <input type="text" id="accountHolderName" name="accountHolderName" value="${bank.accountHolderName}">
            </div>
            <div class="form-group">
                <label for="accountBranch">Account Branch:</label>
                <input type="text" id="accountBranch" name="accountBranch" value="${bank.accountBranch}">
            </div>
            <div class="form-group">
                <label for="accountIFSC">Account IFSC:</label>
                <input type="text" id="accountIFSC" name="accountIFSC" value="${bank.accountIFSC}">
            </div>
            <div class="form-group">
                <label for="accountOpenedDate">Account Opened Date:</label>
                <input type="date" id="accountOpenedDate" name="accountOpenedDate" value="${bank.accountOpenedDate}">
            </div>
            <div class="form-group">
                <label for="accountNumber">Account Number:</label>
                <input type="text" id="accountNumber" name="accountNumber" value="${bank.accountNumber}">
            </div>
            <div class="form-group">
                <label for="accountHavingCreditCard">Account Having Credit Card:</label>
                <input type="text" id="accountHavingCreditCard" name="accountHavingCreditCard" value="${bank.accountHavingCreditCard}">
            </div>
            <div class="form-group">
                <label for="accountHavingDebitCard">Account Having Debit Card:</label>
                <input type="text" id="accountHavingDebitCard" name="accountHavingDebitCard" value="${bank.accountHavingDebitCard}">
            </div>
            <div class="form-group">
                <label for="cardName">Card Name:</label>
                <input type="text" id="cardName" name="cardName" value="${bank.cardName}">
            </div>
            <div class="form-group">
                <label for="cardNumber">Card Number:</label>
                <input type="text" id="cardNumber" name="cardNumber" value="${bank.cardNumber}">
            </div>
            <div class="form-group">
                <label for="cardExpiryDate">Card Expiry Date:</label>
                <input type="date" id="cardExpiryDate" name="cardExpiryDate" value="${bank.cardExpiryDate}">
            </div>
            <div class="form-group">
                <label for="cardCVV">Card CVV:</label>
                <input type="text" id="cardCVV" name="cardCVV" value="${bank.cardCVV}">
            </div>
            <div class="form-group">
                <label for="nameONCard">Name on Card:</label>
                <input type="text" id="nameONCard" name="nameONCard" value="${bank.nameONCard}">
            </div>
            <div class="form-group">
                <label for="accountHavingNetBanking">Account Having Net Banking:</label>
                <input type="text" id="accountHavingNetBanking" name="accountHavingNetBanking" value="${bank.accountHavingNetBanking}">
            </div>
            <div class="form-group">
                <label for="netBankingUserName">Net Banking User Name:</label>
                <input type="text" id="netBankingUserName" name="netBankingUserName" value="${bank.netBankingUserName}">
            </div>
            <div class="form-group">
                <label for="netBankingPassCode">Net Banking Pass Code:</label>
                <input type="password" id="netBankingPassCode" name="netBankingPassCode" value="${bank.netBankingPassCode}">
            </div>
            <div class="form-group">
                <label for="mobileNumber">Mobile Number:</label>
                <input type="text" id="mobileNumber" name="mobileNumber" value="${bank.mobileNumber}">
            </div>
            <div class="form-group">
                <label for="aadhaarNumber">Aadhaar Number:</label>
                <input type="text" id="aadhaarNumber" name="aadhaarNumber" value="${bank.aadhaarNumber}">
            </div>
            <div class="form-group">
                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" value="${bank.dob}">
            </div>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="${bank.username}">
            </div>
            <button type="submit">Update</button>
        </form>
    </div>
</body>
</html>
