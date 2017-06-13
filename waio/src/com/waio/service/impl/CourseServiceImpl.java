package com.waio.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.waio.dao.ICourseDao;
import com.waio.dto.CourseDTO;
import com.waio.dto.SyllabusDTO;
import com.waio.service.ICourseService;

@Service("courseService")
public class CourseServiceImpl implements ICourseService{

	@Autowired
	ICourseDao courseDao;
	
	@Override
	public List<CourseDTO> getCourseList() throws Exception {
		// TODO Auto-generated method stub
		return courseDao.getCourseList();
	}

	@Override
	public List<CourseDTO> getCourse(String courseId) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.getCourse(courseId);
	}

	@Override
	public List<SyllabusDTO> getSyllabus() {
		// TODO Auto-generated method stub
		return courseDao.getSyllabus();
	}

	@Override
	public List<CourseDTO> searchCourses(String searchText) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.searchCourses(searchText);
	}

	@Override
	public List<CourseDTO> getCorporateCourseList() throws Exception {
		// TODO Auto-generated method stub
		return courseDao.getCorporateCourseList();
	}

}
