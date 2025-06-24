package com.demo.ml;

import com.demo.annotations.Decrypt;
import com.demo.annotations.Encrypt;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "BankAccounts")
public class EncryptionBean {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long accountId;
	private String isActive="Y";
	@Encrypt
	@Decrypt
	private String accountType;
	@Encrypt
	@Decrypt
	private String bankName;
	@Encrypt
	@Decrypt
	private String accountHolderName;
	@Encrypt
	@Decrypt
	private String accountBranch;
	@Encrypt
	@Decrypt
	private String accountIFSC;
	@Encrypt
	@Decrypt
	private String accountOpenedDate;
	@Encrypt
	@Decrypt
	private String accountNumber;
	@Encrypt
	@Decrypt
	private String accountHavingCreditCard;
	private String accountHavingDebitCard;
	@Encrypt
	@Decrypt
	private String cardName;
	@Encrypt
	@Decrypt
	private String cardNumber;
	@Encrypt
	@Decrypt
	private String cardExpiryDate;
	@Encrypt
	@Decrypt
	private String cardCVV;
	@Encrypt
	@Decrypt
	private String nameONCard;
	private String accountHavingNetBanking;
	@Encrypt
	@Decrypt
	private String netBankingUserName;
	@Encrypt
	@Decrypt
	private String netBankingPassCode;
	@Encrypt
	@Decrypt
	private String mobileNumber;
	@Encrypt
	@Decrypt
	private String aadhaarNumber;
	@Encrypt
	@Decrypt
	private String dob;
	
	private String username;
	private String filePath;
	
	private String search;
	
	
	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	private String password;

	public Long getAccountId() {
		return accountId;
	}

	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getAccountHolderName() {
		return accountHolderName;
	}

	public void setAccountHolderName(String accountHolderName) {
		this.accountHolderName = accountHolderName;
	}

	public String getAccountBranch() {
		return accountBranch;
	}

	public void setAccountBranch(String accountBranch) {
		this.accountBranch = accountBranch;
	}

	public String getAccountIFSC() {
		return accountIFSC;
	}

	public void setAccountIFSC(String accountIFSC) {
		this.accountIFSC = accountIFSC;
	}

	public String getAccountOpenedDate() {
		return accountOpenedDate;
	}

	public void setAccountOpenedDate(String accountOpenedDate) {
		this.accountOpenedDate = accountOpenedDate;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getAccountHavingCreditCard() {
		return accountHavingCreditCard;
	}

	public void setAccountHavingCreditCard(String accountHavingCreditCard) {
		this.accountHavingCreditCard = accountHavingCreditCard;
	}

	public String getAccountHavingDebitCard() {
		return accountHavingDebitCard;
	}

	public void setAccountHavingDebitCard(String accountHavingDebitCard) {
		this.accountHavingDebitCard = accountHavingDebitCard;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getCardExpiryDate() {
		return cardExpiryDate;
	}

	public void setCardExpiryDate(String cardExpiryDate) {
		this.cardExpiryDate = cardExpiryDate;
	}

	public String getCardCVV() {
		return cardCVV;
	}

	public void setCardCVV(String cardCVV) {
		this.cardCVV = cardCVV;
	}

	public String getNameONCard() {
		return nameONCard;
	}

	public void setNameONCard(String nameONCard) {
		this.nameONCard = nameONCard;
	}

	public String getAccountHavingNetBanking() {
		return accountHavingNetBanking;
	}

	public void setAccountHavingNetBanking(String accountHavingNetBanking) {
		this.accountHavingNetBanking = accountHavingNetBanking;
	}

	public String getNetBankingUserName() {
		return netBankingUserName;
	}

	public void setNetBankingUserName(String netBankingUserName) {
		this.netBankingUserName = netBankingUserName;
	}

	public String getNetBankingPassCode() {
		return netBankingPassCode;
	}

	public void setNetBankingPassCode(String netBankingPassCode) {
		this.netBankingPassCode = netBankingPassCode;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getAadhaarNumber() {
		return aadhaarNumber;
	}

	public void setAadhaarNumber(String aadhaarNumber) {
		this.aadhaarNumber = aadhaarNumber;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getIsActive() {
		return isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	@Override
	public String toString() {
		return "EncryptionBean [accountId=" + accountId + ", accountType=" + accountType + ", bankName=" + bankName
				+ ", accountHolderName=" + accountHolderName + ", accountBranch=" + accountBranch + ", accountIFSC="
				+ accountIFSC + ", accountOpenedDate=" + accountOpenedDate + ", accountNumber=" + accountNumber
				+ ", accountHavingCreditCard=" + accountHavingCreditCard + ", accountHavingDebitCard="
				+ accountHavingDebitCard + ", cardName=" + cardName + ", cardNumber=" + cardNumber + ", cardExpiryDate="
				+ cardExpiryDate + ", cardCVV=" + cardCVV + ", nameONCard=" + nameONCard + ", accountHavingNetBanking="
				+ accountHavingNetBanking + ", netBankingUserName=" + netBankingUserName + ", netBankingPassCode="
				+ netBankingPassCode + ", mobileNumber=" + mobileNumber + ", aadhaarNumber=" + aadhaarNumber + ", dob="
				+ dob + "]";
	}

}
