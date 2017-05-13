package com.stums.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.stums.mapper.*;
import com.stums.po.User;
import com.stums.service.LoginService;

@Component
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginMapper loginMapper;
	
	public boolean checkUser(User user) {
		if(loginMapper.getUserId(user)!=null)
		{
			return true;
		}
		return false;
	}
	
}
