/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO.Poll_Tbl_pkg;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
/**
 *
 * @author abc
 */
public class Poll_TblJDBCTemplate implements Poll_Tbl_DAO {
   private DataSource dataSource;
   private JdbcTemplate jdbcTemplateObject;
    
   @Override
   public void setDataSource(DataSource dataSource) {
      this.dataSource = dataSource;
      this.jdbcTemplateObject = new JdbcTemplate(dataSource);
   }

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
