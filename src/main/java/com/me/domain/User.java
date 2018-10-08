package com.me.domain;

import java.io.Serializable;
import java.util.HashSet;
/**
 * 
 * @title User
 * @author XF
 * @date 2018-09-20
 * @version 1.0
 */
import java.util.Set;

public class User implements Serializable {
	private Integer userId;
	private String userName;
	private String password;
	private String email;
	private Set<BankCard> setBank=new HashSet<BankCard>();
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Set<BankCard> getSetBank() {
		return setBank;
	}
	public void setSetBank(Set<BankCard> setBank) {
		this.setBank = setBank;
	}
	
	
}
