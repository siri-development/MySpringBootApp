<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up Details</title>
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
        .header {
            width: 90%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
            margin-bottom: 20px;
        }
         h2 {
            color: #333;
            margin: 0;
            text-align: center;
            flex-grow: 1; /* Allows h2 to take up all available space and center the text */
        }
       .header-buttons {
        position: absolute; /* Fix to top-left */
        top: 25px; 
        left: 70px;
        display: flex;
        gap: 10px; /* Add space between buttons */
    }

    .btn {
        text-decoration: none;
        color: white;
        background-color: #007bff; /* Blue color */
        padding: 10px 20px;
        border-radius: 5px;
        font-size: 16px;
        border: none;
        cursor: pointer;
        transition: background 0.3s ease-in-out;
    }

    .btn:hover {
        background-color: #0056b3; /* Darker blue on hover */
    }
        .table-container {
            width: 90%;
            overflow-x: auto;
            border: 2px solid #4CAF50;
            padding: 10px;
            box-sizing: border-box;
            background-color: #fff;
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
        td a {
            display: inline-block;
            color: white;
            background-color: #007BFF;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 20px;
            margin: 5px;
            text-align: center;
            font-size: 14px;
            width: 100%;
            box-sizing: border-box;
            transition: background-color 0.3s, transform 0.3s;
        }
        td a:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        .pagination {
            margin: 20px 0;
            text-align: center;
        }
        .pagination a {
            display: inline-block;
            padding: 10px 20px;
            margin: 0 5px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s, transform 0.3s;
        }
        .pagination a:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        .pagination .disabled {
            background-color: #ddd;
            pointer-events: none;
        }
          .search-container {
            width: 90%;
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }
        .search-container form {
            display: flex;
            align-items: center;
        }
        .search-container input[type="text"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            margin-right: 10px;
            width: 200px;
        }
        .search-container input[type="submit"] {
            padding: 10px 20px;
            background-color: #007BFF;
            border: none;
            border-radius: 4px;
            color: white;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }
        .search-container input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.05);
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
    <script>
    let deleteUrl = "";

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
        <h2>All Bank Details</h2>
	<div class="header-buttons">
		<a href="/getHomePage" class="btn">Back</a>
		 <a href="/addBank" class="btn">Add Bank</a>
	</div>

	<div class="search-container">
        <form action="/searchSignUpDetails" method="get">
            <input type="text" name="search" placeholder="Search..." value="${searchQuery}">
            <input type="submit" value="Search">
        </form>
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
	<div class="table-container">
        <table>
            <thead>
                <tr>
                    <!-- <th>Username</th>
                    <th>Password</th> -->
				<!--<th>Account ID</th> -->  
                    <th>Bank Name</th>
                    <th>Account Branch</th>
                    <th>Account Type</th>
                    <th>Account Holder Name</th>
                    <th>Account Number</th>
                    <th>Account IFSC</th>
                    <th>Account Opened Date</th>
                    <th>Mobile Number</th>
                    <th>Aadhaar Number</th>
                    <th>Date of Birth</th>
                    <th>Account Having Credit Card</th>
                    <th>Account Having Debit Card</th>
                    <th>Card Name</th>
                    <th>Card Number</th>
                    <th>Card Expiry Date</th>
                    <th>Card CVV</th>
                    <th>Name on Card</th>
                    <th>Account Having Net Banking</th>
                    <th>Net Banking User Name</th>
                    <th>Net Banking Pass Code</th>
                    <th>Edit</th>
                    <th>Delete</th>
                    <th>Upload</th>
                    <th>View</th>
                    <th>Action</th>
                    <th>Debit Card</th>
                    <th>Credit Card</th>
                </tr>
            </thead>
            <tbody>
            <c:if test="${not empty list}">
                <c:forEach var="user" items="${list}">
                    <tr>
                       <%--  <td>${user.username}</td>
                        <td>${user.password}</td> 
                        <td>${user.accountId}</td>--%>
                        <td>${user.bankName}</td>
                        <td>${user.accountBranch}</td>
                        <td>${user.accountType}</td>
                        <td>${user.accountHolderName}</td>
                        <td>${user.accountNumber}</td>
                        <td>${user.accountIFSC}</td>
                        <td>${user.accountOpenedDate}</td>
                        <td>${user.mobileNumber}</td>
                        <td>${user.aadhaarNumber}</td>
                        <td>${user.dob}</td>
                        <td>${user.accountHavingCreditCard}</td>
                        <td>${user.accountHavingDebitCard}</td>
                        <td>${user.cardName}</td>
                        <td>${user.cardNumber}</td>
                        <td>${user.cardExpiryDate}</td>
                        <td>${user.cardCVV}</td>
                        <td>${user.nameONCard}</td>
                        <td>${user.accountHavingNetBanking}</td>
                        <td>${user.netBankingUserName}</td>
                        <td>${user.netBankingPassCode}</td>
                        <td>
                            <a href="/editBank/${user.accountId}">Edit</a>
                        </td>
                        <td>
<%--                             <a href="/deleteBank/${user.accountId}" onclick="return confirm('Are you sure you want to delete this bank?');">Delete</a>
 --%>                        
 							<a href="#" class="delete" onclick="openModal('${user.accountId}')">Delete</a>
 						</td>
                        <td>
                            <a href="/uploadPage/${user.accountId}">Upload</a>
                        </td>
                        <td>
                            <a href="/files/${user.accountId}" target="_blank">View</a>
                        </td>
                        <td>
 							<a href="/getCustDetails?accountId=${user.accountId}">GO</a>
                        </td>
                         <td>
 							<a href="/getCardsDetail?accountId=${user.accountId}">ViewDC</a>
                        </td>
                         <td>
 							<a href="/showPassbook">ViewCC</a>
                        </td>
                    </tr>
                </c:forEach>
                </c:if>
            </tbody>
        </table>
    </div>
    <div class="pagination">
        <c:if test="${currentPage > 0}">
            <a href="?page=${currentPage - 1}">&laquo; Previous</a>
        </c:if>
        <c:if test="${totalPages > 0}">
        <c:forEach var="i" begin="0" end="${totalPages - 1}">
            <c:choose>
                <c:when test="${i == currentPage}">
                    <a class="disabled">${i + 1}</a>
                </c:when>
                <c:otherwise>
                    <a href="?page=${i}">${i + 1}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        </c:if>
        <c:if test="${currentPage < totalPages - 1}">
            <a href="?page=${currentPage + 1}">Next &raquo;</a>
        </c:if>
    </div>
   <%--  <!-- Check if there is an error message -->
<c:if test="${not empty message}">
    <p>${message}</p>
</c:if>

<!-- Check if the file URL is available to display the photo -->
<c:if test="${not empty fileUrl}">
<a href="${fileUrl}" target="_blank">
        <img src="${fileUrl}" alt="Uploaded Image" style="max-width: 100%; height: auto;" />
    </a></c:if> --%>
    
    
</body>
</html>
