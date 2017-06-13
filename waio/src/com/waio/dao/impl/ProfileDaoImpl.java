package com.waio.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import com.waio.dao.IProfileDao;
import com.waio.domain.TrainingFee;
import com.waio.dto.LoginDTO;
import com.waio.dto.ProfileDTO;
import com.waio.dto.UploadFile;

@Component("profileDao")
public class ProfileDaoImpl implements IProfileDao{

	@Autowired
	DataSource dataSource;
	
	@Override
	public List<ProfileDTO> getProfileList(String status)throws Exception{
		
		List<ProfileDTO> profileList = new ArrayList<ProfileDTO>();
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select id,first_name firstName,last_name lastName,email,phone_number phoneNumber,addressline1,addressline2,profile_type profileType,imagePath,status,course from profile where statusClause ";
		if("ALL_MEMBERS".equalsIgnoreCase(status)){
			sql = sql.replaceAll("statusClause", "1=1");
		}else{
			sql = sql.replaceAll("statusClause", " status='1'");
		}
		profileList = jdbcTemplate.query(sql, new Object[] {}, new BeanPropertyRowMapper<ProfileDTO>(ProfileDTO.class));
		System.out.println(profileList.size());
		return profileList;
	}

	@Override
	public boolean addProfile(ProfileDTO dto) throws Exception {

		String sql = "insert into profile (id, first_name, last_name, gender, email, phone_number,addressline1,addressline2,profile_type,graduation,passout,course,imagePath,created,createdid) values(?,?,?,?,?,?,?,?,'USER',?,?,?,?,CURDATE(),'USER')";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		dto.setImagePath("assets/images/demo-content/default-profile.png");
		int id = getProfileSequence();
		jdbcTemplate.update(
				sql,
				new Object[] { 
						id,
						dto.getFirstName(),
						dto.getLastName(),
						dto.getGender(), 
						dto.getEmail(),
						dto.getPhoneNumber(),
						dto.getAddressline1(),
						dto.getAddressline2(),
						dto.getGraduation(),
						dto.getPassout(),
						dto.getCourse(),
						dto.getImagePath()
						
				});
		
		// saving credentials
		saveCredential(id, dto);
		
		// save skill set
		saveSkillSet(id, dto);
		
		// save rel profile role 
		saveRelProfileRole(id, dto);
		/*String sqlProfileCourse = "insert into rel_profile_course ( profile_id, course_id,created,createdid) values(?,?,CURDATE(),'USER')";
		jdbcTemplate.update(
				sqlProfileCourse,
				new Object[] { 
					
				});*/
		return true;
	}
	private boolean saveRelProfileRole(int id, ProfileDTO dto){
		String sql = "insert into rel_profile_role(profile_id, role_id, created, createdid) values (?,'ROLE_TRAINEE', current_timestamp,?)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(
				sql,
				new Object[] { 
						id,
						id				
				});
		return true;
	}
	private boolean saveSkillSet(int id, ProfileDTO dto){
		String sql = "insert into skill_set(profileId, courseId) values (?,?)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(
				sql,
				new Object[] { 
						id,
						dto.getCourse()				
				});
		return true;
	}
	private boolean saveCredential(int id, ProfileDTO dto){
		String sql = "insert into credential(password, profile_id, created, createdid, email) values (?,?,current_timestamp,'USER',?)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(
				sql,
				new Object[] { 
						dto.getPassword(),
						id,
						dto.getEmail()				
				});
		return true;
	}
	
	private int getProfileSequence(){
		String sql = "select max(id) from profile";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		int id = jdbcTemplate.queryForObject(sql, new Object[]{},Integer.class);
		id = id+1;
		return id;
	}
	private int getPaidFeesSequence(){
		String sql = "select max(id) from paid_fees";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		int id = jdbcTemplate.queryForObject(sql, new Object[]{},Integer.class);
		id = id+1;
		return id;
	}
	@Override
	public List<ProfileDTO> getProfile(String profileId)throws Exception{
		List<ProfileDTO> profileList = new ArrayList<ProfileDTO>();
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select id,first_name firstName,last_name lastName,email,phone_number phoneNumber,addressline1,addressline1,profile_type profileType,imagePath,description,profile.course from profile where idOrEmailClause=?";
		
		if(profileId.contains("@")){
			sql = sql.replaceAll("idOrEmailClause", "email");
		}else{
			sql = sql.replaceAll("idOrEmailClause", "id");
		}
		
		profileList = jdbcTemplate.query(sql, new Object[] {profileId}, new BeanPropertyRowMapper<ProfileDTO>(ProfileDTO.class));
		System.out.println(profileList.size());
		return profileList;
	}
	
	@Override
	public List<ProfileDTO> getProfileDetail(String profileId){
		
		List<ProfileDTO> profileList = new ArrayList<ProfileDTO>();
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select id,first_name firstName,last_name lastName,email,phone_number phoneNumber,addressline1,addressline1,profile_type profileType,imagePath,description from profile where idOrEmailClause = ?";
		
		if(profileId.contains("@")){
			sql = sql.replaceAll("idOrEmailClause", "email");
		}else{
			sql = sql.replaceAll("idOrEmailClause", "id");
		}
		
		profileList = jdbcTemplate.query(sql, new Object[] {profileId}, new BeanPropertyRowMapper<ProfileDTO>(ProfileDTO.class));
		System.out.println(profileList.size());
		return profileList;
	}

	@Override
	public boolean saveFiles(LoginDTO login, UploadFile uploadPic, UploadFile uploadResume) {
		
		String sql = "update profile set user_pic = ?, user_pic_data = ? , user_doc = ?, user_doc_data = ? where id=?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql, new Object[] { uploadPic.getFileName(), uploadPic.getData(),uploadResume.getFileName(), uploadResume.getData(), login.getProfile_id()});
		return true;
	}
	@Override
	public String isAlreadyUploaded(LoginDTO login) {
		
		String msg = "";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String alreadyUpdated = "select count(*) from profile where id = ? and user_pic is not null and user_doc is not null";
		int count = jdbcTemplate.queryForObject(alreadyUpdated, new Object[] {login.getProfile_id()}, Integer.class);
		if (count == 1){
			msg = "Picture and resume already uploaded. if will upload it will override from previous.";
		}
		return msg;
	}

	@Override
	public boolean createPasswordResetTokenForUser(String email, String token) {
		
		boolean isTokenCreated = false;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "update profile set token=? where email=?";
		int i = jdbcTemplate.update(sql, new Object[]{token, email});
		if(i>0){
			isTokenCreated = true;
		}
		return isTokenCreated;
	}

	@Override
	public ProfileDTO findUserByEmail(String email) {
		
		List<ProfileDTO> profileDTOList = null;
		ProfileDTO profileDTO = null;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select * from profile where email = ?";
		profileDTOList = jdbcTemplate.query(sql, new Object[] {email}, new BeanPropertyRowMapper<ProfileDTO>(ProfileDTO.class));
		if(profileDTOList.size()>0){
			profileDTO = profileDTOList.get(0);
			return profileDTO;
		}
		return profileDTO;
	}
	@Override
	public String isTokenValid(String id){
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select token from profile where id=?";
		String tokenValue = jdbcTemplate.queryForObject(sql, new Object[]{id}, String.class);
		return tokenValue;
	}
	public boolean changePasseord(String id, String password){
		String sql = "update credential set password=?, updated=current_timestamp, updatedid=? where profile_id=?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		int i = jdbcTemplate.update(
				sql,
				new Object[] { 
						password,
						id,
						id				
				});
		if(i>0){
			return true;
		}
		return false;
	}

	@Override
	public List<TrainingFee> getFeeDetails(String profileId) {

		List<TrainingFee> tainingFeeList = new ArrayList<TrainingFee>();
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select profile.course, fees.training_type, fees.fees totalFees, (fees.fees-t1.totalPaidFees) totalRemainingFees ,paid_fees.fees paidFees, profile.first_name , profile.last_name,t1.totalPaidFees, paid_fees.created paidOn, paid_fees.profile_id profileId from paid_fees, profile profile, fees, (select sum(pf.fees) totalPaidFees,pf.profile_id  from paid_fees pf, fees f where f.id=pf.fees_id group by pf.profile_id )t1 where paid_fees.fees_id=fees.id AND profileClause AND paid_fees.profile_id=t1.profile_id AND paid_fees.profile_id=profile.id order by paid_fees.id asc";
		if(StringUtils.isEmpty(profileId) && StringUtils.isBlank(profileId)){
			sql = sql.replaceAll("profileClause", "1=1");
			tainingFeeList = jdbcTemplate.query(sql, new Object[] {},
					new BeanPropertyRowMapper<TrainingFee>(TrainingFee.class));
		}else{
			sql = sql.replaceAll("profileClause", " paid_fees.profile_id = ? ");
			tainingFeeList = jdbcTemplate.query(sql, new Object[] { profileId },
					new BeanPropertyRowMapper<TrainingFee>(TrainingFee.class));
		}
		
		return tainingFeeList;
	}
	
	public List<TrainingFee> getFeesCourse(){
		List<TrainingFee> tainingFeeList = new ArrayList<TrainingFee>();
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select id,training_type, fees totalFees from fees";
		tainingFeeList = jdbcTemplate.query(sql, new Object[] {},
				new BeanPropertyRowMapper<TrainingFee>(TrainingFee.class));
		return tainingFeeList;
	}
	@Override
	public boolean submitFees(TrainingFee dto) throws Exception {

		String sql = "insert into paid_fees (id, fees_id, profile_id, fees, created) values (?,?,?,?, current_timestamp) ";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		int id = getPaidFeesSequence();
		jdbcTemplate.update(
				sql,
				new Object[] { 
						id,
						dto.getId(),
						dto.getProfileId(),
						Integer.parseInt(dto.getFees())						
				});
		return true;
	}
	@Override
	public boolean activateUser(ProfileDTO dto){

		String sql = "update profile set status='1', course=? where id=?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(
				sql,
				new Object[] { 
						dto.getCourse(),
						dto.getId()						
				});
		// assign member role
		assignMemberRole(dto);
		return true;
	}
	public boolean assignMemberRole(ProfileDTO dto){

		String sql = "insert into profile_role_permission(profile_id,role,created) values(?,?,current_timestamp)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		List<String> roles = new ArrayList<String>();
		roles.add("ROLE_MEMBER");
		jdbcTemplate.update(
				sql,
				new Object[] { 
						dto.getId(),
						"ROLE_MEMBER"						
				});
		return true;
	}
}
