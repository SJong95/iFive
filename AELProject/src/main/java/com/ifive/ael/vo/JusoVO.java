package com.ifive.ael.vo;

public class JusoVO {
	private String ID;
	private String JPOSTCODE;
	private String JROADADDR;
	private String JIBUNADDRESS;
	private String JEXTRAADDR;
	private String JDETAILADDR;
	private String JTOTALADDR;
	private String JBEST;
	
	public String getJBEST() {
		return JBEST;
	}

	public void setJBEST(String jBEST) {
		JBEST = jBEST;
	}

	public JusoVO() {
		super();
	}
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getJPOSTCODE() {
		return JPOSTCODE;
	}
	public void setJPOSTCODE(String jPOSTCODE) {
		JPOSTCODE = jPOSTCODE;
	}
	public String getJROADADDR() {
		return JROADADDR;
	}
	public void setJROADADDR(String jROADADDR) {
		JROADADDR = jROADADDR;
	}
	public String getJIBUNADDRESS() {
		return JIBUNADDRESS;
	}
	public void setJIBUNADDRESS(String jIBUNADDRESS) {
		JIBUNADDRESS = jIBUNADDRESS;
	}
	public String getJEXTRAADDR() {
		return JEXTRAADDR;
	}
	public void setJEXTRAADDR(String jEXTRAADDR) {
		JEXTRAADDR = jEXTRAADDR;
	}
	public String getJDETAILADDR() {
		return JDETAILADDR;
	}
	public void setJTOTALADDR() {
		JTOTALADDR = JROADADDR+JEXTRAADDR+" "+JDETAILADDR;
	}
	public void setJDETAILADDR(String jDETAILADDR) {
		JDETAILADDR = jDETAILADDR;
	}
	public String getJTOTALADDR() {
		return JTOTALADDR;
	}
	public void setJTOTALADDR(String jTOTALADDR) {
		JTOTALADDR = jTOTALADDR;
	}

	public JusoVO(String iD, String jPOSTCODE, String jROADADDR, String jIBUNADDRESS, String jEXTRAADDR,
			String jDETAILADDR, String jTOTALADDR, String jBEST) {
		super();
		ID = iD;
		JPOSTCODE = jPOSTCODE;
		JROADADDR = jROADADDR;
		JIBUNADDRESS = jIBUNADDRESS;
		JEXTRAADDR = jEXTRAADDR;
		JDETAILADDR = jDETAILADDR;
		JTOTALADDR = jTOTALADDR;
		JBEST = jBEST;
	}

	@Override
	public String toString() {
		return "JusoVO [ID=" + ID + ", JPOSTCODE=" + JPOSTCODE + ", JROADADDR=" + JROADADDR + ", JIBUNADDRESS="
				+ JIBUNADDRESS + ", JEXTRAADDR=" + JEXTRAADDR + ", JDETAILADDR=" + JDETAILADDR + ", JTOTALADDR="
				+ JTOTALADDR + ", JBEST=" + JBEST + "]";
	}
	
	
	
	
}
