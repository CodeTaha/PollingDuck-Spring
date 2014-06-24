/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controllers;

import User_Manager.User_Detail;
import User_Manager.User_TblJDBCTemplate;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Taha
 */
public class Parent_Controller {
    protected final Gson gson=new Gson();
    protected User_Detail user_detail;
    protected boolean loggedin=false;
    protected int uid=0;
    protected String handle="";
    
    public boolean checklogin(HttpServletRequest request) throws IOException
   {
       try{System.out.println("In checklogin()");
       
       Cookie[] cookies = request.getCookies();
   
       if(user_detail==null)
       {System.out.println("In checklogin() if");
        for(int i = 0; i < cookies.length; i++) { 
            Cookie cookie1 = cookies[i];
            if(cookie1.getName().equals("handle"))
            {
                handle=cookie1.getValue();
                loggedin = true;
            }
            else if(cookie1.getName().equals("uid"))
            {
                uid=Integer.parseInt(cookie1.getValue());
                loggedin = true;
            }
            }
        }
       else
       {System.out.println("In checklogin() else");
           handle=user_detail.getHandle();
           uid=user_detail.getUid();
           loggedin=true;
       }
               
       return loggedin;
       }
       catch(Exception e)
       {
           System.out.println("In checklogin() error occured is"+e);
           return false;
       }
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.POST)
   public void logins(HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException {
       User_Manager.User_TblJDBCTemplate user=new User_TblJDBCTemplate();
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username= request.getParameter("username");
        String password= request.getParameter("password");
        user_detail=user.authenticate(username,password);
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
        response.sendRedirect("dashboard");
       
        }
        else   
        {
            System.out.println("login error");
            response.sendRedirect("index");
           
        }
   }
   
   public Cookie set_Cookie(String name, String value, int ttl)
    {
        Cookie cookie = new Cookie(name, value);
            cookie.setMaxAge(ttl*60*60);
            return cookie;
            //response.addCookie(cookie); 
    }
}
