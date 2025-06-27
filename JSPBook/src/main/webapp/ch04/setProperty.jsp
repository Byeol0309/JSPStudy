<%@page import="ch04.com.dao.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
<!-- setProperty : uesBean 액션태그와 함께 사용, 전달되는 요청 파라미터 값을 직접 저장하거나, 자바빈즈의 프로퍼티로 변경하여 값저장 -->
<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request" />
<jsp:setProperty name="person" property="id" value="20230824" />
<jsp:setProperty name="person" property="name" value="홍길동" />
<p> 아이디 : <%out.println(person.getId()); %>
<p> 이름 : <%out.println(person.getName()); %>
</body>
</html>