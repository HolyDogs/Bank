package com.me.dao;

import java.io.Serializable;

import com.me.domain.BankCard;

public interface BankCardDao extends BaseDao<BankCard> {
	public void addDeposit(Serializable cardId,int money);
	
	public void decDeposit(Serializable cardId,int money);
}
