package com.waio.service;

import java.util.List;

import com.waio.dto.CourseDTO;
import com.waio.dto.SyllabusDTO;

public interface ICourseService {

	public List<CourseDTO> getCourseList()throws Exception;
	public List<CourseDTO> getCorporateCourseList()throws Exception;
	public List<CourseDTO> getCourse(String courseId)throws Exception;
	public List<SyllabusDTO> getSyllabus();
	public List<CourseDTO> searchCourses(String searchText)throws Exception;
}
