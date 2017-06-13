package com.waio.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.waio.converter.ExcelConverter;
import com.waio.domain.TrainingFee;
import com.waio.dto.CourseDTO;
import com.waio.dto.LoginDTO;
import com.waio.dto.ProfileDTO;
import com.waio.dto.TrainingFeesDTO;
import com.waio.dto.UploadFile;
import com.waio.excel.ProfileExport;
import com.waio.mail.Mail;
import com.waio.service.ICourseService;
import com.waio.service.IProfileService;
import com.waio.utility.GenUtils;

@Controller
public class ProfileController {

	@Autowired
	IProfileService profileService;

	@Autowired
	ICourseService courseService;
	
	@Autowired
	ExcelConverter excelConverter;
	
	@RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
	public @ResponseBody ModelAndView showForgetPassword() {
		return new ModelAndView("forgotPassword");
	}
	@RequestMapping(value = "/forgotPassword", method = RequestMethod.POST)
	public @ResponseBody String forgetPassword(HttpServletRequest request,@RequestBody String body) throws Exception {

		boolean isMailSent = false;
		String successMsg = "";
		// get profile from JSON string
		ProfileDTO profileJson = (ProfileDTO)GenUtils.getJavaFromJson(body.toString(), ProfileDTO.class);
		
	    ProfileDTO profile = profileService.findUserByEmail(profileJson.getEmail());
		if (profile == null) {
			successMsg = "User is invalid";
			return successMsg;
		}
	 
		 // create token
		String token = UUID.randomUUID().toString();
	 	
	    boolean isTokenCreated = profileService.createPasswordResetTokenForUser(profileJson.getEmail(),token);
	    	 
	    if(isTokenCreated){
	    	String appUrl = 
	    		      "http://" + request.getServerName() + 
	    		      ":" + request.getServerPort() + 
	    		      request.getContextPath();
	    	
	    	String url = appUrl + "/changePassword?id=" + profile.getId() + "&token=" + token;
	    	
	    	Mail mail = new Mail();
	    	String mailBody = "Hi "+profile.getFirstName()+" "+profile.getLastName()+",\n\n"
					+ "Your request for change password has been submitted, please click "+url+" here and reset your password.\n\n\n\n"
							+ "Regards,\n"
							+ "Waio Team";
									
	    	isMailSent = mail.sendResetEmail("Change Password", mailBody, profile.getEmail());
	    }
	    if(isMailSent){
	    	successMsg = "Password reset link has been sent to your registered email id. Please login your email and reset password."+isMailSent;
	    }
		return successMsg;
	}
	@RequestMapping(value = "/BootstrapModel", method = RequestMethod.GET)
	public @ResponseBody ModelAndView showBootstarpModel() {
		return new ModelAndView("BootstrapModel");
	}
	@RequestMapping(value = "/changePassword", method = RequestMethod.GET)
	public @ResponseBody ModelAndView showChangePassword(@RequestParam(value="id") String id, @RequestParam(value="token") String token) {
		
		String message = "";
		ModelAndView model = new ModelAndView("changePassword");
		boolean isTokenValid = profileService.isTokenValid(id, token);
		if(isTokenValid){
			message = "Please change your Password";
			model.addObject("msg", message);
			model.addObject("profileId", id);
			return model;
		}
		message = "Change password link is not valid.";
		return new ModelAndView("forgotPassword", "errorMsg" ,message);
	}
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public @ResponseBody ModelAndView changePassword(@RequestParam(value="id") String id,@RequestParam(value="password") String password) throws Exception {
		
		
		String message = "";
		
		boolean isPasswordChanged = profileService.changePasseord(id, password);
		if(isPasswordChanged){
			message = "Password changed successfully, please login now.";
		}else{
			message = "Password updatation failed due to some technical issues, please contact administrator."+isPasswordChanged+"";
		}
		return new ModelAndView("changePassword", "msg" ,message);
	}
	
