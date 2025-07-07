	<%@page import="goodsmvc.model.BoardDTO"%>
	<%@page import="java.util.List"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
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
        
        <title>게시판 목록</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
    </head>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
  
    <body>
    <%@ include file="menu.jsp" %>
           
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
            <div class="container-fluid">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-fluid justify-content-start">
                <form action="<c:url value="/BoardListAction.do"/>" method="post">
                <div class="container-fluid"> 
                <h1>board table</h1>
                    <div class="table-responsive xxl">
                    	<table class="table table-striped table-xxl">
                    		<caption>
                    			<span class="blind">게시물 목록</span>
                    		</caption>
                    	<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>
					<tr>
						<%
							for(int j = 0; j< boardList.size(); j++){
								
							 BoardDTO notice = (BoardDTO) boardList.get(j);
							
						%>
					</tr>
					<tr>
						<td><%=notice.getNum() %></td>
						<td><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"> <%=notice.getB_subject()%></a></td>
                    	<td><%=notice.getB_name() %></td>
                    	<td><%=notice.getB_regist_day() %></td>
                    	<td><%=notice.getB_hit() %></td>
                    </tr>
                    	<%
							}
                    	%>
                    	</table>               
                    </div>
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
			
			<div class="py-3" align="right">							
				<a href="#" onclick="checkForm(); return false;" class="btn btn-primary">&laquo;글쓰기</a>				
			</div>			
			<div align="left">				
				<select name="items" class="txt">
					<option value="subject">제목에서</option>
					<option value="content">본문에서</option>
					<option value="name">글쓴이에서</option>
				</select> <input name="text" type="text" /> <input type="submit" id="btnAdd" class="btn btn-primary " value="검색 " />				
			</div>
                    
                    <div>
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
                   <!--  <div class="col mb-5">
                        <div class="card h-100">
                            Product image
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            Product details
                            <div class="card-body p-4">
                                <div class="text-center">
                                    Product name
                                    <h5 class="fw-bolder">Popular Item</h5>
                                    Product reviews
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    Product price
                                    $40.00
                                </div>
                            </div>
                            Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div> -->
                </div>
            </div>
            </form>
        </section>
        <%@ include file="footer.jsp" %>
    
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>