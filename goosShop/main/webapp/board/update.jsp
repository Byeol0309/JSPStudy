	<%@page import="goodsmvc.model.BoardDTO"%>
	<%@page import="java.util.List"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
		
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
		 <link rel="stylesheet" href="<c:url value='/resources/css/styles.css' />" />
 <%
  	String sessionId = (String) session.getAttribute("sessionId");
	String name = (String) session.getAttribute("userName");
 	
	BoardDTO notice = (BoardDTO) request.getAttribute("board");
	int num = ((Integer)request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();		
	String b_id = (String)request.getAttribute("b_id");
	
 
%>
       <script type="text/javascript">
			function checkForm(){
				
				if(!document.newUpdate.b_subject.value){
					alert("제목을 입력하세요")
					return false;
				}
				if(!document.newUpdate.b_content.value){
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
        
            <div class="container">
                <form name="newUpdate" action="BoardUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" method="post" onsubmit="return checkForm()">
               		<input name="id" type="hidden" class="form-control" value="${sessionId}">
               		
               		<div class="row mb-3 d-flex align-items-center">
    <div class="col-md-2 text-end">
        <label class="col-form-label">이름</label>
    </div>
               			<div class="col-md-6">
               			<input type="text" name="b_name" value="<%=notice.getB_name()%>" disabled />
               
               				<!-- aria-label="Disabled input example" disabled>은 form으로 서버에 전달되지 않는다 -->
             				<input type="hidden" name="b_name" value="<%=notice.getB_name()%>"/>
               			</div>
               		</div>
               		
               		<div class="row mb-3">
               		<div class="col-md-2 text-end">
				<label class="col-form-label">제목</label>
				</div>
				
				 <div class="col-md-6">

					<input name="b_subject" type="text" class="form-control"  value=" <%=notice.getB_subject()%>"	placeholder="subject"/>
				</div>
			</div>
            <div class="row mb-4">
            <div class="col-md-2 text-end">
				<label class="col-form-label">내용</label>
				</div>
				
				<div class="col-sm-8">
					<textarea name="b_content" rows="5" class="form-control"placeholder="content"><%=notice.getB_content()%></textarea>
				</div>
			</div>
			<%-- <input type="hidden" name="num" value="${board.num}">
   			 <input type="hidden" name="pageNum" value="${page}"> --%>
			
			<div class="row mb-3">
				 <div class="col-md-10 text-end">
					<c:set var="userId" value="<%=notice.getId()%>" />
					<c:if test="${sessionId==userId}">
						<p>
							<a href="./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" 
   								class="btn btn-outline-secondary btn-sm" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
							<input type="submit" class="btn btn-outline-secondary btn-sm" value="수정" style="display:inline;">
					</c:if>
					<a href="./BoardListAction.do?pageNum=<%=nowpage%>"	class="btn btn-outline-secondary btn-sm"> 목록</a>
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