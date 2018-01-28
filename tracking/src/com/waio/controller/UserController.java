package com.waio.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.waio.dto.UserDto;
import com.waio.service.IUserService;

@Controller
public class UserController {
	//userController
	@Autowired
	IUserService userService;
	//@request
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView Registration() {
		return new ModelAndView("login");
	}
	@RequestMapping(value="/login" , method = RequestMethod.GET)
	 public ModelAndView login(@RequestParam("emailId") String emailId , @RequestParam("password") String password) {
	// comments		
		UserDto userUI = new UserDto();
		userUI.setEmailId(emailId);
		userUI.setPassword(password);
		
		boolean isAuthenticaticated = userService.authentication(userUI);
		
		if(isAuthenticaticated){
			ModelAndView model = new ModelAndView("home");
			return model;
		}else{
			ModelAndView model = new ModelAndView("login");
			return model;
		}

	}
	@RequestMapping(value="/saveUser" , method=RequestMethod.GET)
	public ModelAndView Registration1() {
	
		ModelAndView model = new ModelAndView("Registration");
		return model;
}
	
	@RequestMapping(value="/saveUser", method = RequestMethod.POST)
	public ModelAndView saveUser (@RequestParam("firstname") String firstname, @RequestParam("lastname") String lastname, @RequestParam("emailId") String emailId, @RequestParam("password") String password){
		
		UserDto userDTO = new UserDto();
		userDTO.setFirstname(firstname);
		userDTO.setLastname(lastname);
		userDTO.setEmailId(emailId);
		userDTO.setPassword(password);

		userService.addUser(userDTO);
		return new ModelAndView("Registration");
		
	}
	@RequestMapping(value="/getusers" , method=RequestMethod.GET)
	public ModelAndView getusers(){
		ModelAndView model = new ModelAndView("userList");
		List<UserDto> userList=userService.getAllusers();
		model.addObject("userList" , userList);
		return model;
	}
	@RequestMapping(value="/editUser" , method = RequestMethod.GET)
	public ModelAndView getEditUser(@RequestParam("emailId") String emailId) {
		
		ModelAndView model = new ModelAndView("edit");
		List<UserDto> userList = userService.getUserByemailId(emailId);
		UserDto user = userList.get(0);
		model.addObject("user", user);
		
		return model;
	}
	@RequestMapping(value="/editUser" , method = RequestMethod.POST)
	public ModelAndView editSaveUser(@RequestParam("emailId") String emailId,@RequestParam("firstname") String firstname,@RequestParam("lastname") String lastname,@RequestParam("password") String password) {
		
		ModelAndView model = new ModelAndView("userList");
		
		UserDto user = new UserDto();
		user.setEmailId(emailId);
		user.setFirstname(firstname);
		user.setLastname(lastname);
		user.setPassword(password);
		
		userService.editUser(user);
		
		List<UserDto> userList = userService.getAllusers();
		model.addObject("userList", userList);
		return model;
	}
	@RequestMapping(value="/deleteUser" , method = RequestMethod.GET)
	public ModelAndView deleteUser(@RequestParam("emailId") String emailId) {
		int deleteUser = userService.deleteUser(emailId);
		ModelAndView model = new ModelAndView("userList");
		List<UserDto> userList = userService.getAllusers();
		model.addObject("userList", userList);
		
		return model;
	}
	@RequestMapping(value="/search" , method=RequestMethod.GET)
	public ModelAndView getUserById(@RequestParam("searchParam") String searchParam) {
		
		ModelAndView model = new ModelAndView("userList");
		List<UserDto> userList = userService.searchUserById(searchParam);
		model.addObject("userList" , userList);
		return model;
	}
	
	}
	


