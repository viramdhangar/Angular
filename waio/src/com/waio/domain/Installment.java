/**
 * 
 */
package com.waio.domain;

import java.util.Date;

/**
 * @author viramdhangar
 *
 */
public class Installment {

	private String installmentName;
	private int paidFees;
	private Date paidOn;
	
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
	 * @return the installmentName
	 */
	public String getInstallmentName() {
		return installmentName;
	}

	/**
	 * @param installmentName the installmentName to set
	 */
	public void setInstallmentName(String installmentName) {
		this.installmentName = installmentName;
	}
	
}
