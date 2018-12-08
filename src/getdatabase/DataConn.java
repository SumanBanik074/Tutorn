package getdatabase;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataConn {
	static Connection cn=null;
	static String driver="org.postgresql.Driver";
	static String url="jdbc:postgresql://localhost:5432/exam_sys";
	static String user="postgres";
	static String pass="2542";
	public static Connection getData(){
		try{
			Class.forName(driver);
			cn=DriverManager.getConnection(url,user,pass);
		}catch(Exception e){
			System.out.println(e);
		}
		return cn; 
	}
}
