package com.ifive.ael.vo;

import java.sql.Date;
import java.sql.Time;

public class OrdersVO {
	private String ONUM;
	private String RBNUM;
	private String ID;
	private String ORNAME;
	private int ORPRICE;
	private String OMENU;
	private int OAMOUNT;
	private Date ODATE;
	private Time OTIME;
	private String OSTATUS;
	private String OCHOICE;
	private String OPAY;
	private String OCALL;
	private String OJTOTALADDR;
	private Time OWAIT;
	public OrdersVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrdersVO(String oNUM, String rBNUM, String iD, String oRNAME, int oRPRICE, String oMENU, int oAMOUNT,
			Date oDATE, Time oTIME, String oSTATUS, String oCHOICE, String oPAY, String oCALL, String oJTOTALADDR,
			Time oWAIT) {
		super();
		ONUM = oNUM;
		RBNUM = rBNUM;
		ID = iD;
		ORNAME = oRNAME;
		ORPRICE = oRPRICE;
		OMENU = oMENU;
		OAMOUNT = oAMOUNT;
		ODATE = oDATE;
		OTIME = oTIME;
		OSTATUS = oSTATUS;
		OCHOICE = oCHOICE;
		OPAY = oPAY;
		OCALL = oCALL;
		OJTOTALADDR = oJTOTALADDR;
		OWAIT = oWAIT;
	}
	public String getONUM() {
		return ONUM;
	}
	public void setONUM(String oNUM) {
		ONUM = oNUM;
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
	public String getORNAME() {
		return ORNAME;
	}
	public void setORNAME(String oRNAME) {
		ORNAME = oRNAME;
	}
	public int getORPRICE() {
		return ORPRICE;
	}
	public void setORPRICE(int oRPRICE) {
		ORPRICE = oRPRICE;
	}
	public String getOMENU() {
		return OMENU;
	}
	public void setOMENU(String oMENU) {
		OMENU = oMENU;
	}
	public int getOAMOUNT() {
		return OAMOUNT;
	}
	public void setOAMOUNT(int oAMOUNT) {
		OAMOUNT = oAMOUNT;
	}
	public Date getODATE() {
		return ODATE;
	}
	public void setODATE(Date oDATE) {
		ODATE = oDATE;
	}
	public Time getOTIME() {
		return OTIME;
	}
	public void setOTIME(Time oTIME) {
		OTIME = oTIME;
	}
	public String getOSTATUS() {
		return OSTATUS;
	}
	public void setOSTATUS(String oSTATUS) {
		OSTATUS = oSTATUS;
	}
	public String getOCHOICE() {
		return OCHOICE;
	}
	public void setOCHOICE(String oCHOICE) {
		OCHOICE = oCHOICE;
	}
	public String getOPAY() {
		return OPAY;
	}
	public void setOPAY(String oPAY) {
		OPAY = oPAY;
	}
	public String getOCALL() {
		return OCALL;
	}
	public void setOCALL(String oCALL) {
		OCALL = oCALL;
	}
	public String getOJTOTALADDR() {
		return OJTOTALADDR;
	}
	public void setOJTOTALADDR(String oJTOTALADDR) {
		OJTOTALADDR = oJTOTALADDR;
	}
	public Time getOWAIT() {
		return OWAIT;
	}
	public void setOWAIT(Time oWAIT) {
		OWAIT = oWAIT;
	}
	@Override
	public String toString() {
		return "OrdersVO [ONUM=" + ONUM + ", RBNUM=" + RBNUM + ", ID=" + ID + ", ORNAME=" + ORNAME + ", ORPRICE="
				+ ORPRICE + ", OMENU=" + OMENU + ", OAMOUNT=" + OAMOUNT + ", ODATE=" + ODATE + ", OTIME=" + OTIME
				+ ", OSTATUS=" + OSTATUS + ", OCHOICE=" + OCHOICE + ", OPAY=" + OPAY + ", OCALL=" + OCALL
				+ ", OJTOTALADDR=" + OJTOTALADDR + ", OWAIT=" + OWAIT + "]";
	}
	
	
	
	
}
