package com.waio.junit.test;

import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.waio.controller.ProfileController;
import com.waio.dao.impl.ProfileDaoImpl;
import com.waio.dto.ProfileDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"classpath:com/waio/junit/test/junit-config.xml"})
public class Junit_Test {

	@Autowired
	ProfileDaoImpl profileDao;
	
	@Autowired
	ProfileController pController;
	
	//@Autowired
	//MessageSourceAccessor messageAccessor;
	
	@Test
	public void test(){
		
		ProfileDTO profileDTO = profileDao.findUserByEmail("viram.dhangar@gmail.com");
		
		System.out.println("Welcome to junit" +profileDTO.getId());	
	}
	
	@Test
	public void testSum(){
		String str = "abc,def,ghi";
		
		String[] spl = str.split(",");
		for(String s : spl){
			System.out.println(s);
		}
				
		System.out.println(StringUtils.join(spl, ","));
		//System.out.println("message is :"+messageAccessor.getMessage("key"));
	}
	
}
