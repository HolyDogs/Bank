package com.me.daoimpl;

import org.springframework.stereotype.Repository;

import com.me.dao.UserDao;
import com.me.domain.User;

@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {


	public UserDaoImpl() {
		super(User.class);
	}

}
