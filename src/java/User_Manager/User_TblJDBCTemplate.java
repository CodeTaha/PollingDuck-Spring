/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package User_Manager;

import java.sql.Connection;
import java.sql.SQLException;
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
    private DataSource dataSource;
   private JdbcTemplate jdbcTemplateObject;
   connectivity conn=null;
    public User_TblJDBCTemplate() throws SQLException
    {
    ApplicationContext context =new ClassPathXmlApplicationContext("Beans.xml");
     conn=(connectivity)context.getBean("connectivity");
      
      this.dataSource=conn.getDataSource();
      this.jdbcTemplateObject = new JdbcTemplate(dataSource);
      
    }

    public User_Detail authenticate(String username, String password) {
       String SQL = "select A.uid,B.handle,C.category_list_json from login_tbl A, user_detail B, user_store C where (A.uid=B.uid and A.uid=C.uid and B.handle=?) \n" +
"OR \n" +
"(A.uid=B.uid and A.uid=C.uid and A.email=?);";
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
    
}