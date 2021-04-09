package org.simplilearn.workshop.controller;

import org.simplilearn.workshop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("name")
public class ProductController {
	 @Autowired
    ProductService service;
	    @RequestMapping(value="/products", method = RequestMethod.GET)
	    public String showProductPage(ModelMap model){
	        return "products";
	    }
	 @RequestMapping(value="/products", method = RequestMethod.POST)
	 public String showProduct(ModelMap model,@RequestParam String date,@RequestParam String category,@RequestParam int userid){

	        boolean isValidProduct = service.validateProduct(date,category,userid);

	        if (!isValidProduct) {
	            model.put("errorMessage", "No Products");
	            return "welcome";
	        }
	        model.put("date", date);
	        model.put("category", category);
	        model.put("userid", userid);


	        return "listproducts";
	    }
	 

}


