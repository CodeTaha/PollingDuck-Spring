/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAO.Poll_Tbl_pkg;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
/**
 *
 * @author abc
 */
public class Poll_Tbl_Mapper implements RowMapper<Poll_Tbl>{
     @Override
     public Poll_Tbl mapRow(ResultSet rs, int rowNum) throws SQLException {
      Poll_Tbl poll_tbl = new Poll_Tbl();
      poll_tbl.setPid(rs.getInt("pid"));
      poll_tbl.setUid(rs.getInt("uid"));
      poll_tbl.setCid_json(rs.getString("cid_json"));
      poll_tbl.setTitle(rs.getString("title"));
      poll_tbl.setDescription(rs.getString("description"));
      poll_tbl.setQtn_json(rs.getString("qtn_json"));
      poll_tbl.setAns_json(rs.getString("ans_json"));
      poll_tbl.setPoll_link(rs.getString("poll_link"));
      poll_tbl.setStart_ts(rs.getString("start_ts"));
      poll_tbl.setEnd_ts(rs.getString("end_ts"));
      poll_tbl.setReward(rs.getInt("reward"));
      poll_tbl.setPoll_type(rs.getString("poll_type"));
      
      
      return poll_tbl;
   }
}
