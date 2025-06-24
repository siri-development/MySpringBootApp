<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Bank Details</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	overflow: hidden;
}

.container {
	border: 2px solid #4CAF50;
	padding: 20px;
	width: 90%;
	max-width: 800px;
	height: 90vh;
	overflow-y: auto;
	box-sizing: border-box;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

h2 {
	color: #4CAF50;
	text-align: center;
	font-size: 26px;
	margin-bottom: 20px;
	font-weight: bold;
}

form {
	width: 100%;
	display: flex;
	flex-direction: column;
}

/* .form-group {
	display: flex;
	margin-bottom: 15px;
	align-items: center;
	gap: 10px;
}

label {
	flex: 0 0 160px;
	font-weight: bold;
	text-align: right;
	color: #333;
} */
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
	flex: 1;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 100%;
	box-sizing: border-box;
	font-size: 14px;
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
	transition: 0.3s ease-in-out;
}

button:hover {
	background-color: #45a049;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.modal {
	display: none;
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
}

.modal-content {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	width: 500px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

.modal-form-group {
	display: flex;
	justify-content: space-between;
	margin-bottom: 15px;
	align-items: center;
}

.modal-form-group label {
	flex: 0 0 150px;
	font-weight: normal;
	text-align: right;
}

.modal-form-group input {
	width: 70%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.modal-content button {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 10px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	width: 100%;
	transition: 0.3s ease-in-out;
}

.modal-content button:hover {
	background-color: #45a049;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}
/* Compact Toggle Switch */
.switch {
	position: relative;
	display: inline-block;
	width: 28px; /* Reduced width */
	height: 18px; /* Keeping height the same */
}

/* Hide default checkbox */
.switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

/* Slider styling */
.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	transition: 0.3s;
	border-radius: 18px;
}

/* Rounded toggle */
.slider.round {
	border-radius: 18px;
}

/* The small circle inside the switch */
.slider:before {
	position: absolute;
	content: "";
	height: 12px; /* Keeping small circle */
	width: 12px;
	left: 2px;
	bottom: 3px;
	background-color: white;
	transition: 0.3s;
	border-radius: 50%;
}

/* When checked, change color and move circle */
.switch input:checked+.slider {
	background-color: #4CAF50;
}

.switch input:checked+.slider:before {
	transform: translateX(10px);
	/* Less movement to match reduced length */
}
</style>
</head>
<body>
	<div class="container">
		<h2>Add Bank Details</h2>
		<form method="post" action="/saveSignUpDetails">
			<div class="form-group">
				<label for="accountType">Account Type:</label> <input type="text"
					id="accountType" name="accountType" required>
			</div>
			<div class="form-group">
				<label for="bankName">Bank Name:</label> <input type="text"
					id="bankName" name="bankName" required>
			</div>
			<div class="form-group">
				<label for="accountHolderName">Account Holder Name:</label> <input
					type="text" id="accountHolderName" name="accountHolderName"
					required>
			</div>
			<div class="form-group">
				<label for="accountBranch">Account Branch:</label> <input
					type="text" id="accountBranch" name="accountBranch" required>
			</div>
			<div class="form-group">
				<label for="accountIFSC">Account IFSC:</label> <input type="text"
					id="accountIFSC" name="accountIFSC" required>
			</div>
			<div class="form-group">
				<label for="accountOpenedDate">Account Opened Date:</label> <input
					type="date" id="accountOpenedDate" name="accountOpenedDate"
					required>
			</div>
			<div class="form-group">
				<label for="accountNumber">Account Number:</label> <input
					type="text" id="accountNumber" name="accountNumber" required>
			</div>
			<div class="form-group">
				<label for="accountHavingCreditCard">Account Having Credit
					Card:</label> <label class="switch"> <input type="checkbox"
					class="toggleCreditCard" id="toggleCreditCard"> <span
					class="slider round"></span>
				</label>
			</div>

			<div class="form-group">
				<label for="accountHavingDebitCard">Account Having Debit
					Card:</label> <input type="text" id="accountHavingDebitCard"
					name="accountHavingDebitCard" required>
			</div>
			<div class="form-group">
				<label for="accountHavingNetBanking">Account Having Net
					Banking:</label> <input type="text" id="accountHavingNetBanking"
					name="accountHavingNetBanking" required>
			</div>
			<div class="form-group">
				<label for="netBankingUserName">Net Banking User Name:</label> <input
					type="text" id="netBankingUserName" name="netBankingUserName"
					required>
			</div>
			<div class="form-group">
				<label for="netBankingPassCode">Net Banking Pass Code:</label> <input
					type="password" id="netBankingPassCode" name="netBankingPassCode"
					required>
			</div>
			<div class="form-group">
				<label for="mobileNumber">Mobile Number:</label> <input type="text"
					id="mobileNumber" name="mobileNumber" required>
			</div>
			<div class="form-group">
				<label for="aadhaarNumber">Aadhaar Number:</label> <input
					type="text" id="aadhaarNumber" name="aadhaarNumber" required>
			</div>
			<div class="form-group">
				<label for="dob">Date of Birth:</label> <input type="date" id="dob"
					name="dob" required>
			</div>
			<div class="form-group">
				<label for="username">Username:</label> <input type="text"
					id="username" name="username" required>
			</div>
			<button type="submit">Submit</button>
		</form>
	</div>

	<!-- Modal Structure for Credit Card details -->
<div id="creditCardModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Credit Card Details</h2>
        <form action="/saveCardDetails" method="post">
            <input type="hidden" id="accountId" name="accountId" value="${accountId}">
            
            <div class="modal-form-group">
                <label for="bankName">Card Name:</label>
                <input type="text" id="bankName" name="bankName" required>
            </div>
            <div class="modal-form-group">
                <label for="NameOnCard">Name On Card:</label>
                <input type="text" id="NameOnCard" name="NameOnCard" required>
            </div>
            
            <div class="modal-form-group">
                <label for="DebitCardNbr">Card Number:</label>
                <input type="text" id="DebitCardNbr" name="DebitCardNbr" required>
            </div>
            
            <div class="modal-form-group">
                <label for="cvv">CVV Code:</label>
                <input type="text" id="cvv" name="cvv" required>
            </div>
            
            <div class="modal-form-group">
                <label for="expiryDate">Expiry Date:</label>
                <input type="date" id="expiryDate" name="expiryDate" required>
            </div>
            
            <button type="submit" id="submitButton">Save</button>
        </form>
    </div>
</div>


	<script>
	document.addEventListener('DOMContentLoaded', function () {
	    var modal = document.getElementById('creditCardModal');
	    var span = document.getElementsByClassName('close')[0];
	    var toggleCreditCard = document.getElementById('toggleCreditCard');
	    var submitButton = document.getElementById('submitButton');

	    // Ensure modal is hidden initially
	    modal.style.display = 'none';

	    // Close modal on (X) button click
	    span.onclick = function () {
	        modal.style.display = 'none';
	        toggleCreditCard.checked = false;
	    };

	    // Close modal when clicking outside
	    window.onclick = function (event) {
	        if (event.target == modal) {
	            modal.style.display = 'none';
	            toggleCreditCard.checked = false;
	        }
	    };

	    // Show modal only when toggle is enabled
	    toggleCreditCard.addEventListener('change', function () {
	        if (this.checked) {
	            modal.style.display = 'flex';
	        } else {
	            modal.style.display = 'none';
	        }
	    });

	    // Keep toggle switch checked after submission
	    submitButton.addEventListener('click', function () {
	        modal.style.display = 'none';
	    });
	});    </script>
</body>
</html>
