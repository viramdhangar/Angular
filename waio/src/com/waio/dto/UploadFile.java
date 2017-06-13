package com.waio.dto;

import java.io.InputStream;

public class UploadFile {
	
	private long id;
	private String fileName;
	private byte[] data;
	private InputStream dataByte;

	/**
	 * @return the dataByte
	 */
	public InputStream getDataByte() {
		return dataByte;
	}

	/**
	 * @param dataByte the dataByte to set
	 */
	public void setDataByte(InputStream dataByte) {
		this.dataByte = dataByte;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}

}
