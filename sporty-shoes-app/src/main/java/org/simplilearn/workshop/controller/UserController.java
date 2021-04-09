package org.simplilearn.workshop.controller;

import org.simplilearn.workshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
@Controller
@SessionAttributes("name")
public class UserController {
	 @Autowired
    UserService service;
	    @RequestMapping(value="/users", method = RequestMethod.GET)
	    public String showUserPage(ModelMap model){
	        return "searchusers";
	    }
	 @RequestMapping(value="/users", method = RequestMethod.POST)
	 public String showWelcomeUserPage(ModelMap model, @RequestParam String fname,@RequestParam String lname,@RequestParam String email){

	        boolean isValidUser = service.validateUser(fname,lname,email);

	        if (!isValidUser) {
	            model.put("errorMessage", "No Users");
	            return "welcome";
	        }

	        model.put("fname", fname);
	        model.put("lname", lname);
	        model.put("email", email);


	        return "listsearchedusers";
	    }
	 

}


