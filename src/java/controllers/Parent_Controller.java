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
import java.sql.SQLException;
import java.util.Arrays;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;

/**
 *
 * @author Taha
 */
@Controller
public class Parent_Controller {
    protected final Gson gson=new Gson();
    protected User_Detail user_detail;
    protected boolean loggedin=false;
    protected int uid=0;
    protected String handle="";
    protected int cat_list[];
    
    public boolean checklogin(HttpServletRequest request) throws IOException, SQLException
   {
       try{System.out.println("In checklogin()");
       
       Cookie[] cookies = request.getCookies();
   
       if(user_detail==null)
       {
           System.out.println("In checklogin() if");
           for (Cookie cookie1 : cookies) 
           {
            switch (cookie1.getName()) 
            {
               case "handle":
                    System.out.println("Got Handle cookie");
                   handle=cookie1.getValue();
                   loggedin = true;
                   break;
               case "uid":
                   System.out.println("Got uid cookie");
                   uid=Integer.parseInt(cookie1.getValue());
                   loggedin = true;
                   break;
            }
           }
           User_Manager.User_TblJDBCTemplate user=new User_TblJDBCTemplate();
           cat_list=user.get_category_list_json(uid);
           
        }
       else
       {System.out.println("In checklogin() else");
           handle=user_detail.getHandle();
           uid=user_detail.getUid();
           cat_list=user_detail.getCategory_list_json();
           loggedin=true;
       }
       System.out.println("handle="+handle);
       System.out.println("uid="+uid);
       System.out.println("cat_list="+Arrays.toString(cat_list));
               
       return loggedin;
       }
       catch(NumberFormatException e)
       {
           System.out.println("In checklogin() error occured is "+e);
           return false;
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
