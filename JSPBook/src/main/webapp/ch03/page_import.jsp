<%@ page import="java.util.Date"%>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
<%@ page info = "Date 클래스를 이용한 날짜 출력하기" %>
Today is <%=new Date() %>
</body>
</html>