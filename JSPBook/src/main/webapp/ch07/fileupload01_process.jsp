<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %> --%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>



<%
	MultipartRequest multi = new MultipartRequest(request, "C:\\upload",
			5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());

		Enumeration params=multi.getParameterNames();
		//Enumeration : 열거, 하나씩 나열하기, 사용자가 form에 입력한 모든 값을 열거해준다
		
		while (params.hasMoreElements()) {
			String name=(String) params.nextElement();
			String value=multi.getParameter(name);
			out.println(name+"="+value+"<br>");
		}
		out.println("---------------------<br>");
		
		Enumeration files = multi.getFileNames();
		//Enumeration 타입의 files 객체에 multi에서 가져온 fileName을 넣는다.
		
		while (files.hasMoreElements()){
			String name =(String) files.nextElement();
			String filename=multi.getFilesystemName(name);
			String original=multi.getOriginalFileName(name);
			String type=multi.getContentType(name);
			File file=multi.getFile(name);
			
			out.println("요청 파라미터 이름 : " + name +"<br>");
			out.println("실제 파일 이름 : " + original +"<br>");
			out.println("저장 파일 이름 : " + filename +"<br>");
			out.println("파일 콘텐츠 유형 : "+type+"<br>");
			
			if(file != null){
				out.println("파일크기: " +file.length());
				out.println("<br>");
			}
		}


%>