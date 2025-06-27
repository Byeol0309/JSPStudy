<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored="true" %>  
    <%-- isELIgnored디렉티브가 true일때, RequestAttribute변수의 값이 표현언어 ${}로 출력된다 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directive Tag</title>
</head>
<body>
	<%
		request.setAttribute("RequestAttribute", "request 내장객체");
	%>
	${requestScope.RequestAttribute}
</body>
</html>