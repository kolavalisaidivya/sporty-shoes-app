package org.simplilearn.workshop.controller;

import org.simplilearn.workshop.service.AddProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
@Controller
@SessionAttributes("name")
public class AddProductController {
	@Autowired
    AddProductService service;
	@RequestMapping(value="/addproduct", method = RequestMethod.GET)
    public String showAddProductPage(ModelMap model){
        return "addproductform";
 }
 @RequestMapping(value="/addproduct", method = RequestMethod.POST)
 public String showAddProduct(ModelMap model,@RequestParam String pname,@RequestParam int pcost,@RequestParam String date,@RequestParam String category){

        boolean isaddProduct = service.addProduct(pname,pcost,date,category);

        if (!isaddProduct) {
            model.put("errorMessage", "No Products");
            return "welcome";
        }
        model.put("pname", pname);
        model.put("pcost", pcost);

        model.put("date", date);
model.put("category", category)	 ;



        return "addproduct";
    }
}
