package com.waio.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.waio.dao.FileUploadDAO;
import com.waio.dto.UploadFile;

@Component("fileUploadDao")
public class FileUploadDAOImpl implements FileUploadDAO {
	
	@Autowired
	DataSource dataSource;
	
	public FileUploadDAOImpl() {
	}

	@Override
	public void save(UploadFile uploadFile) {

		String sql = "insert into profile ( file_name,file_data) values(?,?)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		jdbcTemplate.update(sql, new Object[] { uploadFile.getFileName(), uploadFile.getData() });
	}
}
