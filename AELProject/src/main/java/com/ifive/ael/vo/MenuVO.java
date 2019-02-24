package com.ifive.ael.vo;

import org.springframework.web.multipart.MultipartFile;

public class MenuVO {

	private String RBNUM;
	private String MNAME;
	private String MNAME2;
	private int MPRICE;
	private String MIMG;
	private MultipartFile MFile;
	private String MTMI;
	public MenuVO() {
		super();
		// TODO 자동 생성된 생성자 스텁
	}
	public MenuVO(String rBNUM, String mNAME, String mNAME2, int mPRICE, String mIMG, MultipartFile mFile,
			String mTMI) {
		super();
		RBNUM = rBNUM;
		MNAME = mNAME;
		MNAME2 = mNAME2;
		MPRICE = mPRICE;
		MIMG = mIMG;
		MFile = mFile;
		MTMI = mTMI;
	}
	public String getRBNUM() {
		return RBNUM;
	}
	public void setRBNUM(String rBNUM) {
		RBNUM = rBNUM;
	}
	public String getMNAME() {
		return MNAME;
	}
	public void setMNAME(String mNAME) {
		MNAME = mNAME;
	}
	public String getMNAME2() {
		return MNAME2;
	}
	public void setMNAME2(String mNAME2) {
		MNAME2 = mNAME2;
	}
	public int getMPRICE() {
		return MPRICE;
	}
	public void setMPRICE(int mPRICE) {
		MPRICE = mPRICE;
	}
	public String getMIMG() {
		return MIMG;
	}
	public void setMIMG(String mIMG) {
		MIMG = mIMG;
	}
	public MultipartFile getMFile() {
		return MFile;
	}
	public void setMFile(MultipartFile mFile) {
		MFile = mFile;
	}
	public String getMTMI() {
		return MTMI;
	}
	public void setMTMI(String mTMI) {
		MTMI = mTMI;
	}
	@Override
	public String toString() {
		return "MenuVO [RBNUM=" + RBNUM + ", MNAME=" + MNAME + ", MNAME2=" + MNAME2 + ", MPRICE=" + MPRICE + ", MIMG="
				+ MIMG + ", MFile=" + MFile + ", MTMI=" + MTMI + "]";
	}



}
