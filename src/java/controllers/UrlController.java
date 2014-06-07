/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controllers;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/* This class handles urls and shows an example of page redirection from index page to static page*/

/**
 *
 * @author abc
 */
@Controller
public class UrlController {
    @RequestMapping(value = "/createPoll", method = RequestMethod.GET)
   public String createPoll() {
	   return "createPoll";
   }
   @RequestMapping(value = "/viewPolls", method = RequestMethod.GET)
   public String viewPolls() {
	   return "viewPolls";
   }
   @RequestMapping(value = "/solvePoll", method = RequestMethod.GET)
   public String solvePoll(ModelMap model, HttpServletRequest request) {
        model.addAttribute("pid", "2");
	   return "solvePoll";
   }
   
    @RequestMapping(value = "/index", method = RequestMethod.GET)
   public String index() {
	   return "index";
   }
  
   @RequestMapping(value = "/redirect", method = RequestMethod.GET)
   public String redirect() {
     
      return "redirect:finalPage";
   }
   
   @RequestMapping(value = "/finalPage", method = RequestMethod.GET)
   public String finalPage() {
     
      return "final";
   }
   
   @RequestMapping(value = "/staticPage", method = RequestMethod.GET)
   public String redirect2() {
     return "redirect:/pages/final.html";
   }
}
