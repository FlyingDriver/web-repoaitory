package com.zhiyou100.ssm.model;

import java.util.Arrays;
import java.util.List;

public class UserVO {

	private User user;
	private int count;
	private String name;
	private String[] hobbys;
	private List<User> list;
	private String userKeyWord;
	private String userSearchField;
	private Integer currentPage;

	public String getUserKeyWord() {
		return userKeyWord;
	}

	public void setUserKeyWord(String userKeyWord) {
		this.userKeyWord = userKeyWord;
	}

	public String getUserSearchField() {
		return userSearchField;
	}

	public void setUserSearchField(String userSearchField) {
		this.userSearchField = userSearchField;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String[] getHobbys() {
		return hobbys;
	}

	public void setHobbys(String[] hobbys) {
		this.hobbys = hobbys;
	}

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "UserVO [user=" + user + ", count=" + count + ", name=" + name + ", hobbys=" + Arrays.toString(hobbys)
				+ ", list=" + list + ", userKeyWord=" + userKeyWord + ", userSearchField=" + userSearchField
				+ ", currentPage=" + currentPage + "]";
	}

}
