package com.waio.dto;

import java.util.List;

public class SyllabusDTO {

	private String id;
	private String course;
	private String requiredMonth;
	private String content;
	private String plan;
	private String[] contentList;
	
	
	/**
	 * @return the contentList
	 */
	public String[] getContentList() {
		return contentList;
	}
	/**
	 * @param contentList the contentList to set
	 */
	public void setContentList(String[] contentList) {
		this.contentList = contentList;
	}
	/**
	 * @return the plan
	 */
	public String getPlan() {
		return plan;
	}
	/**
	 * @param plan the plan to set
	 */
	public void setPlan(String plan) {
		this.plan = plan;
	}
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the course
	 */
	public String getCourse() {
		return course;
	}
	/**
	 * @param course the course to set
	 */
	public void setCourse(String course) {
		this.course = course;
	}
	/**
	 * @return the requiredMonth
	 */
	public String getRequiredMonth() {
		return requiredMonth;
	}
	/**
	 * @param requiredMonth the requiredMonth to set
	 */
	public void setRequiredMonth(String requiredMonth) {
		this.requiredMonth = requiredMonth;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
}
