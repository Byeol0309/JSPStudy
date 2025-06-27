package core;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberLocalServlet
 */
@WebServlet("/MemberLocalServlet")
public class MemberLocalServlet extends HttpServlet { //HttpServlet을 부모로한다
	int member_v = 0 ;
	// member_v는 MemberLocalServlet의 객체가 생성될 때 메모리가 할당된다.
	// heap영역에 메모리 영역 할당
	
	private static final long serialVersionUID = 1L;
	
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		int local_v = 0 ;
		// doGet()메서드 호출되어 수행하는 동안 stack영역에 메모리 할당된다. 
		// 메서드 호출이 끝나면 해제됨
		member_v++;
		local_v++;
		out.print("<h2>member_v(멤버변수) :" + member_v + "</h2>");
		out.print("<h2>local_v(지역변수) :" + local_v + "</h2>");
		out.close();		
	}

}
