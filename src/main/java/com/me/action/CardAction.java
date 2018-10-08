package com.me.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.me.domain.BankCard;
import com.me.domain.CardRecord;
import com.me.service.CardService;
import com.me.service.RecordService;
import com.opensymphony.xwork2.ActionSupport;


@Controller(value="cardAction")
@Scope(value="prototype")
public class CardAction extends ActionSupport {
	
	private String cunMoney;
	private String quMoney;
	private String toCardId;
	private String tranMoney;
	
	public String getCunMoney() {
		return cunMoney;
	}

	public void setCunMoney(String cunMoney) {
		this.cunMoney = cunMoney;
	}

	public String getQuMoney() {
		return quMoney;
	}

	public void setQuMoney(String quMoney) {
		this.quMoney = quMoney;
	}

	@Autowired
	private CardService cardService;
	@Autowired
	private RecordService recordService;
	
	public String cunMoney() {
		HttpServletRequest request=ServletActionContext.getRequest();
		Integer cardId=(Integer) request.getSession().getAttribute("nowcard");
		
		BankCard bankCard=cardService.returnCard(cardId);
		bankCard.setDeposit(bankCard.getDeposit()+Integer.parseInt(cunMoney));
		CardRecord cardRecord=new CardRecord();
		cardRecord.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		cardRecord.setRecord("--卡"+cardId+"存入"+cunMoney+"元"+"--");
		cardRecord.setBankCard(bankCard);
		Set<CardRecord> cRecords=bankCard.getSetRecord();
		cRecords.add(cardRecord);
		bankCard.setSetRecord(cRecords);
		recordService.addRecord(cardRecord);
		cardService.updateCard(bankCard);
		return "success";
	}
	
	public String quMoney() {
		HttpServletRequest request=ServletActionContext.getRequest();
		Integer cardId=(Integer) request.getSession().getAttribute("nowcard");
		BankCard bankCard=cardService.returnCard(cardId);
		if(bankCard.getDeposit()<Integer.parseInt(quMoney)) 
		{return "tofailedpage";}
		bankCard.setDeposit(bankCard.getDeposit()-Integer.parseInt(quMoney));
		CardRecord cardRecord=new CardRecord();
		cardRecord.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		cardRecord.setRecord("--卡"+cardId+"取出"+cunMoney+"元"+"--");
		cardRecord.setBankCard(bankCard);
		Set<CardRecord> cRecords=bankCard.getSetRecord();
		cRecords.add(cardRecord);
		bankCard.setSetRecord(cRecords);
		recordService.addRecord(cardRecord);
		cardService.updateCard(bankCard);
		return "success";
	}
	
	public String tran() {
		HttpServletRequest request=ServletActionContext.getRequest();
		BankCard toBankCard=cardService.returnCard(toCardId);
		if(toBankCard==null) {
			return "tofailedpage";
		}
		Integer cardId=(Integer) request.getSession().getAttribute("nowcard");
		BankCard bankCard=cardService.returnCard(cardId);
		
		if(bankCard.getDeposit()<Integer.parseInt(tranMoney)) 
		{return "tofailedpage";}
		bankCard.setDeposit(bankCard.getDeposit()-Integer.parseInt(tranMoney));
		toBankCard.setDeposit(toBankCard.getDeposit()+Integer.parseInt(tranMoney));
		
		CardRecord cardRecord=new CardRecord();
		cardRecord.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		cardRecord.setRecord("--转给卡"+toCardId+"-"+tranMoney+"元--");
		cardRecord.setBankCard(bankCard);
		Set<CardRecord> cRecords=bankCard.getSetRecord();
		cRecords.add(cardRecord);
		bankCard.setSetRecord(cRecords);
		recordService.addRecord(cardRecord);
		cardService.updateCard(bankCard);
		
		CardRecord cardRecord2=new CardRecord();
		cardRecord2.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		cardRecord2.setRecord("--收到卡"+cardId+"-"+tranMoney+"元--");
		cardRecord2.setBankCard(toBankCard);
		Set<CardRecord> tRecords=toBankCard.getSetRecord();
		tRecords.add(cardRecord2);
		toBankCard.setSetRecord(tRecords);
		recordService.addRecord(cardRecord2);
		cardService.updateCard(toBankCard);
		return "success";
	}

	public String getToCardId() {
		return toCardId;
	}

	public void setToCardId(String toCardId) {
		this.toCardId = toCardId;
	}

	public String getTranMoney() {
		return tranMoney;
	}

	public void setTranMoney(String tranMoney) {
		this.tranMoney = tranMoney;
	}
}
