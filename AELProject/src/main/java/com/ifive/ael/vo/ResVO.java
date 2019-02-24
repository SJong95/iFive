package com.ifive.ael.vo;

import org.springframework.web.multipart.MultipartFile;

public class ResVO {

	private String ID;
	private String RBNUM;
	private String RNAME;
	private String RADDR;

	private String POSTCODE;
	private String ROADADDRESS;
	private String JIBUNADDRESS;
	private String DETAILADDRESS;
	private String EXTRAADDRESS;

	private String RTEL;
	private String RES_IMG;
	private MultipartFile RFile;
	private String RCHOICE;
	private String RCATE;
	private double RGRADE;
	private int REPORT;
	private String DIVI;

	public void setRADDR() {
		RADDR = ROADADDRESS + EXTRAADDRESS +" "+ DETAILADDRESS;
	}

	public ResVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ResVO(String iD, String rBNUM, String rNAME, String rADDR, String pOSTCODE, String rOADADDRESS,
			String jIBUNADDRESS, String dETAILADDRESS, String eXTRAADDRESS, String rTEL, String rES_IMG,
			MultipartFile rFile, String rCHOICE, String rCATE, double rGRADE, int rEPORT, String dIVI) {
		super();
		ID = iD;
		RBNUM = rBNUM;
		RNAME = rNAME;
		RADDR = rADDR;
		POSTCODE = pOSTCODE;
		ROADADDRESS = rOADADDRESS;
		JIBUNADDRESS = jIBUNADDRESS;
		DETAILADDRESS = dETAILADDRESS;
		EXTRAADDRESS = eXTRAADDRESS;
		RTEL = rTEL;
		RES_IMG = rES_IMG;
		RFile = rFile;
		RCHOICE = rCHOICE;
		RCATE = rCATE;
		RGRADE = rGRADE;
		REPORT = rEPORT;
		DIVI = dIVI;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getRBNUM() {
		return RBNUM;
	}

	public void setRBNUM(String rBNUM) {
		RBNUM = rBNUM;
	}

	public String getRNAME() {
		return RNAME;
	}

	public void setRNAME(String rNAME) {
		RNAME = rNAME;
	}

	public String getRADDR() {
		return RADDR;
	}

	public void setRADDR(String rADDR) {
		RADDR = rADDR;
	}

	public String getPOSTCODE() {
		return POSTCODE;
	}

	public void setPOSTCODE(String pOSTCODE) {
		POSTCODE = pOSTCODE;
	}

	public String getROADADDRESS() {
		return ROADADDRESS;
	}

	public void setROADADDRESS(String rOADADDRESS) {
		ROADADDRESS = rOADADDRESS;
	}

	public String getJIBUNADDRESS() {
		return JIBUNADDRESS;
	}

	public void setJIBUNADDRESS(String jIBUNADDRESS) {
		JIBUNADDRESS = jIBUNADDRESS;
	}

	public String getDETAILADDRESS() {
		return DETAILADDRESS;
	}

	public void setDETAILADDRESS(String dETAILADDRESS) {
		DETAILADDRESS = dETAILADDRESS;
	}

	public String getEXTRAADDRESS() {
		return EXTRAADDRESS;
	}

	public void setEXTRAADDRESS(String eXTRAADDRESS) {
		EXTRAADDRESS = eXTRAADDRESS;
	}

	public String getRTEL() {
		return RTEL;
	}

	public void setRTEL(String rTEL) {
		RTEL = rTEL;
	}

	public String getRES_IMG() {
		return RES_IMG;
	}

	public void setRES_IMG(String rES_IMG) {
		RES_IMG = rES_IMG;
	}

	public MultipartFile getRFile() {
		return RFile;
	}

	public void setRFile(MultipartFile rFile) {
		RFile = rFile;
	}

	public String getRCHOICE() {
		return RCHOICE;
	}

	public void setRCHOICE(String rCHOICE) {
		RCHOICE = rCHOICE;
	}

	public String getRCATE() {
		return RCATE;
	}

	public void setRCATE(String rCATE) {
		RCATE = rCATE;
	}

	public double getRGRADE() {
		return RGRADE;
	}

	public void setRGRADE(double rGRADE) {
		RGRADE = rGRADE;
	}

	public int getREPORT() {
		return REPORT;
	}

	public void setREPORT(int rEPORT) {
		REPORT = rEPORT;
	}

	public String getDIVI() {
		return DIVI;
	}

	public void setDIVI(String dIVI) {
		DIVI = dIVI;
	}

	@Override
	public String toString() {
		return "ResVO [ID=" + ID + ", RBNUM=" + RBNUM + ", RNAME=" + RNAME + ", RADDR=" + RADDR + ", POSTCODE="
				+ POSTCODE + ", ROADADDRESS=" + ROADADDRESS + ", JIBUNADDRESS=" + JIBUNADDRESS + ", DETAILADDRESS="
				+ DETAILADDRESS + ", EXTRAADDRESS=" + EXTRAADDRESS + ", RTEL=" + RTEL + ", RES_IMG=" + RES_IMG
				+ ", RFile=" + RFile + ", RCHOICE=" + RCHOICE + ", RCATE=" + RCATE + ", RGRADE=" + RGRADE + ", REPORT="
				+ REPORT + ", DIVI=" + DIVI + "]";
	}

}
