package com.waio.domain;

public class MenuBean {

	private String menu_id;
	private String sub_menu;
	private String name;
	
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
	public String getSub_menu() {
		return sub_menu;
	}
	/**
	 * @param sub_menu the sub_menu to set
	 */
	public void setSub_menu(String sub_menu) {
		this.sub_menu = sub_menu;
	}
}
