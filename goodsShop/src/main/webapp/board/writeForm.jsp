	<%@page import="goodsmvc.model.BoardDTO"%>
	<%@page import="java.util.List"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <link rel="stylesheet" href="<c:url value='/resources/css/styles.css' />" />
<!DOCTYPE html>
		
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
		 
 <%
	String name = (String) session.getAttribute("userName");
%>
       <script type="text/javascript">
			function checkForm(){
				
				if(!document.newWrite.b_subject.value){
					alert("제목을 입력하세요")
					return false;
				}
				if(!document.newWrite.b_content.value){
					alert("내용을 입력하세요");
					return false;
				}
			}
        </script> 
       
        
        <title>게시판 목록</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
         </head>  
    <body>
    <jsp:include page="menu.jsp" />
           
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Blue Wings Board</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Blue Free Board</p>
                </div>
            </div>
        </header>
        
        <!-- Section-->
        <section class="py-5">
        
            <div class="container-xxl">
                <form name="newWrite" action="<c:url value="./BoardWriteAction.do"/>" method="post" onsubmit="return checkForm()">
               		<input name="id" type="hidden" class="form-control" value="${sessionId}">
               		
               		<div class="mb-3 row">
               			<label class="col-sm-2" control-label">이름</label>
               			<div class="col-sm-3">
               				<input class="form-control" name="name" type="text"  value="<%=name %>"	readonly>
               				<!-- aria-label="Disabled input example" disabled>은 form으로 서버에 전달되지 않는다 -->
             				<input type="hidden" name="b_name" value="<%=name %>" />
               			</div>
               		</div>
               		<div class="mb-3 row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">

					<input name="b_subject" type="text" class="form-control"	placeholder="subject">
				</div>
			</div>
               		<div class="mb-3 row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8">
					<textarea name="b_content" cols="50" rows="5" class="form-control"placeholder="content"></textarea>
				</div>
			</div>
			<div class="position-absolute bottom-0 end-0">
				<div class="col-sm-offset-2 col-sm-10 ">
				 <input type="submit" class="btn btn-secondary btn-sm" style="padding-right: 10px;" value="등록">	
				 	
				 <a href="<%=request.getContextPath()%>/BoardListAction.do" class="btn btn-outline-secondary btn-sm" style="padding-right: 10px;" >취소</a>	
				<!-- <input type="reset" class="btn btn-outline-secondary btn-sm" value=" 취소 "> -->
				</div>
			</div>
                </form>
            
            
        </div>   
        </section>
        
        
        <%@ include file="footer.jsp" %>
    
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
 		<!-- Core theme JS-->
        
       <script src="../resources/js/scripts.js"></script>
       
    </body>
</html>