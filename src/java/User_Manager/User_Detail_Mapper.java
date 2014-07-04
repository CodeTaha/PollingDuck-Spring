/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package User_Manager;

/**
 *
 * @author Taha
 */
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
/**
 *
 * @author abc
 */
public class User_Detail_Mapper implements RowMapper<User_Detail>{
     @Override
     public User_Detail mapRow(ResultSet rs, int rowNum) throws SQLException {
         User_Detail user = new User_Detail();
        
      user.setUid(rs.getInt("uid"));
      user.setCategory_list_json(rs.getString("category_list_json"));
      user.setHandle(rs.getString("handle"));
      
      
      return user;
   }
}
