package com.zhiyou100.ssm.service;

import java.util.List;


import com.zhiyou100.ssm.model.User;
import com.zhiyou100.ssm.util.Page;

public interface UserService {

	List<User> getAllUser();

	User findUserById(Integer uId);

	void updateUser(User u);
	boolean login(String name,String password);
	User findUserByName(String name);
	
	Page findUserList(String userKeyWord,String userSearchField,Integer curentPage);
}
