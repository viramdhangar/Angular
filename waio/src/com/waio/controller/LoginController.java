package com.waio.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.waio.dto.CourseDTO;
import com.waio.dto.LoginDTO;
import com.waio.dto.MenuDTO;
import com.waio.dto.RolePermissionDTO;
import com.waio.service.ICourseService;
import com.waio.service.ILoginService;
import com.waio.utility.GenUtils;

@Controller
public class LoginController {

	@Autowired
	ILoginService loginService;
	
	@Autowired
	ICourseService courseService;
	
	/*@RequestMapping(value = "/getCredential", method = RequestMethod.GET)
	public @ResponseBody String getAuthenticate() throws Exception {
		
		List<MenuDTO> menuList = new ArrayList<MenuDTO>();
		System.out.println("in");
		LoginDTO dto = new LoginDTO();
		dto.setId(1);
		dto.setProfile_id("1");
		dto.setPassword("123");
		boolean isAuthenticated = loginService.getAuthentication(dto);
		if(isAuthenticated){
			menuList = loginService.getMenu(dto.getProfile_id());
			String authJson = GenUtils.getJsonFromJava(menuList);
			System.out.println("courseJson "+ authJson);
			return authJson;
		}else{
			String authJson = GenUtils.getJsonFromJava(isAuthenticated);
			System.out.println("courseJson "+ authJson);
			return authJson;
		}
	}*/
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public @ResponseBody ModelAndView login() throws Exception {
		
		return new ModelAndView("login");
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public @ResponseBody ModelAndView first() throws Exception {
		
		return new ModelAndView("index");
	}
	
	@RequestMapping(value = "/getCredential", method = RequestMethod.POST)
	public @ResponseBody ModelAndView getAuthenticate(HttpServletRequest request) throws Exception {
		
		ModelAndView model = new ModelAndView("index");
		HttpSession session = request.getSession();
		
		List<MenuDTO> menuList = new ArrayList<MenuDTO>();
		System.out.println("in");
		LoginDTO dto = new LoginDTO();
		dto.setProfile_id(request.getParameter("profile_id"));
		dto.setPassword(request.getParameter("password"));

		boolean isAuthenticated = loginService.getAuthentication(dto);

		List<RolePermissionDTO> permissionDTOList = new ArrayList<RolePermissionDTO>();
		permissionDTOList = loginService.getAccess(dto.getProfile_id());
		
		if(isAuthenticated){
			session.setAttribute("userName", dto.getfName()+" "+dto.getlName());
			session.setAttribute("userPass", dto.getPassword());
			session.setAttribute("login", dto);
			session.setAttribute("roles", permissionDTOList);
			if(dto.getRoleId().equalsIgnoreCase("ROLE_MANAGER")){
				session.setAttribute("ROLE_MANAGER", "ROLE_MANAGER");
			}
		//	menuList = loginService.getMenu(dto.getProfile_id());  // if menu are dynamic then enable
			//String authJson = GenUtils.getJsonFromJava(menuList);
			//System.out.println("courseJson "+ authJson);
			//model.addObject("menuList", menuList);
			model.addObject("roles", permissionDTOList);
			return model;
		}else{
			//String authJson = GenUtils.getJsonFromJava(isAuthenticated);
			//System.out.println("courseJson "+ authJson);
			return new ModelAndView("login","loginstatus", "Login id or Password is incorrect");
		}
	}
	@RequestMapping(value = "/{id}/getMenues", method = RequestMethod.GET)
	public @ResponseBody String getMenues(@PathVariable(value="id") String id ) throws Exception {
		
		System.out.println("in");
		List<MenuDTO> isAuthenticated = loginService.getMenu(id);
		
		String authJson = GenUtils.getJsonFromJava(isAuthenticated);
		System.out.println("courseJson "+ authJson);
		return authJson;
		
	}
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public @ResponseBody ModelAndView showHome() throws Exception {
		List<CourseDTO> courseList = new ArrayList<CourseDTO>();
		courseList = courseService.getCourseList();
		return new ModelAndView("index","courseList",courseList);
	}
	@RequestMapping(value = "/aboutus", method = RequestMethod.GET)
	public @ResponseBody ModelAndView showabout() throws Exception {
		
		return new ModelAndView("aboutus");
	}
	@RequestMapping(value = "/gallery", method = RequestMethod.GET)
	public @ResponseBody ModelAndView showgallery() throws Exception {
		
		return new ModelAndView("gallery");
	}
	@RequestMapping(value = "/price", method = RequestMethod.GET)
	public @ResponseBody ModelAndView showfeaturesPricetables() throws Exception {
		
		return new ModelAndView("features-pricetables");
	}
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public @ResponseBody ModelAndView contact() throws Exception {
		
		return new ModelAndView("contact");
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public @ResponseBody ModelAndView logout(HttpSession session) throws Exception {
		session.invalidate();
		return new ModelAndView("index", "logoutMsg", "You have successfully logged out");
	}
}
