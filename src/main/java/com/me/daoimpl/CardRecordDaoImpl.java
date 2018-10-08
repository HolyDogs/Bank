package com.me.daoimpl;

import org.springframework.stereotype.Repository;

import com.me.dao.CardRecordDao;
import com.me.domain.CardRecord;

@Repository
public class CardRecordDaoImpl extends BaseDaoImpl<CardRecord> implements CardRecordDao {

	
	public CardRecordDaoImpl() {
		super(CardRecord.class);
		// TODO Auto-generated constructor stub
	}

}
