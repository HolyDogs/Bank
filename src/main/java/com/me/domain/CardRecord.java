package com.me.domain;

import java.io.Serializable;

public class CardRecord implements Serializable {
	private Integer recordId;
	private String record;
	private String date;
	private BankCard bankCard;
	
	public Integer getRecordId() {
		return recordId;
	}
	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}
	public String getRecord() {
		return record;
	}
	public void setRecord(String record) {
		this.record = record;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public BankCard getBankCard() {
		return bankCard;
	}
	public void setBankCard(BankCard bankCard) {
		this.bankCard = bankCard;
	}
	
	
}
