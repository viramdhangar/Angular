package com.waio.service.impl;


import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.waio.dao.ILoginDao;
import com.waio.domain.PermissionBean;
import com.waio.dto.AccessDTO;
import com.waio.dto.LoginDTO;
import com.waio.dto.MenuDTO;
import com.waio.dto.PermissionDTO;
import com.waio.dto.RolePermissionDTO;
import com.waio.dto.SubPermissionDTO;
import com.waio.service.ILoginService;

@Service("loginService")
public class LoginServiceImpl implements ILoginService{

	@Autowired
	ILoginDao loginDao;

	@Override
	public boolean getAuthentication(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return loginDao.getAuthentication(dto);
	}

	@Override
	public List<MenuDTO> getMenu(String id) throws Exception {
		// TODO Auto-generated method stub
		return loginDao.getMenu(id);
	}

	@Override
	public List<RolePermissionDTO> getAccess(String id) {
		List<RolePermissionDTO> rolePermissionList = new ArrayList<RolePermissionDTO>();
		List<PermissionBean> permissionBeanList = loginDao.getAccess(id);
		String role = "";
		String previousPermission = "";
		RolePermissionDTO rolePermissionDTO = null;
		List<SubPermissionDTO> subPermission = null;
		for(PermissionBean pemissionBean : permissionBeanList){
			rolePermissionDTO = new RolePermissionDTO();
			
			if(!role.equalsIgnoreCase(pemissionBean.getRole())){
				role = pemissionBean.getRole();
				rolePermissionDTO.setProfileId(pemissionBean.getProfileId());
				rolePermissionDTO.setRole(pemissionBean.getRole());
				rolePermissionDTO.setPermissionName(pemissionBean.getPermissionName());
				
				List<PermissionDTO> permissionList = new ArrayList<PermissionDTO>();
				PermissionDTO permissionDTO = new PermissionDTO();
				permissionDTO.setPermission(pemissionBean.getPermission());
				permissionDTO.setPermissionName(pemissionBean.getPermissionName());
				
				previousPermission = pemissionBean.getPermission();
				subPermission = new ArrayList<SubPermissionDTO>();
				if(StringUtils.isNotEmpty(pemissionBean.getSubPermission())){
					SubPermissionDTO subPerm = new SubPermissionDTO();
					subPerm.setPermission(pemissionBean.getSubPermission());;
					subPerm.setPermissionName(pemissionBean.getSubPermissionName());
					subPerm.setSubAction(pemissionBean.getSubAction());
					subPermission.add(subPerm);
				}
				permissionDTO.setSubPermission(subPermission);
				permissionList.add(permissionDTO);
				rolePermissionDTO.setPermission(permissionList);
				rolePermissionList.add(rolePermissionDTO);
			}else{

				
				if(!previousPermission.equalsIgnoreCase(pemissionBean.getPermission())){
					PermissionDTO permissionDTO = new PermissionDTO();
					permissionDTO.setPermission(pemissionBean.getPermission());
					permissionDTO.setPermissionName(pemissionBean.getPermissionName());
				}else{
					if(StringUtils.isNotEmpty(pemissionBean.getSubPermission())){
						SubPermissionDTO subPerm = new SubPermissionDTO();
						subPerm.setPermission(pemissionBean.getSubPermission());;
						subPerm.setPermissionName(pemissionBean.getSubPermissionName());
						subPerm.setSubAction(pemissionBean.getSubAction());
						subPermission.add(subPerm);
					}
				}

			}
			
		}
		return rolePermissionList;
	}
}
