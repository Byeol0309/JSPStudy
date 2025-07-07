	<%@page import="goodsmvc.model.BoardDTO"%>
	<%@page import="java.util.List"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <link href="../resources/css/styles.css" rel="stylesheet" />
<!DOCTYPE html>
		<%
		String sessionId = (String) session.getAttribute("sessionId");
		BoardDTO notice = (BoardDTO) request.getAttribute("board");
		int num = ((Integer)request.getAttribute("num")).intValue();
		int nowpage = ((Integer) request.getAttribute("page")).intValue();		
		String b_id = (String)request.getAttribute("b_id");
		
		//request.setAttribute("sessionId", sessionId);
		
		//request.setAttribute("board", notice); 

		%>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
                  <title>게시판 상세보기</title>       
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />      
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />      
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
               	<c:url var="boardViewUrl" value="/BoardView.do" />
                <form name="view" action="${boardViewUrl}" method="post"> 
                <div class="container-xxl my-4">
					<h1 class="display-5 fw-bold text-secondary mb-3">
  <i class="bi bi-journal-text"></i> Board View
</h1>
                    <div class="table-responsive xxl">
                    	<table class="table table-striped table-xl text-center ">
                    		<caption>
                    			<span class="blind">게시물 상세보기</span>
                    		</caption>
                    	<tr >
						<th class="w-5 p-3">번호</th>
						<th class="w-50 p-3 text-center">제목</th>
						<th class="w-10 p-3">작성자</th>
						<th class="w-5 p-3">작성일</th>
						<th class="w-5 p-3">조회</th>
					</tr>
				
					<tr>
						<td><%=notice.getNum() %></td>
						<td class="w-50 p-3 text-center"><%-- <a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"> </a> --%>
						<%=notice.getB_subject()%></td>
                    	<td><%=notice.getB_name() %></td>
                    	<td><%=notice.getB_regist_day() %></td>
                    	<td><%=notice.getB_hit()%></td>
                    </tr>
                    <tr>
        				<td colspan="5" class="text-start p-4">
    <div style="
        background-color: #f8f9fa;
        border: 1px solid #ced4da;
        border-radius: 4px;
        padding: 10px 15px;
        font-size: 1rem;
        line-height: 1.6;
        white-space: pre-wrap;
        word-wrap: break-word;
        overflow-x: auto;
        max-height: 400px;
    ">
        <%=notice.getB_content()%>
    </div>
</td>
</td>
      				
    				</tr>
                    
                    	</table>
                    	</div>
                    	</div>
                    	</form>	
                    	
                    	<div class="container-xxl">
    <div class="d-flex justify-content-end mt-4">
             <c:if test="${sessionId eq b_id}">
    <form name="view" action="<c:url value='/BoardUpdateAction.do'/>" method="post" style="display:inline;">
        <input type="hidden" name="num" value="${board.num}"/>
        <input type="hidden" name="pageNum" value="${page}"/>
        <input type="hidden" name="id" value="<%=b_id%>"/>
        <input type="hidden" name="b_name" value="<%=notice.getB_name()%>"/>
        <input type="hidden" name="b_subject" value="<%=notice.getB_subject()%>"/>
        <input type="hidden" name="b_content" value="<%= notice.getB_content().replace("\"", "&quot;") %>" />
        <button type="submit" class="btn btn-outline-secondary btn-sm">수정</button>
    </form>
    <form name="delete" action="<c:url value='/BoardDeleteAction.do' />" method="post" style="display:inline;" 
          onsubmit="return confirm('정말 삭제하시겠습니까?');">
        <input type="hidden" name="num" value="${board.num}" />
        <input type="hidden" name="pageNum" value="${page}" />
        <button type="submit" class="btn btn-outline-secondary btn-sm">삭제</button>
    </form>
</c:if>
            </div>
            </div>
            
        </section>
       
        <%@ include file="footer.jsp" %>
    
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
       	
        <!-- Core theme JS-->
        
        
        <script src="../resources/js/scripts.js"></script>
    </body>
</html>