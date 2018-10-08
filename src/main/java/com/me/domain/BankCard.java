package com.me.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
/**
 * 
 * @title bankcard
 * @author XF
 * @date 2018-09-20
 * @version 1.0
 */

public class BankCard implements Serializable{
	
	private Integer cardId;
	private Integer deposit;
	private String category;
	private User user;
	private Set<CardRecord> setRecord=new HashSet<CardRecord>();
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getCardId() {
		return cardId;
	}
	public void setCardId(Integer cardId) {
		this.cardId = cardId;
	}
	public Integer getDeposit() {
		return deposit;
	}
	public void setDeposit(Integer deposit) {
		this.deposit = deposit;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Set<CardRecord> getSetRecord() {
		return setRecord;
	}
	public void setSetRecord(Set<CardRecord> setRecord) {
		this.setRecord = setRecord;
	}
}
