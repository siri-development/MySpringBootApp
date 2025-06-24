<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Details</title>
    <style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	min-height: 100vh;
}

.container {
	display: flex;
	width: 90%;
	max-width: 1200px;
	background-color: #fff;
	border: 2px solid #4CAF50;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	padding: 20px;
	box-sizing: border-box;
	border-radius: 10px;
}

.left-section {
	width: 40%;
	background: linear-gradient(135deg, #4CAF50, #66BB6A);
	padding: 20px;
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px;
	color: white;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
}

.photo-container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 50%;
}

.photo-container img {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	border: 3px solid white;
}

.main-details {
	width: 100%;
	height: 50%;
	text-align: center;
}

.main-details p {
	font-size: 16px;
	margin: 5px 0;
}

.right-section {
	width: 60%;
	padding: 20px;
	border-left: 2px solid #ddd;
}

h2 {
	color: #333;
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

.button-group {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.button-group a {
	text-decoration: none;
	color: white;
	background-color: blue;
	padding: 10px 20px;
	border-radius: 4px;
	margin: 0 10px;
	font-size: 16px;
	text-align: center;
}

.button-group a:hover {
	background-color: #45a049;
}

.button-group a.delete {
	background-color: blue;
}

.button-group a.delete:hover {
	background-color: light blue;
}

.photo-container img {
	width: 250px;
	height: auto; /* Maintains aspect ratio */
	border-radius: 12px;
	border: 3px solid #007bff;
	object-fit: contain; /* Ensures no distortion */
	max-width: 100%; /* Responsive */
}
.modal {
    display: none; /* Hidden by default */
    position: fixed;
    z-index: 1000;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    width: 400px;
    background-color: white;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
    border-radius: 8px;
    text-align: center;
    padding: 20px;
}

.modal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 18px;
    font-weight: bold;
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
}

.close-btn {
    cursor: pointer;
    font-size: 20px;
    color: red;
    font-weight: bold;
    border: none;
    background: none;
}

.modal-content {
    padding: 20px;
}

.modal-buttons {
    display: flex;
    justify-content: center;
    margin-top: 15px;
}

.modal-buttons button {
    padding: 10px 15px;
    margin: 5px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    font-size: 16px;
}

.confirm-btn {
    background-color: green;
    color: white;
}

.cancel-btn {
    background-color: gray;
    color: white;
}

</style>
<script>let deleteUrl = "";

function openModal(accountId) {
    deleteUrl = "/deleteBank/" + accountId; // Store the delete URL
    document.getElementById("deleteModal").style.display = "block";
}

function closeModal() {
    document.getElementById("deleteModal").style.display = "none";
}

function confirmDelete() {
    window.location.href = deleteUrl; // Redirect to delete URL
}
</script>
</head>
<body>
    <div class="container">
        <!-- Left Section (Photo in top half, Main Details in bottom half) -->
        <div class="left-section">
            <div class="photo-container">
                <img src="${pageContext.request.contextPath}/images/Siri.jpg" alt="Customer Photo" >   
<!--                  style="width: 200px; height: 250px; border-radius: 10px; border: 2px solid #4CAF50;">             
 -->            </div>
            <div class="main-details">
                <p><strong>Name:</strong> ${details.username}</p>
                <p><strong>Date of Birth:</strong> ${details.dob}</p>
                <p><strong>Mobile Number:</strong> ${details.mobileNumber}</p>
                <p><strong>Aadhaar Number:</strong> ${details.aadhaarNumber}</p>
            </div>
        </div>
		<div id="deleteModal" class="modal">
			<div class="modal-header">
				<span>Confirm Deletion</span>
				<button class="close-btn" onclick="closeModal()">✖</button>
			</div>
			<div class="modal-content">
				<p>Are you sure you want to delete this record?</p>
				<div class="modal-buttons">
					<button class="cancel-btn" onclick="closeModal()">Cancel</button>
					<button class="confirm-btn" onclick="confirmDelete()">OK</button>
				</div>
			</div>
		</div>


		<!-- Right Section (Account Details) -->
        <div class="right-section">
            <h2>Customer Details</h2>
            <table>
                <tbody>
                    <tr><td><strong>Account ID:</strong></td><td>${details.accountId}</td></tr>
                    <tr><td><strong>Account Type:</strong></td><td>${details.accountType}</td></tr>
                    <tr><td><strong>Bank Name:</strong></td><td>${details.bankName}</td></tr>
                    <tr><td><strong>Account Holder Name:</strong></td><td>${details.accountHolderName}</td></tr>
                    <tr><td><strong>Account Branch:</strong></td><td>${details.accountBranch}</td></tr>
                    <tr><td><strong>Account IFSC:</strong></td><td>${details.accountIFSC}</td></tr>
                    <tr><td><strong>Account Opened Date:</strong></td><td>${details.accountOpenedDate}</td></tr>
                    <tr><td><strong>Account Number:</strong></td><td>${details.accountNumber}</td></tr>
                    <tr><td><strong>Credit Card:</strong></td><td>${details.accountHavingCreditCard}</td></tr>
                    <tr><td><strong>Debit Card:</strong></td><td>${details.accountHavingDebitCard}</td></tr>
                    <tr><td><strong>Card Name:</strong></td><td>${details.cardName}</td></tr>
                    <tr><td><strong>Card Number:</strong></td><td>${details.cardNumber}</td></tr>
                    <tr><td><strong>Card Expiry Date:</strong></td><td>${details.cardExpiryDate}</td></tr>
                    <tr><td><strong>Name on Card:</strong></td><td>${details.nameONCard}</td></tr>
                    <tr><td><strong>Net Banking:</strong></td><td>${details.accountHavingNetBanking}</td></tr>
                    <tr><td><strong>Net Banking User:</strong></td><td>${details.netBankingUserName}</td></tr>
                </tbody>
            </table>

            <div class="button-group">
                <a href="/editBank/${details.accountId}">Edit</a>
				<a href="#" class="delete" onclick="openModal('${details.accountId}')">Delete</a>
                <a href="/getSignUpDetails">Back</a>
            </div>
        </div>
    </div>
</body>
</html>
