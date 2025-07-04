	<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.ArrayList" %>
    <%@ page import = "dto.Book" %>
    <%-- <jsp:useBean id ="bookDAO" class="dao.BookRepository" scope="session" /> --%>
<!DOCTYPE html>
<html>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./resources/css/bootstrap.min.css"  rel="stylesheet" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.min.js" 
	integrity="sha384-RuyvpeZCxMJCqVUGFI0Do1mQrods/hhxYlcVfGPOfQtPJh0JCw12tUAZ/Mv10S7D" 
	crossorigin="anonymous"></script>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
</head>
<body>
	<div class="container py-4>">
  		<%@ include file="menu.jsp" %>
  		 
  		 <div class="p-5 mb-4 bg-body-tertiary rounded-3">
  		   <div class="container-fluid py-5">
  		   		<h1 class="display-5 fw-bold">도서목록</h1>
  		   		<p class="col-md-8 fs-4">BookList</p>
  		   </div>
  		 </div>
  		 <%
  		 	BookRepository bookDAO= new BookRepository();
  		 	BookRepository dao=BookRepository.getInstance();
  		 	ArrayList<Book> listOfBooks = bookDAO.getAllBooks();
  		 %>
  		 
  		 <div class="row align-items-md-stretch text-center">
  		 	<%
  		 		for(int i=0; i < listOfBooks.size(); i++){
  		 			Book book=listOfBooks.get(i); 		 		
  		 	%>
  		 	<div class="col-md-4">
  		 		<div class="h-100 p-2">
  		 		  <h5><b><%=book.getName() %></b></h5>
  		 		  <p> <%=book.getAuthor() %>
  		 		  <br><%=book.getPublisher()%> | <%=book.getReleaseDate() %>
  		 		  <p><%=book.getDescription().substring(0,60) %>...
  		 		  <p><%=book.getUnitPrice() %>원
  		 		  <p><a href= "./book.jsp?id=<%=book.getBookId() %>"
  		 		  		class="btn btn-secondary" role="button">상세정보 &raquo;</a>
  		 		</div>
  		 	</div>
  		 <%
  		 		}
  		 %>
  		 
  		 </div>
 		 <%@include file="footer.jsp" %>
	</div>

</body>
</html>