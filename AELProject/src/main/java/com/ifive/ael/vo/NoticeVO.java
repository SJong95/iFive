package com.ifive.ael.vo;

import java.sql.Date;

public class NoticeVO {
	
	private int NNUM;
	private String NTITLE;
	private String NCONTENT;
	private String NNAME;
	private Date NDATE;
	private int NDIVI;
	
	
	public NoticeVO() {
		super();
	}


	public int getNNUM() {
		return NNUM;
	}


	public void setNNUM(int nNUM) {
		NNUM = nNUM;
	}


	public String getNTITLE() {
		return NTITLE;
	}


	public void setNTITLE(String nTITLE) {
		NTITLE = nTITLE;
	}


	public String getNCONTENT() {
		return NCONTENT;
	}


	public void setNCONTENT(String nCONTENT) {
		NCONTENT = nCONTENT;
	}


	public String getNNAME() {
		return NNAME;
	}


	public void setNNAME(String nNAME) {
		NNAME = nNAME;
	}


	public Date getNDATE() {
		return NDATE;
	}


	public void setNDATE(Date nDATE) {
		NDATE = nDATE;
	}


	public int getNDIVI() {
		return NDIVI;
	}


	public void setNDIVI(int nDIVI) {
		NDIVI = nDIVI;
	}


	public NoticeVO(int nNUM, String nTITLE, String nCONTENT, String nNAME, Date nDATE, int nDIVI) {
		super();
		NNUM = nNUM;
		NTITLE = nTITLE;
		NCONTENT = nCONTENT;
		NNAME = nNAME;
		NDATE = nDATE;
		NDIVI = nDIVI;
	}
}