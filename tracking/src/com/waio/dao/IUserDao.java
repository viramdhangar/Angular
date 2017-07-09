package com.waio.dao;

import java.util.List;

import com.waio.dto.UserDto;

public interface IUserDao {

	void saveUser(UserDto userDto);

	UserDto authentication(String emailId);

	List<UserDto> getAllusers();

	int editUser(UserDto user);

	List<UserDto> getUserByemailId(String emailId);

	int deleteUser(String string);

	List<UserDto> searchUserById(String searchParam);


}
