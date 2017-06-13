package com.waio.service;

import java.util.List;

import com.waio.domain.TrainingFee;
import com.waio.dto.LoginDTO;
import com.waio.dto.ProfileDTO;
import com.waio.dto.TrainingFeesDTO;
import com.waio.dto.UploadFile;

public interface IProfileService {

	public List<ProfileDTO> getProfileList(String status)throws Exception;
	public boolean addProfile(ProfileDTO dto) throws Exception;
	public List<ProfileDTO> getProfile(String profileId)throws Exception;
	public boolean saveFiles(LoginDTO login, UploadFile uploadPic, UploadFile uploadResume);
	public String isAlreadyUploaded(LoginDTO login);
	public boolean createPasswordResetTokenForUser(String email,String token);
	public ProfileDTO findUserByEmail(String email);
	public boolean isTokenValid(String id, String token);
	public boolean changePasseord(String id, String password);
	public List<TrainingFeesDTO> getFeeDetails(String profileId);
	public List<TrainingFee> getFeesCourse();
	public boolean submitFees(TrainingFee dto) throws Exception;
	boolean activateUser(ProfileDTO dto);
}
