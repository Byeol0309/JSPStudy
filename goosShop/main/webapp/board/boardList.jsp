	<%@page import="goodsmvc.model.BoardDTO"%>
	<%@page import="java.util.List"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
		<%
		String sessionId = (String) session.getAttribute("sessionId");
		List boardList = (List) request.getAttribute("boardlist");
		int total_record = ((Integer) request.getAttribute("total_record")).intValue();
		int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
		int total_page = ((Integer) request.getAttribute("total_page")).intValue();

		%>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
                  <title>Board List</title>       
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />      
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />      

        <style>
    a {
        color: inherit;
        text-decoration: none;
    }

    a:hover,
    a:focus,
    a:active,
    a:visited {
        color: inherit;
        text-decoration: none;
    }
</style>
      
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
                <div class="position-absolute top-50 end-0 translate-middle-y">
                <h4 class="fst-italic">Recent posts</h4>
                    <ul class="list-unstyled">
                    <li>
                    	<a class="d-flex flex-column flex-lg-row gap-3 align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-top" href="#"></a>
                    <avg aria-hidden="true" class="bd-placeholder-img" height="100" preserveAspectRatio="xMidYMid slice" width="100%"
                    	xmlns="http://www.w3.org/2000/svg">
                    	</avg>
                    	<div class="col-lg-8"></div>
                    	</a>
                    </li>
                    <rect width="100%" height="100%" fill="#777"></rect>
                    </li>
                    </ul>
                    </div>
                    
                <form action="<c:url value="./BoardListAction.do"/>" method="post">
                <div class="container-xxl"> 
                <div class="d-flex justify-content-between align-items-center mb-3">
                <h1 class="h4 text-secondary"> 📋 Blue Wings Board List</h1>
                		<c:choose>
							<c:when test="${empty sessionId}">
							<a href="#" onclick="alert('비회원은 게시글을 작성하실 수 없습니다.'); return false;" class="btn btn-secondary btn-sm">&laquo;비회원</a>
							</c:when>
							<c:otherwise>				
				<a href="/goodsShop/board/writeForm.jsp"  class="btn btn-secondary btn-sm">&laquo;글쓰기</a>
							</c:otherwise>
							</c:choose>	
                </div>
                
                    <div class="table-responsive xxl">
                    	<table class="table table-striped table-xl text-center ">
                    		<caption>
                    			<span class="blind">게시물 목록</span>
                    		</caption>
                    	<tr>
						<th class="w-5 p-3">번호</th>
						<th class="w-50 p-3 text-center">제목</th>
						<th class="w-10 p-3">작성자</th>
						<th class="w-5 p-3">작성일</th>
						<th class="w-5 p-3">조회</th>
					</tr>
					<tr>
						<%
							for(int j = 0; j< boardList.size(); j++){
								
							 BoardDTO notice = (BoardDTO) boardList.get(j);
							
						%>
					</tr>
					<tr>
						<td><%=notice.getNum() %></td>
						<td class="w-50 p-3 text-center"><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"> <%=notice.getB_subject()%></a></td>
                    	<td><%=notice.getB_name() %></td>
                    	<td><%=notice.getB_regist_day() %></td>
                    	<td><%=notice.getB_hit() %></td>
                    </tr>
                    	<%
							}
                    	%>
                    	</table>
                    	
                    	<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-fluid justify-content-start">
							<div>              
                    </div>                   
                     <div align="center">
				<c:set var="pageNum" value="<%=pageNum%>" />
				<c:forEach var="i" begin="1" end="<%=total_page%>">
					<a href="<c:url value="./BoardListAction.do?pageNum=${i}" /> ">
						<c:choose>
							<c:when test="${pageNum==i}">
								<font color='4C5317'><b> [${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color='4C5317'> [${i}]</font>

							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
			</div>
			
			<%-- <div class="py-3" align="right">
							<c:choose>
							<c:when test="${empty sessionId}">
							<a href="#" onclick="alert('비회원은 게시글을 작성하실 수 없습니다.'); return false;" class="btn btn-secondary btn-sm">&laquo;비회원</a>
							</c:when>
							<c:otherwise>				
				<a href="/goodsShop/board/writeForm.jsp"  class="btn btn-secondary btn-sm">&laquo;글쓰기</a>
							</c:otherwise>
							</c:choose>				
			</div>		 --%>	
			<div class="input-group input-group-sm" style="max-width: 400px;">
  			<select class="form-select" style="border: 2px solid black;">
    <option value="b_subject" <c:if test="${param.items == 'b_subject'}">selected</c:if>>제목</option>
    <option value="b_content" <c:if test="${param.items == 'b_content'}">selected</c:if>>본문</option>
    <option value="b_name" <c:if test="${param.items == 'b_name'}">selected</c:if>>작성자</option>
</select>
<input name="text" type="text" value="${param.text != null ? param.text : ''}" />
<input type="submit" class="btn btn-outline-secondary btn-sm" value="검색" />				
			</div>
                    
                    </div>
                   
                </div>
            </div>
            
            </form>
        </section>
        </div>
        <%@ include file="footer.jsp" %>
    
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
       	
        <!-- Core theme JS-->
        
        
        <script src="../resources/js/scripts.js"></script>
    </body>
</html>