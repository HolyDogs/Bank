package com.me.daoimpl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.me.dao.BankCardDao;
import com.me.domain.BankCard;

@Repository
public class BankCardDaoImpl extends BaseDaoImpl<BankCard> implements BankCardDao {

	public BankCardDaoImpl() {
		super(BankCard.class);
	}

	@Override
	public void addDeposit(Serializable cardId, int money) {
		BankCard bankCard=load(cardId);
		bankCard.setDeposit(bankCard.getDeposit()+money);
		update(bankCard);
	}

	@Override
	public void decDeposit(Serializable cardId, int money) {
		BankCard bankCard=load(cardId);
		bankCard.setDeposit(bankCard.getDeposit()-money);
		update(bankCard);
	}
	
	public int findMoney(Serializable id) {
		BankCard bankCard=load(id);
		return bankCard.getDeposit();
	}

}
