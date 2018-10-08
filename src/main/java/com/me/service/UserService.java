package com.me.service;

import java.io.Serializable;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.daoimpl.UserDaoImpl;
import com.me.domain.User;

@Transactional
@Service
public class UserService {
	@Autowired
	private UserDaoImpl uDaoImpl;
	
	@Transactional
	public boolean addUser(User user) {
		User u=uDaoImpl.get(user.getUserId());
		if (u==null) {
			uDaoImpl.save(user);
			return true;
		}else {
			return false;
		}
	}
	@Transactional
	public void removeUser(User user) {
		uDaoImpl.remove(user);
	}
	@Transactional
	public void updateUser(User user) {
		uDaoImpl.update(user);
	}
	@Transactional
	public List<User> findPage(int begin,int max) {
		List<User> uList=uDaoImpl.findPage(begin, max);
		return uList;
	}
	@Transactional
	public List<User> findByExample(User u){
		List<User> list=uDaoImpl.findByExample(u);
		return list;
	}
	
	@Transactional
	public User returnUser(Serializable id) {
		if(id!=null) {
			return uDaoImpl.get(id);
		}else {
			return null;
		}
	}
	@Transactional
	public int count() {
		return uDaoImpl.findCount();
	}
	
}
