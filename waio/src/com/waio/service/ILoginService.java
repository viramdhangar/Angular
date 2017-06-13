package com.waio.service;

import java.util.List;

import com.waio.dto.LoginDTO;
import com.waio.dto.MenuDTO;
import com.waio.dto.RolePermissionDTO;

public interface ILoginService {

	public boolean getAuthentication(LoginDTO dto)throws Exception;
	public List<MenuDTO> getMenu(String id)throws Exception;
	public List<RolePermissionDTO> getAccess(String id);
}
