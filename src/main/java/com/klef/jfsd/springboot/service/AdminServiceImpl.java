package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Employee;
import com.klef.jfsd.springboot.model.Leave;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.EmployeeRepository;
import com.klef.jfsd.springboot.repository.LeaveRepository;

@Service
public class AdminServiceImpl implements AdminService
{
    @Autowired
	private AdminRepository adminRepository;
    
    @Autowired
    private EmployeeRepository employeeRepository;
    
    @Autowired
    private LeaveRepository leaveRepository;
	
	@Override
	public List<Employee> viewallemps() {
		
		return employeeRepository.findAll();
	}

	@Override
	public String deleteemp(int eid) 
	{
		Optional<Employee> obj = employeeRepository.findById(eid);
	    
	    String msg = null;
	    
	    if(obj.isPresent())
	    {
	      Employee emp = obj.get();
	      employeeRepository.delete(emp);
	      msg = "Employee Deleted Successfully";
	    }
	    else
	    {
	      msg = "Employee Not Found";
	    }
	    
	    return msg;
	}

	@Override
	public Employee viewempbyid(int eid) {
       
		Optional<Employee> obj = employeeRepository.findById(eid);    
	    
	    if(obj.isPresent())
	    {
	      Employee emp = obj.get();
	      return emp;
	    }
	    else
	    {
	      return null;
	    }
	}
	
	

	@Override
	public Admin checkadminlogin(String auname, String apwd) {
		
		return  adminRepository.checkadminlogin(auname, apwd);
	}

	@Override
	  public List<Leave> viewallleaves() {
	   
	    return leaveRepository.findAll();
	    
	  }

}
