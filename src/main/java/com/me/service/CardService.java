package com.me.service;

import java.io.Serializable;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.daoimpl.BankCardDaoImpl;
import com.me.domain.BankCard;


@Service
public class CardService {

	@Autowired
	private BankCardDaoImpl bankCardDaoImpl;

	@Transactional
	public BankCard returnCard(Serializable id) {
		if(id!=null) {
			return bankCardDaoImpl.get(id);
		}else {
			return null;
		}
	}
	
	@Transactional
	public boolean addCard(BankCard bankCard) {
		BankCard bCard=bankCardDaoImpl.get(bankCard.getCardId());
		if (bCard==null) {
			bankCardDaoImpl.save(bankCard);
			return true;
		}else {
			return false;
		}
	}
	
	@Transactional
	public void removeCard(BankCard bankCard) {
		bankCardDaoImpl.remove(bankCard);
	}
	
	@Transactional
	public void updateCard(BankCard bankCard) {
		bankCardDaoImpl.remove(bankCard);
	}
	
	@Transactional
	public boolean transfer(Serializable id1,Serializable id2,int money) {
		if(bankCardDaoImpl.findMoney(id1)>money) {	
				bankCardDaoImpl.decDeposit(id1, money);
				bankCardDaoImpl.addDeposit(id2, money);
				return true;
		}else {
			return false;
		}
	}

	@Transactional
	public int count() {
		return bankCardDaoImpl.findCount();
	}
	
}
