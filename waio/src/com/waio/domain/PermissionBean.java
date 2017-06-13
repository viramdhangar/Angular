package com.waio.domain;

public class PermissionBean {

	private String profileId;
	private String role;
	private String permission;
	private String permissionName;
	private String subPermission;
	private String subPermissionName;
	private String action;
	private String subAction;
	
	/**
	 * @return the action
	 */
	public String getAction() {
		return action;
	}
	/**
	 * @param action the action to set
	 */
	public void setAction(String action) {
		this.action = action;
	}
	/**
	 * @return the subAction
	 */
	public String getSubAction() {
		return subAction;
	}
	/**
	 * @param subAction the subAction to set
	 */
	public void setSubAction(String subAction) {
		this.subAction = subAction;
	}
	public String getPermissionName() {
		return permissionName;
	}
	public void setPermissionName(String permissionName) {
		this.permissionName = permissionName;
	}
	public String getSubPermissionName() {
		return subPermissionName;
	}
	public void setSubPermissionName(String subPermissionName) {
		this.subPermissionName = subPermissionName;
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
	 * @return the subPermission
	 */
	public String getSubPermission() {
		return subPermission;
	}
	/**
	 * @param subPermission the subPermission to set
	 */
	public void setSubPermission(String subPermission) {
		this.subPermission = subPermission;
	}
}
