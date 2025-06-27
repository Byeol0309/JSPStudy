<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<!-- <h3>이 파일은 second.jsp입니다.</h3> -->
	Today is : <%=request.getParameter("date") %>
	<!-- request내장객체의 getParameter()메서드로 매개변수 date값을 전달받는다 -->
	
	<%-- Today is: <%=new java.util.Date() %> --%>
</body>
</html>