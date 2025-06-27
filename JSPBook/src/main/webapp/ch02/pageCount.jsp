<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<%
	int count=0;
%>
<body>
Page count is
<%
	out.println(++count);
%>

</body>
</html>