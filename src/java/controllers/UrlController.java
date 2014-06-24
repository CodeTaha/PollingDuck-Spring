/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controllers;

import Category_Manager.Category;
import Category_Manager.Category_TblJDBCTemplate;
import User_Manager.User_Detail;
import User_Manager.User_TblJDBCTemplate;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/* This class handles urls and shows an example of page redirection from index page to static page*/

/**
 *
 * @author abc
 */
@Controller
public class UrlController extends Parent_Controller{
    
    @RequestMapping(value = "", method = RequestMethod.GET)
   public void index1(HttpServletRequest request,HttpServletResponse response) throws IOException {
	   response.sendRedirect("index");
   }
    
    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
   public String dashboard() {
	   return "dashboard";
   }
    @RequestMapping(value = "/createPoll", method = RequestMethod.GET)
   public String createPoll(ModelMap model, HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException {
      if(checklogin(request))
      {// checks for login
        
       Category_TblJDBCTemplate cat=new Category_TblJDBCTemplate();
            List<Category> category=cat.Category_list();
            String cat_json=gson.toJson(category);
            System.out.println("cat list "+cat_json);
            model.addAttribute("cat_list", cat_json);
            return "createPoll";
      }
      else
      {
          response.sendRedirect("index");
          return "index";
      }
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
