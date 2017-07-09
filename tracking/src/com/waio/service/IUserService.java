package com.waio.service;

import java.util.List;

import com.waio.dto.UserDto;

public interface IUserService {
	public void addUser(UserDto userDto);
	public boolean authentication(UserDto userUI);
	public List<UserDto> getAllusers();
	public List<UserDto> getUserByemailId(String emailId);
	public int editUser(UserDto user);
	public List<UserDto> searchUserById(String searchParam);
	public int deleteUser(String emailId);
}
