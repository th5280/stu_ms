package com.stums.mapper;

import java.util.List;

import com.stums.po.User;

public interface UserMapper {

	public List<User> findUserListByType(int type);

	public void deleteUser(Integer userId);

	public void editUser(User user);

	public void addUser(User user);

	public User findUserById(Integer userId);
	
	
}
