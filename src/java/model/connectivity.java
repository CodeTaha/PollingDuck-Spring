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

public class connectivity{
private final String driver="com.mysql.jdbc.Driver";
private final String database_name="pollingduck";
private final String mysqluser="root";
private final String mysqlpass="";
private final String mysqlurl="jdbc:mysql:///"+database_name;
private Connection con=null;
private DataSource dataSource;

    public DataSource getDataSource() {
        return dataSource;
    }
public void setDataSource(DataSource dataSource) throws SQLException {
      this.dataSource = dataSource;
      System.out.println("DataSource is set"); 
      System.out.println(dataSource);
      con=dataSource.getConnection();
      System.out.println("Connection set");
     
   }
/* Adjust the above two as per the username
 * password combination of your MySql databse */

@SuppressWarnings("empty-statement")
public connectivity() throws SQLException
{

    System.out.println("Creating Connectivity Object");
    String[] arr=new String[3];
    System.out.println("connected to db");
       
            
}
public Connection getCon()
{
    return con;
}

public boolean solvable(int pid, int uid)
{
    System.out.println("in connectivity > solvable() uid="+uid+" pid="+pid);
    return true;
}

}