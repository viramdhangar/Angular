package com.waio.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import com.waio.dao.ICourseDao;
import com.waio.dto.CourseDTO;
import com.waio.dto.SyllabusDTO;

@Component("courseDao")
public class CourseDaoImpl implements ICourseDao{

	@Autowired
	DataSource dataSource;
	
	@Override
	public List<CourseDTO> getCourseList()throws Exception{
		
		List<CourseDTO> courseList = new ArrayList<CourseDTO>();
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select * from course";
		courseList = jdbcTemplate.query(sql, new Object[] {}, new BeanPropertyRowMapper<CourseDTO>(CourseDTO.class));
		System.out.println(courseList.size());
		return courseList;
	}
	@Override
	public List<CourseDTO> getCorporateCourseList()throws Exception{
		
		List<CourseDTO> courseList = new ArrayList<CourseDTO>();
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select * from fees";
		courseList = jdbcTemplate.query(sql, new Object[] {}, new BeanPropertyRowMapper<CourseDTO>(CourseDTO.class));
		System.out.println(courseList.size());
		return courseList;
	}
	@Override
	public List<CourseDTO> getCourse(String courseId)throws Exception{
		
		List<CourseDTO> courseList = new ArrayList<CourseDTO>();
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select * from course where id in (replacedIds)";
		sql = sql.replaceAll("replacedIds", courseId);
		courseList = jdbcTemplate.query(sql, new Object[] {}, new BeanPropertyRowMapper<CourseDTO>(CourseDTO.class));
		System.out.println(courseList.size());
		return courseList;
	}
	@Override
	public List<SyllabusDTO> getSyllabus(){
		
		List<SyllabusDTO> syllabusList = new ArrayList<SyllabusDTO>();
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select id,course,required_month requiredMonth,plan,content from syllabus";
		syllabusList = jdbcTemplate.query(sql, new Object[] {}, new BeanPropertyRowMapper<SyllabusDTO>(SyllabusDTO.class));
		System.out.println(syllabusList.size());
		return syllabusList;
	}
	@Override
	public List<CourseDTO> searchCourses(String searchText)throws Exception{
		
		List<CourseDTO> courseList = new ArrayList<CourseDTO>();
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select * from course where course like ?";
		courseList = jdbcTemplate.query(sql, new Object[] {"%"+searchText+"%"}, new BeanPropertyRowMapper<CourseDTO>(CourseDTO.class));
		System.out.println(courseList.size());
		return courseList;
	}
}
