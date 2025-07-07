<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String sessionId = (String) session.getAttribute("sessionId");
%>
<link rel="stylesheet" href="<c:url value='/resources/css/styles.css' />" />
<style>
    .navbar-custom {
        background-color: #0056b3;
    }

    .navbar-brand {
        font-weight: bold;
        font-size: 1.5rem;
        color: #ffffff !important;
    }

    .navbar-nav .nav-link {
        color: #ffffff !important;
        margin-right: 10px;
        transition: color 0.3s ease;
    }

    .navbar-nav .nav-link:hover {
        color: #ffc107 !important;
    }

    .dropdown-menu a {
        font-size: 0.95rem;
    }

    .btn-logout {
        margin-left: 10px;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="<c:url value='/board/main.jsp'/>">🛫 Blue Wings</a>
        <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/board/main.jsp'/>">Home</a>
                </li>
                <c:url var="boardListUrl" value="/BoardListAction.do">
                    <c:param name="pageNum" value="1"/>
                </c:url>
                <li class="nav-item">
                    <a class="nav-link" href="${boardListUrl}">Board</a>
                </li>
            </ul>

            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="memberDropdown" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        Member
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="memberDropdown">
                        <c:choose>
                            <c:when test="${empty sessionId}">
                                <li><a class="dropdown-item" href="<c:url value='/board/login.jsp'/>">Login</a></li>
                                <li><a class="dropdown-item" href="#!">Join Us</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><span class="dropdown-item text-muted">Welcome, <%=sessionId%></span></li>
                                <li><a class="dropdown-item" href="#!">My Page</a></li>
                                <li><a class="dropdown-item text-danger" href="#!">Logout</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </li>
            </ul>

            <form class="d-flex ms-3">
                <button class="btn btn-warning" type="submit">
                    <i class="bi-cart-fill me-1"></i> Cart
                    <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                </button>
            </form>
        </div>
    </div>
</nav>
