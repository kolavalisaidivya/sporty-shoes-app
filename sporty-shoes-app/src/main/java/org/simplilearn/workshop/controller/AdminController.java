package org.simplilearn.workshop.controller;
import org.simplilearn.workshop.service.AdminService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
@Controller
@SessionAttributes("name")
public class AdminController {
	 @Autowired
    AdminService service;
	    @RequestMapping(value="/changepassword", method = RequestMethod.GET)
	    public String showadminPage(ModelMap model){
	        return "changepassword";
	    }
	 @RequestMapping(value="/changepassword", method = RequestMethod.POST)
	 public String showWelcomePage(ModelMap model, @RequestParam String name,@RequestParam String cpassword, @RequestParam String password){

	        boolean isValidUser = service.validateUser(name, cpassword,password);

	        if (!isValidUser) {
	            model.put("errorMessage", "Invalid Credentials");
	        }

	        model.put("name", name);
	        model.put("cpassword", cpassword);
	        model.put("password", password);

	        return "adminlogin";
	    }
	 

}

