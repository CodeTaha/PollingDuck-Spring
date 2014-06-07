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

public class connectivity{
private final String driver="com.mysql.jdbc.Driver";
private final String database_name="pollingduck";
private final String mysqluser="root";
private final String mysqlpass="";
private final String mysqlurl="jdbc:mysql:///"+database_name;
private Connection con=null;


/* Adjust the above two as per the username
 * password combination of your MySql databse */

@SuppressWarnings("empty-statement")
public connectivity() throws SQLException
{

       try{
            Class.forName(driver);
            con=DriverManager.getConnection(mysqlurl,mysqluser,mysqlpass);
           String[] arr=new String[3];
           
            System.out.println("connected to db");
        }
         catch(ClassNotFoundException e)
        {
            System.out.println("Connectivity object could not be created because of"+e);;
        }
       
            
}
protected Connection getCon()
{
    return con;
}

}