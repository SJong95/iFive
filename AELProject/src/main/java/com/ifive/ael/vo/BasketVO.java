package com.ifive.ael.vo;

public class BasketVO {
	private String RBNUM;
	private String ID;
	private String BRNAME;
	private int BPRICE;
	private String BMENU;
	private int BAMOUNT;
	public BasketVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BasketVO(String rBNUM, String iD, String bRNAME, int bPRICE, String bMENU, int bAMOUNT) {
		super();
		RBNUM = rBNUM;
		ID = iD;
		BRNAME = bRNAME;
		BPRICE = bPRICE;
		BMENU = bMENU;
		BAMOUNT = bAMOUNT;
	}
	
	public BasketVO(String rBNUM, String iD) {
		super();
		RBNUM = rBNUM;
		ID = iD;
	}
	public String getRBNUM() {
		return RBNUM;
	}
	public void setRBNUM(String rBNUM) {
		RBNUM = rBNUM;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getBRNAME() {
		return BRNAME;
	}
	public void setBRNAME(String bRNAME) {
		BRNAME = bRNAME;
	}
	public int getBPRICE() {
		return BPRICE;
	}
	public void setBPRICE(int bPRICE) {
		BPRICE = bPRICE;
	}
	public String getBMENU() {
		return BMENU;
	}
	public void setBMENU(String bMENU) {
		BMENU = bMENU;
	}
	public int getBAMOUNT() {
		return BAMOUNT;
	}
	public void setBAMOUNT(int bAMOUNT) {
		BAMOUNT = bAMOUNT;
	}
	@Override
	public String toString() {
		return "BasketVO [RBNUM=" + RBNUM + ", ID=" + ID + ", BRNAME=" + BRNAME + ", BPRICE=" + BPRICE + ", BMENU="
				+ BMENU + ", BAMOUNT=" + BAMOUNT + "]";
	}
	

}
