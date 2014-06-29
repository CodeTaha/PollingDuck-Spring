/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controllers;

import DAO.Poll_Tbl_pkg.Poll_Tbl;
import DAO.Poll_Tbl_pkg.Poll_TblJDBCTemplate;
import DAO.Poll_Tbl_pkg.Qtn;
import DAO.Poll_Tbl_pkg.Qtn_Mapper;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
     /*@RequestMapping(value = "/submitPollData", method = RequestMethod.POST)
   public void submitPollData(@ModelAttribute Poll_Tbl poll_tbl, ModelMap model,HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException {
       //ApplicationContext context =new ClassPathXmlApplicationContext("Beans.xml");
        Poll_TblJDBCTemplate poll_tblJDBCTemplate=new Poll_TblJDBCTemplate(); 
        //Poll_TblJDBCTemplate poll_tblJDBCTemplate=new Poll_TblJDBCTemplate();//(Poll_TblJDBCTemplate)context.getBean("Poll_TblJDBCTemplate");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String detail[]= gson.fromJson(request.getParameter("detailJSON"), String[].class);
        String qtn[][]= gson.fromJson(request.getParameter("qtnJSON"), String[][].class);
        String ans[][]= gson.fromJson(request.getParameter("ansJSON"), String[][].class);
        String poll_link="pollLink";
        int reward=5;
        String poll_type="free";
        boolean rslt=poll_tblJDBCTemplate.create(Integer.parseInt(detail[0]),detail[3],detail[1],detail[2],request.getParameter("qtnJSON"),request.getParameter("ansJSON"),poll_link,reward,poll_type);
        // model.addAttribute("name", poll_tbl.getName());
	   out.println(rslt);
      
   }*/
    
   @RequestMapping(value = "/viewPollsData", method = RequestMethod.POST)
   public void viewPollsData(HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException {
       if(checklogin(request))
       {
       Poll_TblJDBCTemplate poll_tblJDBCTemplate=new Poll_TblJDBCTemplate(); 
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        List<Poll_Tbl> poll_tbl=poll_tblJDBCTemplate.listPolls();
         ArrayList alist=new ArrayList();
         for(Poll_Tbl record:poll_tbl)
         {
//            
            alist.add(record);
         }
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
   public String solvePoll(ModelMap model, HttpServletRequest request) {
       int pid= Integer.parseInt(request.getParameter("pid"));
       String poll_tbl=request.getParameter("obj");
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
}
