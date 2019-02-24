package com.ifive.ael.vo;

import java.sql.Date;

public class QnAVO {
	
	private int QNUM;
	private String ID;
	private String QTITLE;
	private String QCONTENT;
	private int QRE;
	private String QPASS;
	private Date QDATE;
	private int QDIVI;
	public int getQDIVI() {
		return QDIVI;
	}
	public void setQDIVI(int qDIVI) {
		QDIVI = qDIVI;
	}
	public int getQNUM() {
		return QNUM;
	}
	public void setQNUM(int qNUM) {
		QNUM = qNUM;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getQTITLE() {
		return QTITLE;
	}
	public void setQTITLE(String qTITLE) {
		QTITLE = qTITLE;
	}
	public String getQCONTENT() {
		return QCONTENT;
	}
	public void setQCONTENT(String qCONTENT) {
		QCONTENT = qCONTENT;
	}
	public int getQRE() {
		return QRE;
	}
	public void setQRE(int qRE) {
		QRE = qRE;
	}
	public String getQPASS() {
		return QPASS;
	}
	public void setQPASS(String qPASS) {
		QPASS = qPASS;
	}
	public Date getQDATE() {
		return QDATE;
	}
	public void setQDATE(Date qDATE) {
		QDATE = qDATE;
	}
	
	public QnAVO(int qNUM, String iD, String qTITLE, String qCONTENT, int qRE, String qPASS, Date qDATE, int qDIVI) {
		super();
		QNUM = qNUM;
		ID = iD;
		QTITLE = qTITLE;
		QCONTENT = qCONTENT;
		QRE = qRE;
		QPASS = qPASS;
		QDATE = qDATE;
		QDIVI = qDIVI;
	}
	public QnAVO() {
		super();
	}
	
}