/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

/**
 *
 * @author root
 */

import java.sql.*;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

public class connectivity{
private final String driver="com.mysql.jdbc.Driver";
private final String database_name="pollingduck";
private final String mysqluser="root";
private final String mysqlpass="";
private final String mysqlurl="jdbc:mysql:///"+database_name;
private Connection con=null;
private DataSource dataSource;
private JdbcTemplate jdbcTemplateObject;
PreparedStatement st;
ResultSet rs;
    public DataSource getDataSource() {
        return dataSource;
    }
public void setDataSource(DataSource dataSource) throws SQLException {
      this.dataSource = dataSource;
      System.out.println("DataSource is set"); 
      System.out.println(dataSource);
      try{
          con=dataSource.getConnection();
           this.jdbcTemplateObject = new JdbcTemplate(dataSource);
      System.out.println("connected to db");
      }
      catch(Exception e)
      {
          System.out.println("Error in connectivity ="+e);
      }
     
   }

/* Adjust the above two as per the username
     * password combination of your MySql databse */
    public JdbcTemplate getJdbcTemplateObject() {
        return jdbcTemplateObject;
    }

@SuppressWarnings("empty-statement")
public connectivity() throws SQLException
{

    System.out.println("Creating Connectivity Object");            
}
public Connection getCon()
{
    return con;
}

public int solvable(int pid, int uid) throws SQLException
    {
    System.out.println("in connectivity > solvable() uid="+uid+" pid="+pid);
    st=con.prepareStatement("Select pid from poll_ans_tbl where pid=? and uid=?");
    st.setInt(1,pid);
    st.setInt(2, uid);
    System.out.println("query="+st);
    
    rs=st.executeQuery();
    if(rs.next())
        {
            return 0;
        }
    else
        {
            return 1;
        }

    }

public String[] getCategoryName(int cid) throws SQLException
{// Returns category name on entering cid
    //System.out.println("in connectivity > getCategoryName()");
    st=con.prepareStatement("Select category_name,group_name from category_tbl where cid=?");
    st.setInt(1,cid);
    //System.out.println("query="+st);
    rs=st.executeQuery();
    String rslt[] = new String[2];
    while(rs.next())
    {
        rslt[0]=rs.getString("category_name");
        rslt[1]=rs.getString("group_name");
    }
    
    return rslt;
    
}

public void closeConnection() throws SQLException
{
    con.close();
}
}