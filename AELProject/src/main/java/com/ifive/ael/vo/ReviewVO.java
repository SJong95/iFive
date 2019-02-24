package com.ifive.ael.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {

	private int vNum;
	private String id;
	private String rbNum;
	private String vContent;
	private MultipartFile vImg; 
	private double vGrade;
	private int vReport;
	private Date vDate;
	private String vImgName;
	private String vReportID;
	private String oNum;
	@Override
	public String toString() {
		return "ReviewVO [vNum=" + vNum + ", id=" + id + ", rbNum=" + rbNum + ", vContent=" + vContent + ", vImg="
				+ vImg + ", vGrade=" + vGrade + ", vReport=" + vReport + ", vDate=" + vDate + ", vImgName=" + vImgName
				+ ", vReportID=" + vReportID + ", oNum=" + oNum + "]";
	}
	public ReviewVO(int vNum, String id, String rbNum, String vContent, MultipartFile vImg, double vGrade, int vReport,
			Date vDate, String vImgName, String vReportID, String oNum) {
		super();
		this.vNum = vNum;
		this.id = id;
		this.rbNum = rbNum;
		this.vContent = vContent;
		this.vImg = vImg;
		this.vGrade = vGrade;
		this.vReport = vReport;
		this.vDate = vDate;
		this.vImgName = vImgName;
		this.vReportID = vReportID;
		this.oNum = oNum;
	}
	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getvNum() {
		return vNum;
	}
	public void setvNum(int vNum) {
		this.vNum = vNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRbNum() {
		return rbNum;
	}
	public void setRbNum(String rbNum) {
		this.rbNum = rbNum;
	}
	public String getvContent() {
		return vContent;
	}
	public void setvContent(String vContent) {
		this.vContent = vContent;
	}
	public MultipartFile getvImg() {
		return vImg;
	}
	public void setvImg(MultipartFile vImg) {
		this.vImg = vImg;
	}
	public double getvGrade() {
		return vGrade;
	}
	public void setvGrade(double vGrade) {
		this.vGrade = vGrade;
	}
	public int getvReport() {
		return vReport;
	}
	public void setvReport(int vReport) {
		this.vReport = vReport;
	}
	public Date getvDate() {
		return vDate;
	}
	public void setvDate(Date vDate) {
		this.vDate = vDate;
	}
	public String getvImgName() {
		return vImgName;
	}
	public void setvImgName(String vImgName) {
		this.vImgName = vImgName;
	}
	public String getvReportID() {
		return vReportID;
	}
	public void setvReportID(String vReportID) {
		this.vReportID = vReportID;
	}
	public String getoNum() {
		return oNum;
	}
	public void setoNum(String oNum) {
		this.oNum = oNum;
	}
	

}
