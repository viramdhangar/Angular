package com.waio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.waio.dao.IUserDao;
import com.waio.dto.UserDto;

@Service("userService")
public class UserService implements IUserService {
	
	@Autowired
	IUserDao userDao;

	@Override
	public void addUser(UserDto userDto) {
		userDao.saveUser(userDto);
	}

	@Override
	public boolean authentication(UserDto userUI) {
		
			UserDto userDB = userDao.authentication(userUI.getEmailId());

			if(userDB!=null){
				if (userUI.getPassword().equalsIgnoreCase(userDB.getPassword())){
					return true;
				} 
			}
			return false;
		}

	@Override
	public List<UserDto> getAllusers() {
		return userDao.getAllusers();
		}

	@Override
	public List<UserDto> getUserByemailId(String emailId) {
		return userDao.getUserByemailId(emailId);
		
	}

	@Override
	public int editUser(UserDto user) {
       return userDao.editUser(user);	
	}

	@Override
	public int deleteUser(String emailId) {
		return userDao.deleteUser(emailId);
	}

	@Override
	public List<UserDto> searchUserById(String searchParam) {
		return userDao.searchUserById(searchParam);	
	}
	
	}

	


