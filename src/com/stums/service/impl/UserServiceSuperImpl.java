package com.stums.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.stums.mapper.UserMapper;
import com.stums.po.User;
import com.stums.service.UserService;

@Component
public class UserServiceSuperImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	public List<User> findUserListByType(int type) {
		return userMapper.findUserListByType(type);
	}

	public void deleteUser(Integer userId) {
		 userMapper.deleteUser(userId);
	}

	public void editUser(User user) {
		userMapper.editUser(user);
	}


	public void addUser(User user) {
		userMapper.addUser(user);
	}

	public User findUserById(Integer userId) {
		return userMapper.findUserById(userId);
	}

	

}
