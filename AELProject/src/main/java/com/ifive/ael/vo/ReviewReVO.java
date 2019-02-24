package com.ifive.ael.vo;

import java.sql.Date;

public class ReviewReVO {

	private int vrNum;
	private String vId;
	private String rbNum;
	private String vrContent;
	private int vNum;
	private Date vrDate;
	
	public ReviewReVO(int vrNum, String vId, String rbNum, String vrContent, int vNum, Date vrDate) {
		super();
		this.vrNum = vrNum;
		this.vId = vId;
		this.rbNum = rbNum;
		this.vrContent = vrContent;
		this.vNum = vNum;
		this.vrDate = vrDate;
	}

	@Override
	public String toString() {
		return "ReviewReVO [vrNum=" + vrNum + ", vId=" + vId + ", rbNum=" + rbNum + ", vrContent=" + vrContent
				+ ", vNum=" + vNum + ", vrDate=" + vrDate + "]";
	}

	public ReviewReVO() {
		super();
	}

	public int getVrNum() {
		return vrNum;
	}

	public void setVrNum(int vrNum) {
		this.vrNum = vrNum;
	}

	public String getvId() {
		return vId;
	}

	public void setvId(String vId) {
		this.vId = vId;
	}

	public String getRbNum() {
		return rbNum;
	}

	public void setRbNum(String rbNum) {
		this.rbNum = rbNum;
	}

	public String getVrContent() {
		return vrContent;
	}

	public void setVrContent(String vrContent) {
		this.vrContent = vrContent;
	}

	public int getvNum() {
		return vNum;
	}

	public void setvNum(int vNum) {
		this.vNum = vNum;
	}

	public Date getVrDate() {
		return vrDate;
	}

	public void setVrDate(Date vrDate) {
		this.vrDate = vrDate;
	}
	
	
}
