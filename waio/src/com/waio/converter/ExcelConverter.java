/**
 * 
 */
package com.waio.converter;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.waio.dto.ProfileDTO;
import com.waio.excel.ProfileExport;

/**
 * @author viramdhangar
 *
 */
@Service
public class ExcelConverter {

	public List<ProfileExport> profileConvert(List<ProfileDTO> profileList) {

		ProfileExport profileExport = null;
		List<ProfileExport> profileExportList = new ArrayList<ProfileExport>();
		for (ProfileDTO profile : profileList) {
			profileExport = new ProfileExport();
			profileExport.setFirstName(profile.getFirstName());
			profileExport.setLastName(profile.getLastName());
			profileExport.setEmail(profile.getEmail());
			profileExport.setPhoneNumber(profile.getPhoneNumber());
			profileExport.setAddressline1(profile.getAddressline1());
			profileExportList.add(profileExport);
		}
		return profileExportList;
	}
}