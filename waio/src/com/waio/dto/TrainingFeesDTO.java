/**
 * 
 */
package com.waio.dto;

import java.util.Date;
import java.util.List;

import com.waio.domain.Installment;

/**
 * @author viramdhangar
 *
 */
public class TrainingFeesDTO {

	private String id;
	private List<Installment> intallments;
	private String profileId;
	private int paidFees;
	private int totalFees;
	private int remainingFees;
	private Date paidOn;
	private int totalRemainingFees;
	private int totalPaidFees;
	private String firstName;
	private String lastName;
	private CourseDTO course;
	
	/**
	 * @return the course
	 */
	public CourseDTO getCourse() {
		return course;
	}
	/**
	 * @param course the course to set
	 */
	public void setCourse(CourseDTO course) {
		this.course = course;
	}
	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}
	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}
	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	/**
	 * @return the totalRemainingFees
	 */
	public int getTotalRemainingFees() {
		return totalRemainingFees;
	}
	/**
	 * @param totalRemainingFees the totalRemainingFees to set
	 */
	public void setTotalRemainingFees(int totalRemainingFees) {
		this.totalRemainingFees = totalRemainingFees;
	}
	/**
	 * @return the totalPaidFees
	 */
	public int getTotalPaidFees() {
		return totalPaidFees;
	}
	/**
	 * @param totalPaidFees the totalPaidFees to set
	 */
	public void setTotalPaidFees(int totalPaidFees) {
		this.totalPaidFees = totalPaidFees;
	}
	/**
	 * @return the profileId
	 */
	public String getProfileId() {
		return profileId;
	}
	/**
	 * @param profileId the profileId to set
	 */
	public void setProfileId(String profileId) {
		this.profileId = profileId;
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
	 * @return the intallments
	 */
	public List<Installment> getIntallments() {
		return intallments;
	}
	/**
	 * @param intallments the intallments to set
	 */
	public void setIntallments(List<Installment> intallments) {
		this.intallments = intallments;
	}
	/**
	 * @return the paidFees
	 */
	public int getPaidFees() {
		return paidFees;
	}
	/**
	 * @param paidFees the paidFees to set
	 */
	public void setPaidFees(int paidFees) {
		this.paidFees = paidFees;
	}
	/**
	 * @return the totalFees
	 */
	public int getTotalFees() {
		return totalFees;
	}
	/**
	 * @param totalFees the totalFees to set
	 */
	public void setTotalFees(int totalFees) {
		this.totalFees = totalFees;
	}
	/**
	 * @return the remainingFees
	 */
	public int getRemainingFees() {
		return remainingFees;
	}
	/**
	 * @param remainingFees the remainingFees to set
	 */
	public void setRemainingFees(int remainingFees) {
		this.remainingFees = remainingFees;
	}
	/**
	 * @return the paidOn
	 */
	public Date getPaidOn() {
		return paidOn;
	}
	/**
	 * @param paidOn the paidOn to set
	 */
	public void setPaidOn(Date paidOn) {
		this.paidOn = paidOn;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result + ((lastName == null) ? 0 : lastName.hashCode());
		result = prime * result + ((profileId == null) ? 0 : profileId.hashCode());
		return result;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TrainingFeesDTO other = (TrainingFeesDTO) obj;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		if (profileId == null) {
			if (other.profileId != null)
				return false;
		} else if (!profileId.equals(other.profileId))
			return false;
		return true;
	}
}
