<%@page import="com.oreilly.servlet.CookieNotFoundException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%
 	request.setCharacterEncoding("UTF-8");

	String filename="";
	
	String realFolder="C:\\jsp-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\BookMarket\\resources\\images";
	String encType="UTF-8"; //인코딩타입
	int maxSize= 5 * 1024 * 1024; //최대 업로드될 파일의 크기 5Mb
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	String bookId = multi.getParameter("bookId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String author = multi.getParameter("author");
	String publisher = multi.getParameter("publisher");
	String releaseDate = multi.getParameter("releaseDate");
	String description = multi.getParameter("description");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Enumeration files = multi.getFileNames();
	String fname =(String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	int price;
	if(unitPrice.isEmpty())
			price = 0;
	else
			price = Integer.valueOf(unitPrice);
	long stock;
	
	if(unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	
	PreparedStatement pstmt =null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM book where b_id = ?";
	pstmt =conn.prepareStatement(sql);
	pstmt.setString(1, bookId);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		if(fileName != null){
			sql = "UPDATE book SET b_name=?, b_unitPrice=?, b_author=?, b_description=?, b_publisher=?, b_category=?, b_unitsInStock=?, b_releaseDate=?, b_condition=?, b_fileName=? WHERE b_id=?";
			 	  //요청 파라미터 중에서 이미지파일이 있으면 실행
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, author);
			pstmt.setString(4, description);
			pstmt.setString(5, publisher);
			pstmt.setString(6, category);
			pstmt.setLong(7, stock);
			pstmt.setString(8, releaseDate);
			pstmt.setString(9, condition);
			pstmt.setString(10, fileName);
			pstmt.setString(11, bookId);
			pstmt.executeUpdate();
			
		}else{
			sql = "UPDATE book SET b_name=?, b_unitPrice=?, b_author=?, b_description=?, b_publisher=?, b_category=?, b_unitsInStock=?, b_releaseDate=?, b_condition=? WHERE b_id=?";
					//요청 파라미터중에서 이미지파일이 없으면 실행
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2,price);
			pstmt.setString(3, author);
			pstmt.setString(4, description);
			pstmt.setString(5, publisher);
			pstmt.setString(6, category);
			pstmt.setLong(7, stock);
			pstmt.setString(8, releaseDate);
			pstmt.setString(9, condition);
			pstmt.setString(10, bookId);
			pstmt.executeUpdate();
					
		}
		
	}
	
	if(pstmt != null)
		pstmt.close();
	if(conn != null )
		conn.close();
	
	response.sendRedirect("editBook.jsp?edit=update");
%>