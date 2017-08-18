package com.zhiyou100.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.ssm.mapper.UserMapper;
import com.zhiyou100.ssm.model.User;
import com.zhiyou100.ssm.model.UserExample;
import com.zhiyou100.ssm.model.UserExample.Criteria;
import com.zhiyou100.ssm.model.UserVO;
import com.zhiyou100.ssm.service.UserService;
import com.zhiyou100.ssm.util.Page;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper um;
	
	
	public void setMp(UserMapper um) {
		this.um = um;
	}


	@Override
	public List<User> getAllUser() {
		return um.selectByExample(null);
	}


	@Override
	public User findUserById(Integer uId) {
		return um.selectByPrimaryKey(uId);
	}

	@Override
	public void updateUser(User u) {
	
	 um.updateByPrimaryKeySelective(u);
		
	}


	@Override
	public boolean login(String name, String password) {
		UserExample userExample= new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUNameEqualTo(name).andUPwdEqualTo(password);
		List<User> list = um.selectByExample(userExample);
		System.out.println(list);
		System.out.println(list.isEmpty());
		if(list.isEmpty()){
			return false;
		}else{
			return true;
		}
	}


	@Override
	public User findUserByName(String name) {
		User user=null;
		UserExample userExample= new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUNameEqualTo(name);
		List<User> list = um.selectByExample(userExample);
		if(list.isEmpty()){
			return user;
		}else{
			return list.get(0);
		}
	}


	@Override
	public Page findUserList(String userKeyWord, String userSearchField, Integer currentPage) {
		System.out.println(userKeyWord+"..........."+userSearchField+"............................."+currentPage);
		Page<User> page =new Page<>();
		UserVO vo=new UserVO();
		vo.setUserKeyWord(userKeyWord);
		vo.setUserSearchField(userSearchField);
		vo.setCurrentPage(5*(currentPage-1));
		/*List<User> list = um.getPage(userKeyWord,userSearchField,5*(currentPage-1));
		int totalCount = um.getTotalCount(userKeyWord,userSearchField);*/
		List<User> list = um.getPage(vo);
		int totalCount = um.getTotalCount(vo);
		System.out.println(list+".........."+totalCount);
		page.setPage(currentPage);
		page.setTotal(totalCount);
		page.setRows(list);
		page.setSize(5);
		System.out.println("1111111111111111111111111111111111"+page);
		return page;
	}


}
