package com.klef.jfsd.springboot.model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="leave_table")
public class Leave {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="req_id")
	private int id;
	@Column(name="emp_id",nullable=false)
	private int empid;
	public int getEmpid() {
		return empid;
	}
	public void setEmpid(int empid) {
		this.empid = empid;
	}
	@Column(name="lev_type",nullable=false,length = 20)
	private String leavetype;
	@Column(name="start_dt",nullable=false,length = 20)
	   private String startdate;
	@Column(name="end_dt",nullable=false,length = 20)
	   private String enddate;
	@Column(name="reason",nullable=false,length=100)
	private String reason_for_leave;
	
	@Column(name="approved",nullable=false)
	private boolean isapproved;
	
	@Column(name="mgr_feedback")
	private String mgr_feedback;
	public String getMgr_feedback() {
		return mgr_feedback;
	}
	public void setMgr_feedback(String mgr_feedback) {
		this.mgr_feedback = mgr_feedback;
	}
	public boolean getIsapproved() {
		return isapproved;
	}
	public void setIsapproved(boolean isapproved) {
		this.isapproved = isapproved;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLeavetype() {
		return leavetype;
	}
	public void setLeavetype(String leavetype) {
		this.leavetype = leavetype;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getReason_for_leave() {
		return reason_for_leave;
	}
	public void setReason_for_leave(String reason_for_leave) {
		this.reason_for_leave = reason_for_leave;
	}
//	@Override
//	public String toString() {
//		return "leave"
//	}
}
