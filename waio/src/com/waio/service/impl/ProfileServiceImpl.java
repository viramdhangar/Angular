package com.waio.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.waio.dao.IProfileDao;
import com.waio.domain.Installment;
import com.waio.domain.TrainingFee;
import com.waio.dto.LoginDTO;
import com.waio.dto.ProfileDTO;
import com.waio.dto.TrainingFeesDTO;
import com.waio.dto.UploadFile;
import com.waio.mail.Mail;
import com.waio.service.IProfileService;

@Service("profileService")
public class ProfileServiceImpl implements IProfileService{

	@Autowired
	IProfileDao profileDao;
	
	@Override
	public List<ProfileDTO> getProfileList(String status) throws Exception {
		// TODO Auto-generated method stub
		return profileDao.getProfileList(status);
	}

	@Override
	public boolean addProfile(ProfileDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return profileDao.addProfile(dto);
	}

	@Override
	public List<ProfileDTO> getProfile(String profileId) throws Exception {
		// TODO Auto-generated method stub
		return profileDao.getProfile(profileId);
	}

	@Override
	public boolean saveFiles(LoginDTO login, UploadFile uploadPic, UploadFile uploadResume) {
		// TODO Auto-generated method stub
		return profileDao.saveFiles(login, uploadPic, uploadResume);
	}

	@Override
	public String isAlreadyUploaded(LoginDTO login) {
		// TODO Auto-generated method stub
		return profileDao.isAlreadyUploaded(login);
	}

	@Override
	public boolean createPasswordResetTokenForUser(String email, String token){
		// TODO Auto-generated method stub
		return profileDao.createPasswordResetTokenForUser(email, token);
	}

	@Override
	public ProfileDTO findUserByEmail(String email) {
		// TODO Auto-generated method stub
		return profileDao.findUserByEmail(email);
	}

	@Override
	public boolean isTokenValid(String id, String token) {
		// TODO Auto-generated method stub
		boolean isTokenValid = false;
		String tokenFromDB = profileDao.isTokenValid(id);
		if(StringUtils.isNotBlank(tokenFromDB) && tokenFromDB.equalsIgnoreCase(token)){
			isTokenValid = true;	
		}
		return isTokenValid;
	}

	@Override
	public boolean changePasseord(String id, String password) {
		// TODO Auto-generated method stub
		return profileDao.changePasseord(id, password);
	}

	@Override
	public List<TrainingFeesDTO> getFeeDetails(String profileId) {
		// TODO Auto-generated method stub
		List<TrainingFee> trainingFeesList = profileDao.getFeeDetails(profileId);
		List<TrainingFeesDTO> TrainingFeesDTOList = new ArrayList<TrainingFeesDTO>();
		TrainingFeesDTO tfd = null;
		List<Installment> listInstallment = null;
		String previusProfileId = "";
		int count = 0;
		for(TrainingFee tf : trainingFeesList){
			Installment install = null;
			if(!previusProfileId.equalsIgnoreCase(tf.getProfileId())){
				count = 0;
				previusProfileId = tf.getProfileId();
				tfd = new TrainingFeesDTO();
				listInstallment = new ArrayList<Installment>();
				tfd.setProfileId(tf.getProfileId());
				tfd.setFirstName(tf.getFirstName());
				tfd.setLastName(tf.getLastName());
				tfd.setTotalFees(tf.getTotalFees());
				tfd.setTotalRemainingFees(tf.getTotalRemainingFees());
				tfd.setTotalPaidFees(tf.getTotalPaidFees());
				
				install = new Installment();
				count++;
				install.setInstallmentName(""+count+" Installment");
				install.setPaidFees(tf.getPaidFees());
				install.setPaidOn(tf.getPaidOn());
				listInstallment.add(install);
				tfd.setIntallments(listInstallment);
				TrainingFeesDTOList.add(tfd);
				
			}else{
				install = new Installment();
				count++;
				install.setInstallmentName(""+count+" Installment");
				install.setPaidFees(tf.getPaidFees());
				install.setPaidOn(tf.getPaidOn());
				listInstallment.add(install);
			}
		}
		return TrainingFeesDTOList;
	}

	@Override
	public List<TrainingFee> getFeesCourse() {
		// TODO Auto-generated method stub
		return profileDao.getFeesCourse();
	}

	@Override
	public boolean submitFees(TrainingFee dto) throws Exception {
		// TODO Auto-generated method stub
		boolean isMailSent = false;
		boolean isSubmitted = profileDao.submitFees(dto);
		ProfileDTO profile = getProfile(dto.getProfileId()).get(0);
		if(isSubmitted){
			Mail mail = new Mail();
	    	String mailBody = "Hi "+profile.getFirstName()+" "+profile.getLastName()+",\n\n"
					+ "We have recieved Rs. "+dto.getFees()+"/-  as a intallment of training fees from you.\nYou can check fees detail on our website.\n\n\n\n"
							+ "Regards,\n"
							+ "Waio Technology";
									
	    	isMailSent = mail.sendResetEmail("Thanks for submitting fees", mailBody, profile.getEmail());
		}
		return isSubmitted;
	}

	@Override
	public boolean activateUser(ProfileDTO dto) {
		// TODO Auto-generated method stub
		return profileDao.activateUser(dto);
	}
}
