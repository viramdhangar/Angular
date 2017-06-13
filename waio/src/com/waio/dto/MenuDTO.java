package com.waio.dto;

import java.util.List;

public class MenuDTO {

	private String menu_id;
	private String name;
	private List<String> sub_menu;
	private String href;
	
	/**
	 * @return the href
	 */
	public String getHref() {
		return href;
	}
	/**
	 * @param href the href to set
	 */
	public void setHref(String href) {
		this.href = href;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the menu_id
	 */
	public String getMenu_id() {
		return menu_id;
	}
	/**
	 * @param menu_id the menu_id to set
	 */
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	/**
	 * @return the sub_menu
	 */
	public List<String> getSub_menu() {
		return sub_menu;
	}
	/**
	 * @param sub_menu the sub_menu to set
	 */
	public void setSub_menu(List<String> sub_menu) {
		this.sub_menu = sub_menu;
	}

	
}
