package com.me.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.me.domain.BankCard;
import com.me.domain.CardRecord;
import com.me.domain.User;
import com.me.domain.UserForAjax;
import com.me.service.CardService;
import com.me.service.RecordService;
import com.me.service.UserService;
import com.me.utils.MakeNum;
import com.me.utils.SendEmailUtils;
import com.opensymphony.xwork2.ActionSupport;


@Controller(value="ajaxAction")
@Scope(value="prototype")
public class AjaxAction extends ActionSupport {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RecordService RecordService;
	
	@Autowired
	private CardService cardService;
	
	public String sendEmail() {
		HttpServletRequest request=ServletActionContext.getRequest();
		String theEmail=request.getParameter("theEmail");
		String charnum=MakeNum.makeNum();
		String body="您的验证码为:"+charnum+",5分钟内有效。";
		HttpSession session=request.getSession();
		session.setAttribute("charnum", charnum);
		session.setMaxInactiveInterval(5*60);
		SendEmailUtils.sendEmails(body, theEmail);
		return AjaxAction.NONE;
	}
	
	public String register() {
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		String charcode=request.getParameter("charnum");
		if(!charcode.equals(request.getSession().getAttribute("charnum"))) {
			try {
				response.getWriter().write("注册失败,验证码错误");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return AjaxAction.NONE;
		};
		User user=new User();
		user.setUserId(Integer.parseInt(request.getParameter("userId")));
		user.setEmail(request.getParameter("emaila"));
		user.setPassword(request.getParameter("password"));
		user.setUserName(request.getParameter("userName"));
		if(false==userService.addUser(user)) {
			
			try {
				response.getWriter().write("注册失败，修改ID或用户名重试");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return AjaxAction.NONE;
		}
		
		try {
			response.getWriter().write("注册成功");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return AjaxAction.NONE;
	}
	
	
	public String addUser() {
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		User user2=new User();
		user2.setUserId(Integer.parseInt(request.getParameter("userId")));
		user2.setEmail(request.getParameter("emaila"));
		user2.setPassword(request.getParameter("password"));
		user2.setUserName(request.getParameter("userName"));
		System.out.println(user2.getUserId());
		if(false==userService.addUser(user2)) {
			
			try {
				response.getWriter().write("添加失败，修改ID或用户名重试");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return AjaxAction.NONE;
		}
		
		try {
			response.getWriter().write("添加成功");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return NONE;
	}
	
	public String updateUser() {
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		//可加逻辑判断，实现并操作管理
		User user2=new User();
		user2.setUserId(Integer.parseInt(request.getParameter("userId")));
		user2.setEmail(request.getParameter("emaila"));
		user2.setPassword(request.getParameter("password"));
		user2.setUserName(request.getParameter("userName"));
		userService.updateUser(user2);
		return NONE;
	}
	
	
	
	private String page;
	
	HashMap<String, Object> aMap=new HashMap<String,Object>();

	public HashMap<String, Object> getaMap() {
		return aMap;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String findall() {
		int c=userService.count();
		int d;
		if(0==c%5) {
			d=c/5;
		}else {
			d=(c/5)+1;
		}
		aMap.clear();
		int p=Integer.parseInt(page);
		if(p<1||p>d) {
			return NONE;
		}else {
			int begin=(p-1)*5;
			List<User> pList=userService.findPage(begin, 5);
			List<UserForAjax> uList=new ArrayList<UserForAjax>();
			for (User user : pList) {
				StringBuffer sv=new StringBuffer("");
				for(BankCard bCard:user.getSetBank()) {
					sv.append(bCard.getCardId()+" ");
				}
				String str=sv.toString();
				UserForAjax userForAjax=new UserForAjax();
				userForAjax.setUserId(user.getUserId());
				userForAjax.setEmail(user.getEmail());
				userForAjax.setPassword(user.getPassword());
				userForAjax.setUserName(user.getUserName());
				userForAjax.setCards(str);
				uList.add(userForAjax);
			}
			aMap.put("user", uList);
			aMap.put("result", "success");
			return SUCCESS;
		}
	}
	
	public String findRecord() {
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		Integer cardId=Integer.parseInt(request.getParameter("cardId"));
		String date=request.getParameter("date");
		
		BankCard bankCard=cardService.returnCard(cardId);
		StringBuffer sBuffer=new StringBuffer("");
		for (CardRecord cardRecord : bankCard.getSetRecord()) {
			if(cardRecord.getDate().equals(date)) {
				sBuffer.append(cardRecord.getRecord()+"--");
			}
		}
		try {
			response.getWriter().write(sBuffer.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return NONE;
	}
}
