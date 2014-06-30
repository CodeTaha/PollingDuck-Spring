/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Poll_Ans_Tbl;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author abc
 */
public class Poll_Ans_Tbl_Mapper implements RowMapper<Poll_Ans_Tbl> {
    @Override
     public Poll_Ans_Tbl mapRow(ResultSet rs, int rowNum) throws SQLException {
      Poll_Ans_Tbl poll_ans_tbl = new Poll_Ans_Tbl();
      poll_ans_tbl.setPid(rs.getInt("pid"));
      poll_ans_tbl.setPoll_ans_key(rs.getInt("poll_ans_key"));
      poll_ans_tbl.setUid(rs.getInt("uid"));
      poll_ans_tbl.setSolve_ts(rs.getString("solve_ts"));
      poll_ans_tbl.setQtn(rs.getString("ans_json"));
      
      
      return poll_ans_tbl;
   }
}
