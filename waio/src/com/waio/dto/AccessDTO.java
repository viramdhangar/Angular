package com.waio.dto;

import java.util.List;

public class AccessDTO {

	private String profileId;
	private String role;
	private String permission;
	private List<AccessDTO> subAccess;
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
	 * @return the role
	 */
	public String getRole() {
		return role;
	}
	/**
	 * @param role the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}
	/**
	 * @return the permission
	 */
	public String getPermission() {
		return permission;
	}
	/**
	 * @param permission the permission to set
	 */
	public void setPermission(String permission) {
		this.permission = permission;
	}
	/**
	 * @return the subAccess
	 */
	public List<AccessDTO> getSubAccess() {
		return subAccess;
	}
	/**
	 * @param subAccess the subAccess to set
	 */
	public void setSubAccess(List<AccessDTO> subAccess) {
		this.subAccess = subAccess;
	}
}
