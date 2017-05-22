package com.stums.service;
import java.util.List;

import com.stums.po.*;


public interface UserService {
	public List<User> findUserListByType(int type);

	public void deleteUser(Integer userId);

	public void editUser(User user);

	public User findUserById(Integer user_id);

	public void addUser(User user);
}
