package goodsmvc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	//DB와 연동
	 public static Connection getConnection()throws SQLException, ClassNotFoundException {
		 Connection conn = null;
		 String url = "jdbc:mysql://192.168.111.101:3306/goodsdb";
		 String user = "goods";
		 String password ="1234";
		 
		 Class.forName("com.mysql.jdbc.Driver");
		 conn = DriverManager.getConnection(url, user, password);
		 
		 return conn;
	 }
	
}
