/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Connect to MySQL database.
 * @author mr.nam
 */
public class MySqlConnection  {
	//fill in them below before compile
    private static String DB_URL   = "";
    private static String USERNAME = "";
    private static String PASSWORD = "";
	//
    public MySqlConnection() {
    }
    
    /**
	 * Return the database URL.
	 */
	public static String getDB_URL() {
        return DB_URL;
    }
	
	/**
	 * Return the connection.
	 */
    public Connection connect() throws Exception
    {
        return DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
    }
    
}