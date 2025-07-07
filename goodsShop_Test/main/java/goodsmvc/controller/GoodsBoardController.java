package goodsmvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.compiler.NewlineReductionServletWriter;

import goodsmvc.model.BoardDAO;
import goodsmvc.model.BoardDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GoodsBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5;
	// 컨트롤러의 역할 : 브라우저에게 요청을 받는다. 받은 요청을 DAO에게 전달하여 처리한다.
	//					  DAO 에게 전달 받은 값을 브라우저로 보낸다
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request, response);
	}

	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String uri = request.getRequestURI(); // 전체 URI
		String command = uri.split(";")[0].substring(request.getContextPath().length());
		/* String command = RequestURI.substring(contextPath.length()); */
		// split(";")[0]로 jsessionid 제거 후 substring() 적용
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		System.out.println("command : " + command); // 확인용
		
		if (command.equals("/BoardListAction.do")) { // 등록된 글 목록 페이지 출력하기
			requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardList.jsp");
			rd.forward(request, response);
			
		}else if (command.equals("/BoardWriteForm.do")) { // 글 등록 페이지 출력
			requestLoginName(request);
			RequestDispatcher rd = request.getRequestDispatcher("/board/writeForm.jsp");
			rd.forward(request, response);
		}else if (command.equals("/board/BoardWriteAction.do")) { // 새로운 글 등록 insert
			requestBoardWrite(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);	
		}else if (command.equals("/BoardViewAction.do")) { // 선택된 글 상세 페이지 가져오기
			requestBoardView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardView.do");
			rd.forward(request, response);			
		}else if (command.equals("/BoardView.do")) { // 상세페이지 출력에 작성자 수정, 삭제버튼 
			requestBoardView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/board/view.jsp");
			rd.forward(request, response);
		}else if(command.equals("/BoardUpdateAction.do")) { // 선택된 글 수정하기
			requestBoardUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/board/update.jsp"); //update.jsp로 이동
			rd.forward(request, response);
			
		}else if (command.equals("/BoardDeleteAction.do")) { // 선택된 글 삭제하기
			requestBoardDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
			
		}
			
		
	}

	

	public void requestBoardView(HttpServletRequest request) {
		// 선택된 글 상세 페이지 가져오기
		System.out.println("BoardView () 메서드 시작");
		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String b_id="";

		BoardDTO board = new BoardDTO();		
		
		board = dao.getBoardByNum(num, pageNum, b_id);
		b_id = board.getId(); //board에서 getId를 안해서 값이 계속 안들어갔었음.
		
		request.setAttribute("b_id", b_id);
		System.out.println("requestBoardView :" +b_id);
		request.setAttribute("num", num);
		request.setAttribute("page", pageNum);
		request.setAttribute("board", board);
		request.setAttribute("b_id", b_id); //작성자용 set 추가
		
	}

	public void requestBoardList(HttpServletRequest request) {
		// 등록된 글 목록 가져오기 메서드
		BoardDAO dao = BoardDAO.getInstance();
		ArrayList<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		
		int pageNum =1;
		int limit =LISTCOUNT;
		
		
		if(request.getParameter("pageNum") != null)
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		if (items == null || !List.of("b_subject", "b_name", "b_content").contains(items)) {
		    items = null;
		    text = null;
		}
		
		int total_record=dao.getListCount(items, text);
		boardlist = dao.getBoardList(pageNum, limit, items, text);
		
		int total_page;
		
		if(total_record % limit == 0) {
			total_page = total_record/limit;
			Math.floor(total_page);
		}
		else {
			total_page = total_record/limit;
			Math.floor(total_page);
			total_page= total_page +1;
		}
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_record", total_record);
		request.setAttribute("boardlist", boardlist);
	}
	

	
	// 인증된 사용자명 가져오기
	public void requestLoginName(HttpServletRequest request) {
		System.out.println("requestLoginName () :" );
		String id = request.getParameter("id");
		BoardDAO dao = BoardDAO.getInstance();
		String name = dao.getLoginNameById(id);
		request.setAttribute("name", name);
		System.out.println("requestLoginName () :" +name );
	}
	
	//새로운 글 등록하기
	public void requestBoardWrite(HttpServletRequest request) { // 글 등록 메서드
		BoardDAO dao = BoardDAO.getInstance();
		
		System.out.println("requestBoardWrite() 시작");
		BoardDTO board = new BoardDTO();
		board.setId(request.getParameter("id"));
		board.setB_name(request.getParameter("b_name"));
		board.setB_subject(request.getParameter("b_subject"));
		board.setB_content(request.getParameter("b_content"));
		
		System.out.println(request.getParameter("b_name"));
		System.out.println(request.getParameter("b_subject"));
		System.out.println(request.getParameter("b_content"));
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = formatter.format(new java.util.Date());
		
		board.setB_hit(0);
		board.setB_regist_day(regist_day);
		board.setB_ip(request.getRemoteAddr());
		
		dao.insertBoard(board);
		 System.out.println("insertBoard 호출 후 : " + dao.getBoardList(LISTCOUNT, LISTCOUNT, regist_day, regist_day));
	}
	
	
	//선택된 글 수정하기
		public void requestBoardUpdate(HttpServletRequest request) {
			System.out.println("requestBoardUpdat () 메서드 시작");
			BoardDAO dao = BoardDAO.getInstance();
			int num = Integer.parseInt(request.getParameter("num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			String b_id="";

			BoardDTO board = new BoardDTO();		
			
			board = dao.getBoardByNum(num, pageNum, b_id);
			b_id = board.getId(); //board에서 getId를 안해서 값이 계속 안들어갔었음.
			
			request.setAttribute("b_id", b_id);
			System.out.println("requestBoardView :" +b_id);
			request.setAttribute("num", num);
			request.setAttribute("page", pageNum);
			request.setAttribute("board", board);
			request.setAttribute("b_id", b_id); //작성자용 set 추가			
			
			board.setNum(num);
			board.setB_name(request.getParameter("b_name"));
			board.setB_subject(request.getParameter("b_subject"));
			board.setB_content(request.getParameter("b_content"));		
			
			 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
			 String regist_day = formatter.format(new java.util.Date()); 
			 
			 board.setB_hit(0);
			 board.setB_regist_day(regist_day);
			 board.setB_ip(request.getRemoteAddr());
			 
			 System.out.println("테스트 b_name 값: " + request.getParameter("b_name"));
			 System.out.println("테스트 b_content 값: " + request.getParameter("b_content"));
			 System.out.println("테스트\"b_subject\"값: " + request.getParameter("b_subject"));
			 dao.updateBoard(board);								
		}
		
		
		//선택된 글 삭제하기
		public void requestBoardDelete(HttpServletRequest request) {
			System.out.println("requestBoardDelete() 메서드시작");
			int num = Integer.parseInt(request.getParameter("num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			
			BoardDAO dao = BoardDAO.getInstance();
			dao.deleteBoard(num);
			System.out.println("requestBoardDelete : 삭제완료");
		}
	
}
