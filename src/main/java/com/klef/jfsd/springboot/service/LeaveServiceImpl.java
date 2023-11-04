package com.klef.jfsd.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Leave;
import com.klef.jfsd.springboot.repository.LeaveRepository;

@Service
public class LeaveServiceImpl implements LeaveService{

	@Autowired
	private LeaveRepository leaveRepository;
	
	@Override
	public String addLeave(Leave l) {
		leaveRepository.save(l);
		return "Leave applied";
	}
	public void updateStatus(Integer id, boolean status) {
        Leave leave = leaveRepository.findById(id).orElse(null);
        if (leave != null) {
            leave.setIsapproved(status);
            leaveRepository.save(leave);
        }
    }
	public void sendFeedback(Integer id,String feedback) {
		 Leave leave = leaveRepository.findById(id).orElse(null);
		 if(leave!=null)
		 {
			 leave.setMgr_feedback(feedback);		 
			 leaveRepository.save(leave);
		 }
	}
}
