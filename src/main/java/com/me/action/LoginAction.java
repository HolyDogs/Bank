package com.me.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.me.domain.User;
import com.me.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller(value="loginAction")
@Scope(value="prototype")
public class LoginAction extends ActionSupport implements ModelDriven<User>{

	User user=new User();
	
	@Autowired
	private UserService userService;
	
	public String check() {
		User user1=userService.returnUser(user.getUserId());
		HttpServletRequest request=ServletActionContext.getRequest();
		if(user1!=null) {
			if(user1.getUserId()>10000&&user1.getPassword().equals(user.getPassword())) {
				request.getSession().setAttribute("nowuser", user1);
				return LOGIN;	
			}else if(user1.getUserId()<10000&&user1.getPassword().equals(user.getPassword())){
				request.getSession().setAttribute("nowuser", user1);
				return "admin";
			}
			return ERROR;
		}else {
			return ERROR;
		}
	}
	
	public String logout() {
		ServletActionContext.getRequest().getSession().invalidate();
		return "logout";
	}
	
	public String register() {
		return "register";
	}

	@Override
	public User getModel() {
		return user;
	}
}
