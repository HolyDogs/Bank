package com.me.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.me.domain.BankCard;
import com.me.domain.CardRecord;
import com.me.domain.User;
import com.me.service.CardService;
import com.me.service.UserService;
import com.opensymphony.xwork2.ActionSupport;


@Controller(value="userAction")
@Scope(value="prototype")
public class UserAction extends ActionSupport {

	private List<Integer> cardList=new ArrayList<Integer>();
	public List<Integer> getCardList() {
		return cardList;
	}


	public String userPre() {
		cardList.clear();
		HttpServletRequest request=ServletActionContext.getRequest();
		User user=(User) request.getSession().getAttribute("nowuser");
		for (BankCard b : user.getSetBank()) {
			cardList.add(b.getCardId());
		}
		return SUCCESS;
	}
	
	Set<CardRecord> cRecords=new HashSet<CardRecord>();
	
	public Set<CardRecord> getcRecords() {
		return cRecords;
	}


	public String cardManage() {
		HttpServletRequest request=ServletActionContext.getRequest();
		String ss=request.getParameter("cardid");
		System.out.println(ss);
		Integer cardid=Integer.parseInt(ss);
		BankCard bankC=cardService.returnCard(cardid);
		for(CardRecord cRecord:bankC.getSetRecord()) {
			cRecords.add(cRecord);
		}
		request.getSession().setAttribute("nowcard", cardid);
		return "cardmanage";
	}
	
	@Autowired
	private CardService cardService;
	@Autowired
	private UserService userService;
	
	private String newcard;
	public String addcard() {
		HttpServletRequest request=ServletActionContext.getRequest();
		Integer cardId=Integer.parseInt(newcard);
		User userz=(User) request.getSession().getAttribute("nowuser");
		BankCard b=new BankCard();
		b.setCardId(cardId);
		b.setDeposit(0);
		b.setUser(userz);
		Set<BankCard> bankCards=userz.getSetBank();
		bankCards.add(b);
		userz.setSetBank(bankCards);
		userService.updateUser(userz);
		if(cardService.addCard(b)) {
			return "addcard";
		}
		else {
			return "tofailedpage";
		}
	}


	public String getNewcard() {
		return newcard;
	}


	public void setNewcard(String newcard) {
		this.newcard = newcard;
	}
}
