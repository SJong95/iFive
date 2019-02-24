package com.ifive.ael.vo;

public class ResReportVO {

	private String RBNUM;
	private String RNAME;
	private String ID;
	private int RDVI;
	private String RCONTENT;
	
	@Override
	public String toString() {
		return "ResReportVO [RBNUM=" + RBNUM + ", RNAME=" + RNAME + ", ID=" + ID + ", RDVI=" + RDVI + ", RCONTENT="
				+ RCONTENT + "]";
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
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public int getRDVI() {
		return RDVI;
	}
	public void setRDVI(int rDVI) {
		RDVI = rDVI;
	}
	public String getRCONTENT() {
		return RCONTENT;
	}
	public void setRCONTENT(String rCONTENT) {
		RCONTENT = rCONTENT;
	}
	public ResReportVO(String rBNUM, String rNAME, String iD, int rDVI, String rCONTENT) {
		super();
		RBNUM = rBNUM;
		RNAME = rNAME;
		ID = iD;
		RDVI = rDVI;
		RCONTENT = rCONTENT;
	}
	public ResReportVO() {
		super();
		// TODO 자동 생성된 생성자 스텁
	}
	
	
}
