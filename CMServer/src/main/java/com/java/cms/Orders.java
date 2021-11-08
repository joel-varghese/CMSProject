package com.java.cms;


import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;

@Entity
public class Orders {

	@Id
	private int ordId;
	private int cusId;
	private int venId;
	private String walSource;
	private Date ordDate;
	private int ordQty;
	private double ordBillamount;
	private String ordStatus;
	private String ordComments;
	public int getOrdId() {
		return ordId;
	}
	public void setOrdId(int ordId) {
		this.ordId = ordId;
	}
	public int getCusId() {
		return cusId;
	}
	public void setCusId(int cusId) {
		this.cusId = cusId;
	}
	public int getVenId() {
		return venId;
	}
	public void setVenId(int venId) {
		this.venId = venId;
	}
	public String getWalSource() {
		return walSource;
	}
	public void setWalSource(String walSource) {
		this.walSource = walSource;
	}
	public Date getOrdDate() {
		return ordDate;
	}
	public void setOrdDate(Date ordDate) {
		this.ordDate = ordDate;
	}
	
	public int getOrdQty() {
		return ordQty;
	}
	public void setOrdQty(int ordQty) {
		this.ordQty = ordQty;
	}
	public double getOrdBillamount() {
		return ordBillamount;
	}
	public void setOrdBillamount(double ordBillamount) {
		this.ordBillamount = ordBillamount;
	}
	//@Enumerated(EnumType.STRING)
	public String getOrdStatus() {
		return ordStatus;
	}
	public void setOrdStatus(String ordStatus) {
		this.ordStatus = ordStatus;
	}
	public String getOrdComments() {
		return ordComments;
	}
	public void setOrdComments(String ordComments) {
		this.ordComments = ordComments;
	}
	
	
}
