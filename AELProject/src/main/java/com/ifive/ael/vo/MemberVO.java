package com.ifive.ael.vo;

import org.springframework.web.multipart.MultipartFile;

//Mimg추가
public class MemberVO {
	private String ID;
	private String PW;
	private String NAME;
	private String TEL;
	private String MEMBER_IMG;
	private MultipartFile MImg; 
	private String EMAIL;
	private int POINT;
	private int WHO;
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVO(String iD, String pW, String nAME, String tEL, String mEMBER_IMG, MultipartFile mImg, String eMAIL,
			int pOINT, int wHO) {
		super();
		ID = iD;
		PW = pW;
		NAME = nAME;
		TEL = tEL;
		MEMBER_IMG = mEMBER_IMG;
		MImg = mImg;
		EMAIL = eMAIL;
		POINT = pOINT;
		WHO = wHO;
	}
	public MemberVO(String iD, int pOINT) {
		super();
		ID = iD;
		POINT = pOINT;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPW() {
		return PW;
	}
	public void setPW(String pW) {
		PW = pW;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getTEL() {
		return TEL;
	}
	public void setTEL(String tEL) {
		TEL = tEL;
	}
	public String getMEMBER_IMG() {
		return MEMBER_IMG;
	}
	public void setMEMBER_IMG(String mEMBER_IMG) {
		MEMBER_IMG = mEMBER_IMG;
	}
	public MultipartFile getMImg() {
		return MImg;
	}
	public void setMImg(MultipartFile mImg) {
		MImg = mImg;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public int getPOINT() {
		return POINT;
	}
	public void setPOINT(int pOINT) {
		POINT = pOINT;
	}
	public int getWHO() {
		return WHO;
	}
	public void setWHO(int wHO) {
		WHO = wHO;
	}
	@Override
	public String toString() {
		return "MemberVO [ID=" + ID + ", PW=" + PW + ", NAME=" + NAME + ", TEL=" + TEL + ", MEMBER_IMG=" + MEMBER_IMG
				+ ", MImg=" + MImg + ", EMAIL=" + EMAIL + ", POINT=" + POINT + ", WHO=" + WHO + "]";
	}
	
}
