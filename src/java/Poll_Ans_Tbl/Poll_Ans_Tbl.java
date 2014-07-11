/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Poll_Ans_Tbl;
import DAO.Poll_Tbl_pkg.Qtn;
import User_Manager.User_Detail;
import User_Manager.User_TblJDBCTemplate;
import com.google.gson.Gson;
import java.sql.SQLException;
import java.util.List;
/**
 *
 * @author abc
 */
public class Poll_Ans_Tbl {
    private int poll_ans_key,pid,uid;
    List<Qtn> qtn;
    String solve_ts;
    Gson gson=new Gson();
   User_Detail user;

   
    public List<Qtn> getQtn() {
        return qtn;
    }

    public void setQtn(String st) {
        this.qtn = gson.fromJson(st, List.class);
    }

    public int getPoll_ans_key() {
        return poll_ans_key;
    }

    public void setPoll_ans_key(int poll_ans_key) {
        this.poll_ans_key = poll_ans_key;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) throws SQLException {
        this.uid = uid;
        
        User_TblJDBCTemplate user_jdbc= new User_TblJDBCTemplate();
        
        user=user_jdbc.get_profile(uid);
 
     
    }

    

    public String getSolve_ts() {
        return solve_ts;
    }

    public void setSolve_ts(String solve_ts) {
        this.solve_ts = solve_ts;
    }

}


