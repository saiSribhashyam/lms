package com.klef.jfsd.springboot.service;

import java.util.List;


import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Employee;
import com.klef.jfsd.springboot.model.Leave;

public interface AdminService 
{
	public List<Employee> viewallemps();
	public String deleteemp(int eid);
	public Employee viewempbyid(int eid);
	public Admin checkadminlogin(String auname, String apwd);
	public List<Leave> viewallleaves();

}
