package com.stums.service.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.stums.mapper.UserMapper;
import com.stums.po.User;
import com.stums.service.UserService;

@Component
public class UserServiceImpl implements UserService{

	private UserMapper userMapper;
	
	public List<User> findCoMaList() {
		return userMapper.findCoMaList();
	}

}
