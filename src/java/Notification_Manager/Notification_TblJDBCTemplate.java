/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Notification_Manager;

import com.google.gson.Gson;
import java.sql.SQLException;
import javax.sql.DataSource;
import model.connectivity;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author Taha
 */
public class Notification_TblJDBCTemplate {
    private final DataSource dataSource;
    private final JdbcTemplate jdbcTemplateObject;
    Gson gson=new Gson();
    connectivity conn;
    public Notification_TblJDBCTemplate() throws SQLException
    {
    ApplicationContext context =new ClassPathXmlApplicationContext("Beans.xml");
    conn=(connectivity)context.getBean("connectivity");
     
      this.dataSource=conn.getDataSource();
      this.jdbcTemplateObject = new JdbcTemplate(dataSource);
      
    }
    
    
    
}
