package com.demo.ml;

import com.demo.annotations.Decrypt;
import com.demo.annotations.Encrypt;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "DebitCards")
public class DebitCard {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long accountId;
	@Encrypt
	@Decrypt
	private String debitCardNbr;
	@Encrypt
	@Decrypt
	private String cvv;
	@Encrypt
	@Decrypt
	private String expiryDate;
	private String nameOnCard;
	private String bankName;
	private String filePath;
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public Long getAccountId() {
		return accountId;
	}
	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}
	public String getCvv() {
		return cvv;
	}
	public void setCvv(String cvv) {
		this.cvv = cvv;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getDebitCardNbr() {
		return debitCardNbr;
	}
	public void setDebitCardNbr(String debitCardNbr) {
		this.debitCardNbr = debitCardNbr;
	}
	public String getNameOnCard() {
		return nameOnCard;
	}
	public void setNameOnCard(String nameOnCard) {
		this.nameOnCard = nameOnCard;
	}
	@Override
	public String toString() {
		return "DebitCard [accountId=" + accountId + ", debitCardNbr=" + debitCardNbr + ", cvv=" + cvv + ", expiryDate="
				+ expiryDate + ", nameOnCard=" + nameOnCard + ", bankName=" + bankName + "]";
	}

}
