/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controllers;

import Category_Manager.Category;
import Category_Manager.Category_TblJDBCTemplate;
import DAO.Poll_Tbl_pkg.Poll_Tbl;
import DAO.Poll_Tbl_pkg.Poll_TblJDBCTemplate;
import DAO.Poll_Tbl_pkg.Qtn;
import DAO.Poll_Tbl_pkg.Qtn_Mapper;
import User_Manager.User_TblJDBCTemplate;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.connectivity;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/* This class handles urls and shows an example of page redirection from index page to static page*/

/**
 *
 * @author abc
 */
@Controller
public class AjaxController extends Parent_Controller{
   
    @RequestMapping(value = "/submitPollData", method = RequestMethod.POST)
   public void submitPollData(@ModelAttribute Poll_Tbl poll_tbl, ModelMap model,HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException {
      System.out.println("in AjaxController > submitPollData");
        Poll_TblJDBCTemplate poll_tblJDBCTemplate=new Poll_TblJDBCTemplate(); 
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String detail[]= gson.fromJson(request.getParameter("detailJSON"), String[].class);
        String qtn[][]= gson.fromJson(request.getParameter("qtnJSON"), String[][].class);
        List <Qtn> qtn_list = new ArrayList<>();
       // String ans[][]= gson.fromJson(request.getParameter("ansJSON"), String[][].class);
        System.out.println("Qtn JSON="+qtn[0][4]);
        Qtn_Mapper qtn_mapper=new Qtn_Mapper();
        ArrayList alist=new ArrayList();
        for (String[] qtn1 : qtn) {
            Qtn qtn_obj = qtn_mapper.mapRow(qtn1);
            //alist.add(qtn_obj);
            qtn_list.add(qtn_obj);
        }
        String qtn_JSON=gson.toJson(qtn_list);
        System.out.println("qtn JSON="+qtn_JSON);
        String poll_link="pollLink";
        int reward=5;
        String poll_type="free";
        boolean rslt=poll_tblJDBCTemplate.create(Integer.parseInt(detail[0]),detail[3],detail[1],detail[2],qtn_JSON,"",poll_link,reward,poll_type);
      
	 out.println(rslt);
      
   }
     
   @RequestMapping(value = "/viewPollsData", method = RequestMethod.POST)
   public void viewPollsData(HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException {
       if(checklogin(request))
       {
       Poll_TblJDBCTemplate poll_tblJDBCTemplate=new Poll_TblJDBCTemplate(); 
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        List<Poll_Tbl> poll_tbl=poll_tblJDBCTemplate.listPolls();
         
         //String pollJSON=gson.toJson(alist);
         String pollJSON=gson.toJson(poll_tbl);
         System.out.println("view Polls PollJSON="+pollJSON);
         out.println(pollJSON);
        }
       else
       {
           response.sendRedirect("index");
       }
   }
   @RequestMapping(value = "/solvePoll", method = RequestMethod.POST)
   public String solvePoll(ModelMap model, HttpServletRequest request) throws IOException, SQLException {
    
       int pid= Integer.parseInt(request.getParameter("pid"));
       String poll_tbl=request.getParameter("obj");
       ApplicationContext context =new ClassPathXmlApplicationContext("Beans.xml");
        connectivity conn=(connectivity)context.getBean("connectivity");
        boolean cansolve=conn.solvable(pid,uid);
        model.addAttribute("pid", pid);
        model.addAttribute("obj", poll_tbl);
	   return "solvePoll";
  
   }
   
   @RequestMapping(value = "/submitPollAns", method = RequestMethod.POST)
   public void submitPollAns(HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException {
       
        String finalJSON=request.getParameter("finalJSON");
        Poll_TblJDBCTemplate poll_tblJDBCTemplate=new Poll_TblJDBCTemplate(); 
        boolean rslt= poll_tblJDBCTemplate.submitPoll(finalJSON);
        
	response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();  
        out.println(rslt);
   }
   
    @RequestMapping(value = "/SignUpReg", method = RequestMethod.POST)
   public void SignUpReg(@ModelAttribute Poll_Tbl poll_tbl, ModelMap model,HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException {
      System.out.println("in AjaxController > SignUpReg");
        User_TblJDBCTemplate user_tblJDBCTemplate=new User_TblJDBCTemplate(); 
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //handle:handle,email:email,country:country,state:state
        //city:city,zip:zip,religion:religion,sex:sex,dob:dob,phone:phone,category:category 
        String handle=request.getParameter("handle");
        String name=request.getParameter("name");
        String email= request.getParameter("email");
        String country= request.getParameter("country");
        String state= request.getParameter("state");
        String city= request.getParameter("city");
        String zip= request.getParameter("zip");
        String religion= request.getParameter("religion");
        String sex= request.getParameter("sex");
        String dob= request.getParameter("dob");
        String phone= request.getParameter("phone");
        String profile_pic= request.getParameter("profile_pic");
        String fb= request.getParameter("fb");
        int category[]=gson.fromJson(request.getParameter("category"), int[].class); ;
        //System.out.println("cat list= "+Arrays.toString(category));
        
       
       
     boolean rslt=user_tblJDBCTemplate.createUser(handle,name,email,country,state,city,zip,religion,sex,dob,phone,profile_pic,category,fb);
      
	 out.println(rslt);
      
   }
   
   @RequestMapping(value = "/loginFB", method = RequestMethod.POST)
   private void loginFB(HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException {
       User_Manager.User_TblJDBCTemplate user=new User_TblJDBCTemplate();
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username= request.getParameter("username");
        String password= request.getParameter("password");// its actually e-mail
        user_detail=user.authenticate(username,password,2);
        if(user_detail!=null)
        {
        
        System.out.println("Adding cookie handle"+user_detail.getHandle());
        Cookie cookie=set_Cookie("handle",user_detail.getHandle(),24);
        response.addCookie(cookie); 
        System.out.println("Adding cookie uid"+user_detail.getUid());
        cookie=set_Cookie("uid",String.valueOf(user_detail.getUid()),24);
        response.addCookie(cookie);
        //System.out.print("obj json="+gson.toJson(user_detail));
        //cookie=set_Cookie("",gson.toJson(user_detail),24);
        //response.addCookie(cookie);
        //response.sendRedirect("dashboard");
       out.println(1);
        }
        else   
        {
            System.out.println("Calling Signup");
            Category_TblJDBCTemplate cat=new Category_TblJDBCTemplate();
            List<Category> category=cat.Category_list();
            String cat_json=gson.toJson(category);
//            System.out.println("cat list "+cat_json);
//            model.addAttribute("cat_list", cat_json);
            out.println(cat_json);
        }
   }
   
}
