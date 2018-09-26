package com.forhadmethun.simplesearchapplication;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class ViewController {
    @RequestMapping(value = {"/"},method = RequestMethod.GET)
    public ModelAndView getDashboard(){
        return  new ModelAndView("welcome");
    }
}
