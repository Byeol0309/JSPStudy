<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<h3>이 파일은 first.jsp입니다.</h3>
	<jsp:include page="second.jsp">
		<jsp:param name="date" value="<%=new java.util.Date() %>"/>
		</jsp:include>
	
	<p>Jakarta Server Page</p>
	
	<!--flush: 설정한 외부파일로 제어가 이동할때, 
				현재 JSP페이지가 지금까지 출력한 버퍼에 저장한 결과를 처리
	flush 기본값은 false이고, true로 설정하면 외부파일로 제어가 이동할때
	현재 JSP페이지가 지금까지 출력 버퍼에 저장된 웹브라우저에 출력하고 출력버퍼를 비운다 --> 
</body>
</html>