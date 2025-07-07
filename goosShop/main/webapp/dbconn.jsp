<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%> 
<%
	Connection conn=null;

try{
	String url = "jdbc:mysql://192.168.111.101:3306/goodsdb";
	String user = "goods";
	String password ="1234";

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	out.println("데이터베이스 연결 성공되었습니다.<br>");
	} catch (ClassNotFoundException ex) {
		out.println("JDBC드라이버를 찾지 못하였습니다.<br>");
		out.println("dbconn" + ex.getMessage());
	}catch (SQLException ex) {
		out.println("데이터베이스 연결이 실패되었습니다.<br>");
		out.println("SQLException: " + ex.getMessage());
	}finally {
		if( conn != null) conn.close();
	}



%>