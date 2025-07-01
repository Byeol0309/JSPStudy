<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository"%>
<%@ page import="com.oreilly.servlet.*"%> <!-- 오라일리에서 제공하는 외부파일 업로드 라이브러리  -->
<%@ page import="com.oreilly.servlet.multipart.*"%> <!-- 그 안에 있는 multipart처리 관련 기능 --> 
<%@ page import="java.util.*" %> <!-- Enumeration, ArrayList등 기본 유틸 클래스들 -->

	<%
		request.setCharacterEncoding("UTF-8"); 
		// post메서드의 한글 지원을 위해 UTF-8로 인코딩
		
		//파일 업로드 처리용 추가 코드
		String filename=""; //filename을 null로 저장
		String realFolder=application.getRealPath("resources/images"); //폴더는 미리 생성해야한다.
		//톰켓이 관리하는 실제 경로를 불러온다 http://192.168.111.102:80/BookMarket
		
		int maxSize=5 * 1024 * 1024; //저장 최대 사이즈는 5mb
		String encType="UTF-8"; 	 // 파일명이 한글일 수 있음.
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realFolder, maxSize, encType,
											new DefaultFileRenamePolicy());
		// MultipartRequest 파일업로드를 처리하는 외부 라이브러리 객체 (cos2로 마이그레이션했었음)
		//					오류 발생시 cos.jar버전 확인 -> 마이크레이션 cos_2.jar삽입
		// request : 사용자의 요청 객체
		// realFolder : 파일이 저장될 서버의 경로
		// maxSize : 파일의 용량 제한
		// encType : 인코딩 방식
		// DefaultFileRenamePolicy(): 파일 이름이 중복될 경우 자동으로 이름을 바꿔주는 클래스
		
		//enctype="multipart/form-data" 는 request영역이 아닌 multipartRequest으로 변경해야한다.
		String bookId=multipartRequest.getParameter("bookId");
		String name=multipartRequest.getParameter("name");
		String unitPrice=multipartRequest.getParameter("unitPrice");
		String author=multipartRequest.getParameter("author");
		String publisher=multipartRequest.getParameter("publisher");
		String releaseDate=multipartRequest.getParameter("releaseDate");
		String description=multipartRequest.getParameter("description");
		String category=multipartRequest.getParameter("category");
		String unitsInStock=multipartRequest.getParameter("unitsInStock");
		String condition=multipartRequest.getParameter("condition"); //post로 전달받은 값을 가져온다.
		
		
		
		// 다중 파일용 파일명 가져오기 Enumeration		
		Enumeration files=multipartRequest.getFileNames();	//업로드된 파일명들을 모두 가져온다
		
		String fname=(String) files.nextElement();			// 요소 값이 있으면 String으로 강제 타입변환 후 fname에 넣는다.
		
		String fileName=multipartRequest.getFilesystemName(fname); 
		
//  	<form name="newBook" action="./processAddBook.jsp" 
//		class="form-horizontal" method="post" enctype="multipart/form-data">
		
// 		multipartRequest로 가져온 파일명을 파일명을 가져와 변수에 넣는다
		
		// Enumeration 		 : form에 첨부된 파일 name들을 하나씩 가져오는도구
		// 열거, 하나씩 나열 	   모든 요소를 하나씩 꺼낸다. 반복해서 값들을 모두 출력할 때 사용
		// 					   (form안에 뭐가 담겨서 왔는지 전부 꺼내서 보여주는 자바 도구임)
		
		// nextElement() 	: 꺼낼 파일이 있으면 실제 값을 꺼낸다.
		// hasMoreElements() : 꺼낼 요소가 있는지 확인
		
		int price;
		
		if(unitPrice.isEmpty())
			price=0;
		else
			price=Integer.valueOf(unitPrice); 
			//String타입으로 받은 unitPrice을 Integer. 객체로 Int 타입으로 변환
			
		
		long stock;
			
		if(unitsInStock.isEmpty())
			stock=0;
		else
			stock=Long.valueOf(unitsInStock);
		
		BookRepository dao=BookRepository.getInstance();
		
		Book newBook=new Book(); 	// Book타입의 빈객체를 생성한다.
		newBook.setBookId(bookId);  // newBook에 MultipartRequest로 가져온 값을 객체에 넣는다.
		newBook.setName(name);
		newBook.setUnitPrice(price);
		newBook.setAuthor(author);
		newBook.setPublisher(publisher);
		newBook.setReleaseDate(releaseDate);
		newBook.setDescription(description);
		newBook.setCategory(category);
		newBook.setUnitsInStock(stock);
		newBook.setCondition(condition);
		newBook.setFilename(filename);
		
		System.out.print(newBook.toString());
		dao.addBook(newBook); // 만들어진 객체를 리스트 배열에 넣는다.
		response.sendRedirect("books.jsp"); // 성공시 강제로 이동하는 페이지
		
		
	%>
