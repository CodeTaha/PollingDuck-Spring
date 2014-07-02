/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package User_Manager;

import com.google.gson.Gson;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.sql.DataSource;
import model.connectivity;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author Taha
 */
public class User_TblJDBCTemplate {
    private final DataSource dataSource;
   private final JdbcTemplate jdbcTemplateObject;
   Gson gson=new Gson();
   String SQL="";
   connectivity conn=null;
    public User_TblJDBCTemplate() throws SQLException
    {
    ApplicationContext context =new ClassPathXmlApplicationContext("Beans.xml");
     conn=(connectivity)context.getBean("connectivity");
      
      this.dataSource=conn.getDataSource();
      this.jdbcTemplateObject = new JdbcTemplate(dataSource);
      
    }

    public User_Detail authenticate(String username, String password, int loginType) {
        //loginType can be 
        //local=1
        //fb=2
        //twitter=3
        // google=4
        switch(loginType)
        {
            case 1: {
                        SQL =   "select A.uid,B.handle,C.category_list_json from login_tbl A, user_detail B, user_store C where (A.uid=B.uid and A.uid=C.uid and B.handle=?) \n" +
                            "OR \n" +
                            "(A.uid=B.uid and A.uid=C.uid and A.email=?);";
                    }break;
            case 2: {System.out.println("authenticating for fb username="+username+" email="+password);
                        SQL="select A.uid,B.handle,C.category_list_json from login_tbl A, user_detail B, user_store C where (A.uid=B.uid and A.uid=C.uid and A.fb=?)OR (A.uid=B.uid and A.uid=C.uid and A.email=?);";
                    }    
        }
        
        
       User_Detail user_detail;
       
      try{
           user_detail=jdbcTemplateObject.queryForObject(SQL, new Object[]{username,password}, new User_Detail_Mapper());
      }
      catch(DataAccessException e)
      {System.out.println("User does not exist");
          user_detail=null;
      }
      //return rslt;
        
        return user_detail;
    }
    
    public int[] get_category_list_json(int uid)
    {
        SQL="select category_list_json from user_store where uid=?";
        try
        {
            String rslt=jdbcTemplateObject.queryForObject(SQL, new Object[]{uid}, String.class);
            User_Detail user_detail=new User_Detail();
            user_detail.setCategory_list_json(rslt);
            return user_detail.getCategory_list_json();
        }
        catch(DataAccessException e)
        {int fail[]=new int[0];
            System.out.println("Error occured in User_TblJDBC>get_category_list_json "+e);
            return fail;
        }
    }
    
    public boolean createUser(String handle,String name,String email,String country,String state,String city,String zip,String religion,String sex,String dob,String phone,String profile_pic,int category[], String fb )
   {
       System.out.println("In User_Tbl_JDBCTemplate> createUser");
        /* Code for User_Store */
            
            String category_list_json=Arrays.toString(category);
            System.out.println("Category list="+category_list_json);
            List<Exp_Json> exp = new ArrayList();
            Exp_Json obj = null;
            for(int i=0; i<category.length; i++)
            {
            obj=new Exp_Json(category[i]);
                try{exp.add(obj);}
                catch(Exception e)
                {
                    System.out.println("Errror in Exp_json="+e);
                    return false;
                }
                
                
            }
            //System.out.println("reached3");
            String exp_json=gson.toJson(exp);
            System.out.println("Exp_Json="+exp);
        SQL="select uid from login_tbl where email=?";
       try
       {int rslt=jdbcTemplateObject.queryForObject(SQL, new Object[]{email}, Integer.class);
       return false;
       }
       catch(DataAccessException e)
       {
           System.out.println("In catch");
           SQL = "insert into login_tbl(fb,email) values(?,?)";// Inserting into login_tbl
           try{
           jdbcTemplateObject.update( SQL, fb,email);// adding email in login_tbl
            SQL="select uid from login_tbl where email=?";// fetchin the uid for newly entered row
            int uid=jdbcTemplateObject.queryForObject(SQL, new Object[]{email}, Integer.class);
            
            
           
            int rs1=0,rs2=0;
            try{SQL="insert into user_detail(uid,handle,name,country,state,city,zip,religion,sex,dob,phone,profile_pic) values(?,?,?,?,?,?,?,?,?,?,?)";
             rs1=jdbcTemplateObject.update( SQL, uid,handle,name,country,state,city,zip,religion,sex,dob,phone,profile_pic);
            }
            catch(DataAccessException f)
            {
                System.out.println("Error occured in createUser while inserting row in user_detail e="+f);
            }
            try{
                SQL="insert into user_store(uid,category_list_json,exp_json,fish) values(?,?,?,?)";
                rs2=jdbcTemplateObject.update( SQL, uid,category_list_json,exp_json,1000);
            }
            catch(DataAccessException f)
            {
                System.out.println("Error occured in createUser while inserting row in user_store e="+f);
            }
            if(rs1==1 && rs2==1)
            {
                System.out.println("Successfully created a new user");
                return true;
            }
            else
            {
                //Write a code to revert all transactions and delete new entries
                System.out.println("User cannot be created rs1="+rs1+" rs2="+rs2);
            }
           }
           catch(DataAccessException f)
           {
               System.out.println("error="+f);
           }
           
           return true;
       }
      
       // SQL = "insert into login_tbl(uid,cid_json,title,description,qtn_json,ans_json,poll_link,reward,poll_type) values(?,?,?,?,?,?,?,?,?)";
      
      //System.out.println(uid + cid_json+title+description+ qtn_json+ poll_link+ reward+ poll_type);
     //int ty=jdbcTemplateObject.update( SQL, uid, cid_json,title,description, qtn_json, ans_json,poll_link, reward, poll_type);
        //System.out.println("Ty=" +ty);
   
   }
    
}
