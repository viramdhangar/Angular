/**
 * 
 */
package com.waio.domain;

import java.util.Date;

/**
 * @author viramdhangar
 *
 */
public class TrainingFee {

	private String id;
	private String trainingType;
	private String profileId;
	private int totalFees;
	private int totalRemainingFees;
	private int paidFees;
	private int totalPaidFees;
	private Date paidOn;
	private String fees;
	private String firstName;
	private String lastName;
	
	
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
	 * @return the fees
	 */
	public String getFees() {
		return fees;
	}
	/**
	 * @param fees the fees to set
	 */
	public void setFees(String fees) {
		this.fees = fees;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTrainingType() {
		return trainingType;
	}
	public void setTrainingType(String trainingType) {
		this.trainingType = trainingType;
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
}