	@RequestMapping(value = "/members", method = RequestMethod.GET , produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<ProfileDTO> getMemberList() throws Exception {
		
		ModelAndView model = new ModelAndView("members");
		System.out.println("in");
		List<ProfileDTO> profileList = new ArrayList<ProfileDTO>();
		profileList = profileService.getProfileList("1");
		model.addObject("profileList",profileList);
		return profileList;
		
	}
	@RequestMapping(value = "/Members.xls", method = RequestMethod.GET)
	public @ResponseBody ModelAndView membersExport() throws Exception {
		
		ModelAndView model = new ModelAndView("excelView");
		List<ProfileDTO> profileList = profileService.getProfileList("1");
		List<ProfileExport> profileExportList = excelConverter.profileConvert(profileList);
				
		model.addObject("profileList", profileExportList);
		model.addObject("clazz", ProfileExport.class);
		model.addObject("sheetName", "Profile");
		return model;
	}
	@RequestMapping(value = "/member", method = RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ModelAndView getMember(@RequestParam(value="profileId") String profileId) throws Exception {
		
		ModelAndView model = new ModelAndView("member-single");
		System.out.println("in");
		ProfileDTO profileDTO = new ProfileDTO();
		List<ProfileDTO> profileDTOList = new ArrayList<ProfileDTO>();
		profileDTOList = profileService.getProfile(profileId);
		String courseIds = "";
		for(ProfileDTO p : profileDTOList){
			courseIds += p.getCourse()+",";
		}
		if (courseIds.length() > 0 && courseIds.charAt(courseIds.length()-1)==',') {
			courseIds = courseIds.substring(0, courseIds.length()-1);
		    }
		System.out.println("courseIds "+courseIds);
		profileDTO = profileDTOList.get(0);
		List<CourseDTO> courseDTOList = courseService.getCourse(courseIds);
		model.addObject("profile",profileDTO);
		model.addObject("courseList",courseDTOList);
		return model;
		
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public ModelAndView showUploadForm(HttpServletRequest request) {
	
		HttpSession session = request.getSession();
		LoginDTO login = (LoginDTO)session.getAttribute("login");
		String isAlreadyUploaded = profileService.isAlreadyUploaded(login);
		return new ModelAndView("uploadFiles","isAlreadyUploaded",isAlreadyUploaded);
	}
	
	@RequestMapping(value = "/doUpload", method = RequestMethod.POST)
    public ModelAndView handleFileUpload(HttpServletRequest request,
            @RequestParam CommonsMultipartFile[] picUpload, @RequestParam CommonsMultipartFile[] resumeUpload) throws Exception {
         
		ModelAndView model = new ModelAndView("uploadFiles");
		 UploadFile uploadPic = new UploadFile();
        if (picUpload != null && picUpload.length > 0) {
            for (CommonsMultipartFile aFile : picUpload){
                 
                System.out.println("Saving file: " + aFile.getOriginalFilename());
                
                uploadPic.setFileName(aFile.getOriginalFilename());
                uploadPic.setData(aFile.getBytes());
               // fileUploadDao.save(uploadFile);                
            }
        }
 
        UploadFile uploadResume = new UploadFile();
        if (resumeUpload != null && resumeUpload.length > 0) {
            for (CommonsMultipartFile aFile : resumeUpload){
                 
                System.out.println("Saving file: " + aFile.getOriginalFilename());
                
                uploadResume.setFileName(aFile.getOriginalFilename());
                uploadResume.setData(aFile.getBytes());
               // fileUploadDao.save(uploadFile);                
            }
        }
		HttpSession session = request.getSession();
		LoginDTO login = (LoginDTO)session.getAttribute("login");
		profileService.saveFiles(login, uploadPic, uploadResume);
		model.addObject("msg", "Files uploaded successfully.");
        return model;
    }	
	
	@RequestMapping(value = "/saveRegistration", method = RequestMethod.POST)
	public @ResponseBody String saveRegistration(@RequestBody String body) throws Exception {
		System.out.println("In Controller");
		
		
		ProfileDTO profile = (ProfileDTO)GenUtils.getJavaFromJson(body.toString(), ProfileDTO.class);
		
		// check if email id already registered
		ProfileDTO profileDTO = profileService.findUserByEmail(profile.getEmail());
		if(profileDTO != null){	
			//return new ModelAndView("registration","msg","User Already registered, please login now.");
			return "User Already registered, please login now. If forgot possword then reset from login page.";
		}
		
		boolean isInserted = profileService.addProfile(profile);
		String msg = "Your profile not created";
		if(isInserted){
			msg = "Your profile created successfully";
		}
		Mail mail = new Mail();
		String mailBody = "Name :- "+profile.getFirstName()+""
				+ " "+profile.getLastName()+",\n"
						+ "Contact:- "+profile.getPhoneNumber()+"\n"
								+ "Email :- "+profile.getEmail()+"\n"
										+ "Graduation:- "+profile.getGraduation()+"\n"
										+ "Passout year :- "+profile.getPassout();
		//mail.sendEmail("New user registered", mailBody);
		mail.sendResetEmail("New user registered", mailBody,"waiosystem@gmail.com");
		String mailBodyUser = "Hello "+profile.getFirstName()+""
				+ " "+profile.getLastName()+",\n"
						+ "You have been successfully registered with Waio Technology we will caontact you soon Thanks !! \n\n"
						+ "Regards,\n"
						+ "Waio Technology";
		mail.sendResetEmail("Thanks to join Waio Technology!", mailBodyUser,profile.getEmail());
		//return new ModelAndView("registration","msg",msg);
		return "Registration Successful!. Thank you for your interest. We will contact you soon.";
	}
	@RequestMapping(value = "/quickContact", method = RequestMethod.POST)
	public @ResponseBody ModelAndView quickContact(@RequestBody String body) throws Exception {
		System.out.println("In Controller");
		System.out.println(body.toString());
		ProfileDTO profile = (ProfileDTO)GenUtils.getJavaFromJson(body.toString(), ProfileDTO.class);
		
		String msg = "Your profile not created";
		//Mail mail = new Mail();
		String mailBody = "Name :- "+profile.getFirstName()+"\n"
						+ "Email :- "+profile.getEmail()+"\n"
						+ "Contact:- "+profile.getPhoneNumber()+"\n"
						+ "Message:- "+profile.getYourMessage();
			
		Mail mail = new Mail();
		mail.sendEmail("New User Contacted", mailBody);
		return new ModelAndView("contact","msg",msg);
	}
	@RequestMapping(value = "/formSubmit", method = RequestMethod.POST)
	public @ResponseBody ProfileDTO formSubmit(@RequestBody String body) throws Exception {
		System.out.println("In Controller");
		System.out.println(body.toString());
		ProfileDTO profile = (ProfileDTO)GenUtils.getJavaFromJson(body.toString(), ProfileDTO.class);
		
		String msg = "Your profile not created";
		//Mail mail = new Mail();
		String mailBody = "Name :- "+profile.getFirstName()+"\n"
						+ "Email :- "+profile.getEmail()+"\n"
						+ "Contact:- "+profile.getPhoneNumber()+"\n"
						+ "Message:- "+profile.getYourMessage();
			
		Mail mail = new Mail();
		//mail.sendEmail("New User Contacted", mailBody);
		profile.setYourMessage("from serdver");
		return profile;
	}
	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public @ResponseBody ModelAndView registration() throws Exception {
		List<CourseDTO> courseList = new ArrayList<CourseDTO>();
		courseList = courseService.getCorporateCourseList();
		return new ModelAndView("registration","courseList",courseList);
	}
	@RequestMapping(value = "/feesDetail", method = RequestMethod.GET)
	public @ResponseBody ModelAndView feesDetail(HttpServletRequest request) throws Exception {
		
		ModelAndView model = new ModelAndView("fees-detail");
		List<TrainingFeesDTO> feesList = new ArrayList<TrainingFeesDTO>();
		HttpSession session = request.getSession();
		LoginDTO login = (LoginDTO)session.getAttribute("login");
		if(login!=null){
			feesList = profileService.getFeeDetails(login.getProfile_id());
			TrainingFeesDTO feesDetail = new TrainingFeesDTO();
			List<TrainingFeesDTO> feesDetailList = profileService.getFeeDetails(login.getProfile_id());	
			if (CollectionUtils.isNotEmpty(feesDetailList)) {
				feesDetail = feesDetailList.get(0);
			}
			List<CourseDTO> courseList = new ArrayList<CourseDTO>();
			courseList = courseService.getCorporateCourseList();
			ProfileDTO profile = profileService.getProfile(login.getProfile_id()).get(0);
			for(CourseDTO course : courseList){
				if(profile.getCourse().equalsIgnoreCase(""+course.getId())){
					if (CollectionUtils.isEmpty(feesDetailList)) {
						feesDetail.setTotalFees(course.getFees());
						feesDetail.setTotalRemainingFees(course.getFees());
					}
					feesDetail.setCourse(course);
				}
			}
			model.addObject("feesDetail", feesDetail);
			model.addObject("feesList", feesList);
		}else{
			model.addObject("msg", "Your session expired, Please login first.");	
		}
		return model;
	}
	@RequestMapping(value = "/submitFees", method = RequestMethod.GET)
	public @ResponseBody ModelAndView feesCourses(HttpServletRequest request) throws Exception {
		ModelAndView model = new ModelAndView("submitFees");
		List<TrainingFee> tainingFeeList = new ArrayList<TrainingFee>();
		tainingFeeList = profileService.getFeesCourse();
		List<ProfileDTO> profileList = new ArrayList<ProfileDTO>();
		profileList = profileService.getProfileList("1");
		model.addObject("profileList",profileList);
		model.addObject("courseFeesList", tainingFeeList);
		return model;
	}
	@RequestMapping(value = "/submitFees", method = RequestMethod.POST)
	public @ResponseBody String submitFees(@RequestBody String body) throws Exception {
		System.out.println(""+body);
		//System.out.println(id);
		TrainingFee traineeFee = (TrainingFee)GenUtils.getJavaFromJson(body.toString(), TrainingFee.class);
		boolean isSubmitted = profileService.submitFees(traineeFee);
		if(isSubmitted){
			return "Fees submitted successfully.";
		}else{
			return "Fees not submitted, please contact with administrator.";	
		}
	}
	@RequestMapping(value = "/getFeesDetailForTrainee", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody TrainingFeesDTO getFeesDetailForTrainee(HttpServletRequest request,@RequestParam (value="id")String id) throws Exception {
		
//		ProfileDTO profile = (ProfileDTO)GenUtils.getJavaFromJson(body.toString(), ProfileDTO.class);
		
		ModelAndView model = new ModelAndView("submitFees");
		TrainingFeesDTO feesDetail = new TrainingFeesDTO();
		List<TrainingFeesDTO> feesDetailList = profileService.getFeeDetails(id);	
		if (CollectionUtils.isNotEmpty(feesDetailList)) {
			feesDetail = feesDetailList.get(0);
		}
		List<CourseDTO> courseList = new ArrayList<CourseDTO>();
		courseList = courseService.getCorporateCourseList();
		ProfileDTO profile = profileService.getProfile(id).get(0);
		for(CourseDTO course : courseList){
			if(profile.getCourse().equalsIgnoreCase(""+course.getId())){
				if (CollectionUtils.isEmpty(feesDetailList)) {
					feesDetail.setTotalFees(course.getFees());
					feesDetail.setTotalRemainingFees(course.getFees());
				}
				feesDetail.setCourse(course);
			}
		}
		model.addObject("feesDetail", feesDetail);
		
		return feesDetail;
	}
	
	@RequestMapping(value = "/getFeesDetailForAllTrainee", method = RequestMethod.GET)
	public @ResponseBody ModelAndView getFeesDetailForAllTrainee(HttpServletRequest request) throws Exception {
		
//		ProfileDTO profile = (ProfileDTO)GenUtils.getJavaFromJson(body.toString(), ProfileDTO.class);
		
		ModelAndView model = new ModelAndView("TraineeFees");
		List<TrainingFeesDTO> feesDetail = profileService.getFeeDetails(StringUtils.EMPTY);		
		HashSet<TrainingFeesDTO> feesSet = new HashSet<TrainingFeesDTO>(feesDetail);
		feesDetail = new ArrayList<TrainingFeesDTO>(feesSet);
		model.addObject("feesDetailList", feesDetail);
		
		return model;
	}
	
	@RequestMapping(value = "/allMembers", method = RequestMethod.GET)
	public @ResponseBody ModelAndView getAllMembers() throws Exception {
		
		ModelAndView model = new ModelAndView("activeuser");
		List<ProfileDTO> profileList = new ArrayList<ProfileDTO>();
		profileList = profileService.getProfileList("ALL_MEMBERS");
		List<CourseDTO> courseList = new ArrayList<CourseDTO>();
		courseList = courseService.getCorporateCourseList();
		Iterator<ProfileDTO> it = profileList.iterator();
		while(it.hasNext()){
			ProfileDTO profile = it.next();
			if(profile.getStatus().equalsIgnoreCase("1")){
				it.remove();
			}
		}
		model.addObject("courseList",courseList);
		model.addObject("profileList",profileList);
		return model;
	}
	@RequestMapping(value = "/activateUser", method = RequestMethod.POST)
	public @ResponseBody String activateUser(@RequestBody String body) throws Exception {
		System.out.println(""+body);
		ProfileDTO profileDTO = (ProfileDTO)GenUtils.getJavaFromJson(body.toString(), ProfileDTO.class);
		boolean isSubmitted = profileService.activateUser(profileDTO);
		if(isSubmitted){
			return "User activated successfully.";
		}else{
			return "User not activated, please contact with administrator.";	
		}
	}
}
