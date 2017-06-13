package com.waio.dao;

import java.util.List;

import com.waio.domain.PermissionBean;
import com.waio.dto.LoginDTO;
import com.waio.dto.MenuDTO;

public interface ILoginDao {

	public boolean getAuthentication(LoginDTO dto)throws Exception;
	public List<MenuDTO> getMenu(String id) throws Exception;
	public List<PermissionBean> getAccess(String id);
}
