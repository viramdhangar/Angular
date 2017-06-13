package com.waio.dto;

public class SubPermissionDTO {

	private String permissionName;
	private String permission;
	private String subAction;
	
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
	/**
	 * @return the permissionName
	 */
	public String getPermissionName() {
		return permissionName;
	}
	/**
	 * @param permissionName the permissionName to set
	 */
	public void setPermissionName(String permissionName) {
		this.permissionName = permissionName;
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
}
