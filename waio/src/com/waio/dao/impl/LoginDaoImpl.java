package com.waio.dao.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import com.waio.dao.ILoginDao;
import com.waio.dao.IProfileDao;
import com.waio.domain.MenuBean;
import com.waio.domain.PermissionBean;
import com.waio.dto.LoginDTO;
import com.waio.dto.MenuDTO;
import com.waio.dto.ProfileDTO;

@Component("loginDao")
public class LoginDaoImpl implements ILoginDao{

	@Autowired
	DataSource dataSource;
	
	@Autowired
	IProfileDao profileDao;

	@Override
	public boolean getAuthentication(LoginDTO dto)throws Exception{
		try{
			boolean isAuth = false;
			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			String sql = "select count(*) from credential where password=? and (profile_id = ? OR email = ?)";
			Integer count = jdbcTemplate.queryForInt(sql, dto.getPassword(), dto.getProfile_id(),dto.getProfile_id());
			System.out.println(count);
			if(count == 1){
				isAuth = true;
			}
			List<ProfileDTO> profileDTO = profileDao.getProfileDetail(dto.getProfile_id());
			dto.setfName(profileDTO.get(0).getFirstName());
			dto.setlName(profileDTO.get(0).getLastName());
			dto.setProfile_id(profileDTO.get(0).getId());
			dto.setRoleId(getLoggedInRole(dto.getProfile_id()).get(0).getRoleId());
			return isAuth;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	public List<LoginDTO> getLoggedInRole(String id){
		List<LoginDTO> roles = null;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select role_id from rel_profile_role where profile_id=?";
		roles = jdbcTemplate.query(sql, new Object[] {id}, new BeanPropertyRowMapper<LoginDTO>(LoginDTO.class));
		return roles;
	}
	
	@Override
	public List<MenuDTO> getMenu(String id) throws Exception {
		// TODO Auto-generated method stub
		List<MenuDTO> menuList = new ArrayList<MenuDTO>();
		List<MenuBean> menuBeanList = new ArrayList<MenuBean>();
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select name,menu_id,sub_menu from permission p,rel_profile_role rel,profile ,menu where profile.id = ? and profile.id = rel.profile_id and rel.role_id = p.role_id and p.menu_id = menu.menu";
		menuBeanList = jdbcTemplate.query(sql, new Object[] {id}, new BeanPropertyRowMapper<MenuBean>(MenuBean.class));
		Set<String> set = new HashSet<String>();
		for(MenuBean menuBean : menuBeanList){
			set.add(menuBean.getMenu_id());
		}
		for(String str : set){
			List<String> subMenuList = new ArrayList<String>();
			MenuDTO menuDTO = new MenuDTO();
			menuDTO.setMenu_id(str);
			for(MenuBean menuBean : menuBeanList){
				if(str.equalsIgnoreCase(menuBean.getMenu_id())){
					subMenuList.add(menuBean.getSub_menu());
					menuDTO.setName(menuBean.getName());
				}
			}
			menuDTO.setSub_menu(subMenuList);
			menuList.add(menuDTO);
		}
		return menuList;
	}
	public List<PermissionBean> getAccess(String id){
		List<PermissionBean> permissionList = new ArrayList<PermissionBean>();
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select role_table.id profileId, role_table.role role, role_table.permissionName, role_table.permission permission, role_table.action , sp.sub_permission subPermission, sp.name subPermissionName, sp.action subAction from (select prp.profile_id id, prp.role role, rp.permission permission,rp.name permissionName,rp.action from profile_role_permission prp, role_permission rp where prp.profile_id=? AND prp.role=rp.role)role_table LEFT OUTER JOIN sub_permission sp ON role_table.permission=sp.permission";
		permissionList = jdbcTemplate.query(sql, new Object[] {id}, new BeanPropertyRowMapper<PermissionBean>(PermissionBean.class));
		return permissionList;
	}
}
