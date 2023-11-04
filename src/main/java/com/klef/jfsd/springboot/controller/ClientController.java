package com.klef.jfsd.springboot.controller;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Employee;
import com.klef.jfsd.springboot.model.Leave;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.EmployeeService;
import com.klef.jfsd.springboot.service.LeaveService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ClientController 
{   
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private LeaveService leaveService;
	
	
	@GetMapping("/")
	public String main() 
	{
		
		return "index";
	}
	
	@GetMapping("adminlogin")  // URI & METHOD NAMR CAN BE DIFFERENT 
	public ModelAndView adminlogin() 
	{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		
		return mv;
		
	}
	@GetMapping("checkStatus")  // URI & METHOD NAMR CAN BE DIFFERENT 
	public ModelAndView checkStatus() 
	{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("checkStatus");
		
		return mv;
		
	}
	@GetMapping("contactadmin")
	public ModelAndView contactadmin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("contactadmin");
		
		return mv;
	}
	
	@PostMapping("checkadminlogin")
	public ModelAndView checkadminlogin(HttpServletRequest request) 
	{
		 ModelAndView mv = new ModelAndView();
	
		String auname = request.getParameter("auname");
	    String apwd = request.getParameter("apwd");
	     
	    Admin admin = adminService.checkadminlogin(auname, apwd);
	    
	    if(admin!=null)
	    {
	    	
	    	mv.setViewName("adminhome");
	      
	    }
	    else
	    {
	      mv.setViewName("adminlogin");
	      mv.addObject("message","Login Failed");
	    }
		
	    return mv;
	}
	
	
	
	
	@GetMapping("emplogin")  // URI & METHOD NAMR CAN BE DIFFERENT 
	public ModelAndView emplogin() 
	{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("emplogin");
		
		return mv;
		
	}
	
	
	@PostMapping("checkemplogin")
	public ModelAndView checkemplogin(HttpServletRequest request) 
	{
		 ModelAndView mv = new ModelAndView();
	
		String email = request.getParameter("email");
	     String pwd = request.getParameter("pwd");
	     
	    Employee emp =  employeeService.checkemplogin(email, pwd);
	    
	    if(emp!=null)
	    {
	    	//session
	    	
	    	HttpSession session = request.getSession();
	    	
	    	session.setAttribute("eid", emp.getId()); // eid is a session variable
	    	session.setAttribute("ename", emp.getName()); // ename is a session variable
	    	
	    	//session
	    	
	    	mv.setViewName("emphome");
	      
	    }
	    else
	    {
	      mv.setViewName("emplogin");
	      mv.addObject("message","Login Failed");
	    }
		
	    return mv;
	}
	
	
	@GetMapping("empreg")  // URI & METHOD NAMR CAN BE DIFFERENT 
	public ModelAndView empregistration() 
	{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("empreg");
		
		return mv;
		
	}
	@PostMapping("insertleave")
	public ModelAndView insertAction(HttpServletRequest request)
	{
		String msg = null;
		ModelAndView mv = new ModelAndView();
		try{
			//String name=request.getParameter("name");
			String type=request.getParameter("leaveType");
			String stdate=request.getParameter("startDate");
			String endate=request.getParameter("endDate");
			String reason=request.getParameter("reason");
			HttpSession session = request.getSession();
			
			//Employee e = new Employee();
			//HttpSession session1 = request.getSession();
	    	
	    	int eid = (int) session.getAttribute("eid"); // eid is a session variable
			Leave leave=new Leave();
			leave.setEmpid(eid);
			leave.setLeavetype(type);
			leave.setStartdate(stdate);
			leave.setEnddate(endate);
			leave.setReason_for_leave(reason);
			leave.setIsapproved(false);
			msg=leaveService.addLeave(leave);
			mv.setViewName("displayerror");
			mv.addObject("message",msg);
			
		}
		catch (Exception e) 
		{
			msg = e.getMessage();
			mv.setViewName("displayerror");
			mv.addObject("message",msg);
		}
	   
		return mv;
	}
	
	
	@PostMapping("insertemp")
	public ModelAndView insertaction(HttpServletRequest request) 
	{
		String msg = null;
		ModelAndView mv = new ModelAndView();
		
		try 
		{
			String name = request.getParameter("name");
		    String gender = request.getParameter("gender");
		    String dob = request.getParameter("dob");
		    String dept = request.getParameter("dept");
		    String sal = request.getParameter("salary");
		    double salary = Double.parseDouble(sal);
		    String email = request.getParameter("email");
		    String pwd = request.getParameter("pwd");
		    String location = request.getParameter("location");
		    String contact = request.getParameter("contact");
			
		    
		    Employee emp = new Employee();
		    
		      emp.setName(name);
		      emp.setGender(gender);
		      emp.setDateofbirth(dob);
		      emp.setDepartment(dept);
		      emp.setSalary(salary);
		      emp.setEmail(email);
		      emp.setPassword(pwd);
		      emp.setLocation(location);
		      emp.setContact(contact);
		      emp.setActive(true);
		    
		      msg = employeeService.addemp(emp);
		      mv.setViewName("displaymsg");
			  mv.addObject("message",msg);
		        
		} 
		catch (Exception e) 
		{
			msg = e.getMessage();
			mv.setViewName("displayerror");
			mv.addObject("message",msg);
		}
	   
		return mv;
	    
	}
	
	@GetMapping("viewallemps")
	public ModelAndView viewemps()
	{
		List<Employee> emplist = adminService.viewallemps();
		
		ModelAndView mv = new  ModelAndView("viewallemps");
		mv.addObject("empdata",emplist);
		
		
		return mv;
		
	}
	
	
	@GetMapping("view")
	  public ModelAndView viewempdemo(@RequestParam("id") int eid)
	  {
	    Employee emp = adminService.viewempbyid(eid);
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("viewempbyid");
	    mv.addObject("emp", emp);
	    return mv;
	  }
	  
	  @GetMapping("delete/{id}")
	  public String deleteaction(@PathVariable("id") int eid)
	  {
	    adminService.deleteemp(eid);
	    return "redirect:/deleteemp";
	  }
	

	  @GetMapping("deleteemp")
	  public ModelAndView deleteemployeedemo()
	  {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("deleteemp"); //deleteemp is jsp file name
	    List<Employee> emplist =  adminService.viewallemps();
	    mv.addObject("empdata", emplist);
	    return mv;
	  }
	  
	  
	    @GetMapping("adminhome")  // URI & METHOD NAMR CAN BE DIFFERENT 
		public ModelAndView adminhome() 
		{
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("adminhome");
			
			return mv;
			
		}
	    @GetMapping("applyleave")
	    public ModelAndView applyleave()

	    {
	    	ModelAndView mv = new ModelAndView();
			mv.setViewName("applyleave");
			
			return mv;
	    }
	    
	    
	    @GetMapping("emphome")  // URI & METHOD NAMR CAN BE DIFFERENT 
		public ModelAndView emphome(HttpServletRequest request) 
		{
	    	
	    	HttpSession session = request.getSession();
	    	
	    	int eid = (int) session.getAttribute("eid"); // eid is a session variable
	    	String ename = (String) session.getAttribute("ename");
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("emphome");
			
			mv.addObject("eid",eid);
			mv.addObject("ename",ename);
			
			return mv;
			
		}
	    
	    
	    @GetMapping("updateprofile")
	    public ModelAndView updateemp(HttpServletRequest request)
	    {
	      ModelAndView mv = new ModelAndView();
	      
	      HttpSession session = request.getSession();
	      
	      mv.setViewName("updateprofile");
	      
	      mv.addObject("eid", session.getAttribute("eid"));
	      mv.addObject("ename", session.getAttribute("ename"));
	      
	      int id = (int) session.getAttribute("eid");
	      
	      Employee emp = employeeService.viewemployeebyid(id);
	      
	      mv.addObject("emp", emp);
	      
	      return mv;
	    }
	    
	    @PostMapping("update")
	    public ModelAndView updateaction(HttpServletRequest request)
	    {
	      String msg = null;
	      
	      ModelAndView mv = new ModelAndView();
	      
	      HttpSession session = request.getSession();
	      
	      mv.addObject("eid", session.getAttribute("eid"));
	      mv.addObject("ename", session.getAttribute("ename"));
	      
	      int id = (int) session.getAttribute("eid");
	      
	     try
	     {
	       String name = request.getParameter("name");
	       String dob = request.getParameter("dob");
	       String dept = request.getParameter("dept");
	       String sal = request.getParameter("salary");
	       double salary = Double.parseDouble(sal);
	       String email = request.getParameter("email");
	       String pwd = request.getParameter("pwd");
	       String location = request.getParameter("location");
	       String contact = request.getParameter("contact");
	       
	       Employee emp = new Employee();
	        emp.setId(id);
	        emp.setName(name);
	        emp.setDateofbirth(dob);
	        emp.setDepartment(dept);
	        emp.setSalary(salary);
	        emp.setEmail(email);
	        emp.setPassword(pwd);
	        emp.setLocation(location);
	        emp.setContact(contact);
	        
	        
	        msg = employeeService.updateemployee(emp);
	        
	        mv.setViewName("emplogin");
	        mv.addObject("message",msg);
	       
	     }
	     catch(Exception e)
	     {
	       msg = e.getMessage();
	       
	       mv.setViewName("updateerror");
	        mv.addObject("message",msg);
	     }
	      
	     
	      return mv;

	    }
	    
	    
	    @GetMapping("viewallleaves")  // URI & METHOD NAMR CAN BE DIFFERENT 
	    public ModelAndView viewallleaves() 
	    {
	      List<Leave> list = adminService.viewallleaves();
	      
	      ModelAndView mv = new ModelAndView();
	      mv.setViewName("viewallleaves");
	      mv.addObject("list", list);
	      
	      return mv;
	      
	    }
	    @PostMapping("updatestatus")
	    public String updateStatus(@RequestParam("id") Integer id, @RequestParam("status") boolean status) {
	        leaveService.updateStatus(id, status);
	        return "redirect:/viewallleaves"; // Redirect to your leave listing page
	    }
	    
	    @PostMapping("mgrFeedback")
	    public String mgrFeedback(@RequestParam("id") Integer id, @RequestParam("reason") String reason) {
	    	leaveService.sendFeedback(id, reason);
	    	return "redirect:/viewallleaves";
	    }
	    
}
