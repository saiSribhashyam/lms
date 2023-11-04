package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Leave;

public interface LeaveService {

	String addLeave(Leave l);
	void updateStatus(Integer id, boolean status);
	void sendFeedback(Integer id,String feedback);

}
