package com.waio.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.waio.dto.UserDto;

@Component("userDao")
public class UserDao implements IUserDao {

	@Autowired
	DataSource dataSource;
	
	@Override
	public void saveUser(UserDto userDto) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "insert into login(firstname, lastname, emailId, password) value (?,?,?,?)";
		int i = jdbcTemplate.update(sql, new Object[] {userDto.getFirstname(), userDto.getLastname(), userDto.getEmailId(), userDto.getPassword()});
	    System.out.println("data inserted: " +i);
	
	}

	@Override
	public UserDto authentication(String emailId) {
		
			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			String sql = "select * from login where emailId=? ";
			UserDto user = jdbcTemplate.queryForObject(sql, new Object[] {emailId},new BeanPropertyRowMapper<UserDto>(UserDto.class));
			return user;
			
		}

	@Override
	public List<UserDto> getAllusers() {
			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
				String sql = "select firstname,lastname,emailId,password from login";
				List<UserDto> userList = jdbcTemplate.query(sql, new Object[] {},new BeanPropertyRowMapper<UserDto>(UserDto.class));
				return userList;

			}

	@Override
	public int editUser(UserDto user) {
			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			String sql = "update login set firstname=?, lastname=?, password=? where emailId=?";
			int i = jdbcTemplate.update(sql, new Object[]{user.getFirstname(), user.getLastname(),user.getPassword(), user.getEmailId()});
			return i;
		}
		

		@Override
	public List<UserDto> getUserByemailId(String emailId) {

			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			String sql = "select firstname, lastname,emailId, password from login where emailId=?";
			List<UserDto> userList = jdbcTemplate.query(sql, new Object[]{emailId}, new BeanPropertyRowMapper<UserDto>(UserDto.class));
			return userList;
		}

		@Override
		public int deleteUser(String emailId) {
	
				JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
				String sql = "delete from login where emailId=?";		
				int i = jdbcTemplate.update(sql, new Object[]{emailId});
				return i;
			}

		@Override
		public List<UserDto> searchUserById(String searchParam) {
			
					searchParam= "%"+searchParam+"%";
					JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
					String sql = "select * from login where id like (?) OR firstname like (?) OR lastname like (?) OR emailId like (?)";
					List<UserDto> userList = jdbcTemplate.query(sql, new Object[]{searchParam, searchParam, searchParam, searchParam }, new BeanPropertyRowMapper<UserDto>(UserDto.class));
					
					return userList;

				}
}

