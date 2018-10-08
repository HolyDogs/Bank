package com.me.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.daoimpl.CardRecordDaoImpl;
import com.me.domain.CardRecord;

@Service
public class RecordService {
	
	@Autowired
	private CardRecordDaoImpl cardRecordDaoImpl;
	
	@Transactional
	public void addRecord(CardRecord cardRecord) {
		cardRecordDaoImpl.save(cardRecord);
	}
	@Transactional
	public void removeRecord(CardRecord cardRecord) {
		cardRecordDaoImpl.remove(cardRecord);
	}
	@Transactional
	public List<CardRecord> findPage(int currentPage,int begin,int max) {
		List<CardRecord> uList=cardRecordDaoImpl.findPage(begin, max);
		return uList;
	}
	@Transactional
	public List<CardRecord> findByExample(CardRecord c) {
		List<CardRecord> list=cardRecordDaoImpl.findByExample(c);
		return list;
	}
	@Transactional
	public int count() {
		return cardRecordDaoImpl.findCount();
	}
}
