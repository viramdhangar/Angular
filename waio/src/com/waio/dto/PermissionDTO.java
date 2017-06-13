package com.waio.dto;

import java.util.List;

public class PermissionDTO {

	private String permission;
	private List<SubPermissionDTO> subPermission;
	private String permissionName;
	
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
	/**
	 * @return the subPermission
	 */
	public List<SubPermissionDTO> getSubPermission() {
		return subPermission;
	}
	/**
	 * @param subPermission the subPermission to set
	 */
	public void setSubPermission(List<SubPermissionDTO> subPermission) {
		this.subPermission = subPermission;
	}
}
