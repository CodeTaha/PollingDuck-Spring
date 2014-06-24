/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO.Poll_Tbl_pkg;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import model.connectivity;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
/**
 *
 * @author abc
 */
public class Poll_TblJDBCTemplate implements Poll_Tbl_DAO {
   private DataSource dataSource;
   private JdbcTemplate jdbcTemplateObject;
    public Poll_TblJDBCTemplate() throws SQLException
    {System.out.println("in poll_tbl Taha");
    ApplicationContext context =new ClassPathXmlApplicationContext("Beans.xml");
    connectivity conn=(connectivity)context.getBean("connectivity");
      System.out.println("in poll_tbl Taha got beaan properly");
      this.dataSource=conn.getDataSource();
      this.jdbcTemplateObject = new JdbcTemplate(dataSource);
      System.out.println("in poll_tbl Taha got data properly");
    }
   /*@Override
   public void setDataSource(DataSource dataSource) {
      this.dataSource = dataSource;
      this.jdbcTemplateObject = new JdbcTemplate(dataSource);
   }*/

   @Override
   public boolean create(int uid, String cid_json, String title, String description, String qtn_json, String ans_json, String poll_link, int reward, String poll_type)
   {
       String SQL = "insert into poll_tbl(uid,cid_json,title,description,qtn_json,ans_json,poll_link,reward,poll_type) values(?,?,?,?,?,?,?,?,?)";
      System.out.println("Taha chal gaya");
      System.out.println(uid + cid_json+title+description+ qtn_json+ poll_link+ reward+ poll_type);
     int ty=jdbcTemplateObject.update( SQL, uid, cid_json,title,description, qtn_json, ans_json,poll_link, reward, poll_type);
        System.out.println("Ty=" +ty);
     return true;
   }
   
   public List<Poll_Tbl> listPolls() {
      String SQL = "select * from poll_tbl";
      List <Poll_Tbl> poll_tbl = jdbcTemplateObject.query(SQL, new Poll_Tbl_Mapper());
      return poll_tbl;
   }
}
