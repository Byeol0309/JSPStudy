<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scripting.jsp</title>
</head>
<body>
		<h2>Scripting Tag</h2>
		
		<%!
		// 자바코드기때문에 주석 슬래시로 가능함.
		// 선언문 : 자바 변수나 메서드를 정의(선언)
		int count = 3; // 변수선언
		
		String makeItLower(String data) { // 메서드선언
			return data.toLowerCase();
		}
		
		%>
		
		
		
		<%
		// 스크립틀릿 : 자바로직을 작성
		 for(int i = 1; i <=count; i++){
			 out.println("java server pages" + i +"<br>");
		 }
		
		%>
		
		
		
		
		<%= makeItLower("Hello World")
		// 표현문 : print를 담당한다.
		
		
		
		%>



</body>
</html>