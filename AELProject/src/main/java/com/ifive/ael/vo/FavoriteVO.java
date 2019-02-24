package com.ifive.ael.vo;

public class FavoriteVO {
	
	private String ID;
	private String RBNUM;
	private String FRNAME;
	private int FAMOUNT;
	
	
	
	public FavoriteVO() {
		super();
	}
	public FavoriteVO(String iD, String rBNUM, String fRNAME, int fAMOUNT) {
		super();
		ID = iD;
		RBNUM = rBNUM;
		FRNAME = fRNAME;
		FAMOUNT = fAMOUNT;
	}
	public int getFAMOUNT() {
		return FAMOUNT;
	}
	public void setFAMOUNT(int fAMOUNT) {
		FAMOUNT = fAMOUNT;
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
	public String getFRNAME() {
		return FRNAME;
	}
	public void setFRNAME(String fRNAME) {
		FRNAME = fRNAME;
	}

}
