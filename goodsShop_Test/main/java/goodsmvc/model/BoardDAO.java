package goodsmvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import goodsmvc.database.DBConnection;

public class BoardDAO {
	// DAO의 역할 : 브라우저의 요청을 컨트롤러에게 전달받아 처리한다.
	//				컨트롤러에게 전달받은 요청을 DB와 연동하여 처리

		private static BoardDAO instance;
		
		private BoardDAO() {
			
		}
		
		public static BoardDAO getInstance() { 
			if(instance == null)
					instance = new BoardDAO();			
			return instance;
		}
		
		
		
		//Board Table 갯수 가져오기 (검색)
		public int getListCount(String items, String text) {
			// items : b_subject, b_name, b_content
			// text  : input name (검색용)
			// items는 프론트의 게시판 목록 검색용 class name
			// text 는 프론트의 게시판 목록 검색용 input name
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int x = 0;
			String sql;
			
			 // items가 허용된 컬럼명이 아니면 검색 조건 제거
		    if (items == null || !Arrays.asList("b_subject", "b_name", "b_content").contains(items)) {
		        items = null;
		        text = null;
		    }

		    // SQL문 구성
		    if (items == null || text == null || text.trim().isEmpty()) {
		        sql = "SELECT count(*) FROM board";
		    } else {
		        sql = "SELECT count(*) FROM board WHERE " + items + " LIKE ?";
		    }

		    try {
		        conn = DBConnection.getConnection();
		        pstmt = conn.prepareStatement(sql);
		        
		        if (items != null && text != null && !text.trim().isEmpty()) {
		            pstmt.setString(1, "%" + text + "%");
		        }

		        rs = pstmt.executeQuery();
		        if (rs.next()) {
		            x = rs.getInt(1);
		        }
		    } catch (Exception ex) {
		        System.out.println("getListCount() 레코드수 : " + ex);
		    } finally {
		        try {
		            if (rs != null) rs.close();
		            if (pstmt != null) pstmt.close();
		            if (conn != null) conn.close();
		        } catch (Exception ex) {
		            throw new RuntimeException(ex.getMessage());
		        }
		    }

		    return x;
		}
			
		
/*			if(items == null && text == null)
				sql = "select  count(*) from board";
			else
				sql = "SELECT   count(*) FROM board where " + items + " like '%" + text + "%'";
			
			try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next())
					x = rs.getInt(1);
			} catch (Exception ex) {
				System.out.println("getListCount() 레코드수 : " + ex); 
			} finally {
				try {
					if(rs != null)
						rs.close();
					if(pstmt != null)
						pstmt.close();
					if(conn != null)
						conn.close();
				} catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}
				
			}
return x;			
		}*/
		
		//BoardTable 레코드 가져오기
		public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text){
			//컨트롤러 requestBoardView 메서드에서 page=pageNum , limit = LISTCOUNT;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int total_record = getListCount(items, text) ; // DAO의 getListCount에서 가져온 레코드의 수
			int start = (page -1) * limit;
			int index = start +1;
			
			String sql;
			
			 // items가 허용된 컬럼명이 아니면 검색 조건 제거
		    if (items == null || !Arrays.asList("b_subject", "b_name", "b_content").contains(items)) {
		        items = null;
		        text = null;
		    }

		    
		    if (items == null || text == null || text.trim().isEmpty()) {
		        sql = "SELECT * FROM board ORDER BY num DESC";
		    } else {
		        sql = "SELECT * FROM board WHERE " + items + " LIKE ? ORDER BY num DESC";
		    }

		    ArrayList<BoardDTO> list = new ArrayList<>();

		    try {
		        conn = DBConnection.getConnection();
		        pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

		        if (items != null && text != null && !text.trim().isEmpty()) {
		            pstmt.setString(1, "%" + text + "%");
		        }

		        rs = pstmt.executeQuery();

		        while (rs.absolute(index)) {
		            BoardDTO board = new BoardDTO();
		            board.setNum(rs.getInt("num"));
		            board.setId(rs.getString("b_id"));
		            board.setB_name(rs.getString("b_name"));
		            board.setB_subject(rs.getString("b_subject"));
		            board.setB_content(rs.getString("b_content"));
		            board.setB_regist_day(rs.getString("b_regist_day"));
		            board.setB_hit(rs.getInt("b_hit"));
		            board.setB_ip(rs.getString("b_ip"));
		            list.add(board);

		            if (index < (start + limit) && index <= total_record)
		                index++;
		            else
		                break;
		        }

		        return list;

		    } catch (Exception ex) {
		        System.out.println("getBoardList() 에러: " + ex);
		    } finally {
		        try {
		            if (rs != null) rs.close();
		            if (pstmt != null) pstmt.close();
		            if (conn != null) conn.close();
		        } catch (Exception ex) {
		            throw new RuntimeException(ex.getMessage());
		        }
		    }

		    return null;
		}
			
			
			
/*			if(items == null && text == null)
				sql = "select * from board ORDER BY num DESC";
			else
				sql = "SELECT  * FROM board where " + items + " like '%" + text + "%' ORDER BY num DESC ";
		
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				rs = pstmt.executeQuery();
				
				while(rs.absolute(index)) {
					 BoardDTO board = new BoardDTO();
					 board.setNum(rs.getInt("num"));
					 board.setId(rs.getString("b_id"));
					 board.setB_name(rs.getString("b_name"));
					 board.setB_subject(rs.getString("b_subject"));
					 board.setB_content(rs.getString("b_content"));
					 board.setB_regist_day(rs.getString("b_regist_day"));
					 board.setB_hit(rs.getInt("b_hit"));
					 board.setB_ip(rs.getString("b_ip"));
					 list.add(board);
					 if(index < (start + limit) && index<= total_record)
						 index++;
					 else
						 break;
				}
				return list;
			} catch (Exception ex) {
				System.out.println("getBoardList()" + ex);
			} finally {
				try {
					if(rs != null)
						rs.close();
					if(pstmt != null)
						pstmt.close();
					if(conn != null)
						conn.close();
				} catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}
			}
			return null;
		}
		*/
		//member테이블에서 인증된 id의 사용자명 가져오기
		public String getLoginNameById(String id) {
			Connection conn=null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String name = null;
			String sql = "select * from member where b_id =?";
			
			try {		
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next())
					name = rs.getString("b_name");
				
				return name;
				
			} catch (Exception ex) {
				System.out.println("getLoginNameById() : " + ex);
			} finally {
				try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				} catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}
			}
			return null;
		}
		
		
		//board테이블에 새로운 글 삽입하기
		public void insertBoard (BoardDTO board) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			System.out.println("insertBoard 메서드 호출 ");
			try {
				conn = DBConnection.getConnection();
				String sql = "INSERT INTO board (b_id, b_name, b_subject, b_content, b_regist_day, b_hit, b_ip) VALUES (?, ?, ?, ?, ?, ?, ?)";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, board.getId());
				pstmt.setString(2, board.getB_name());
				pstmt.setString(3, board.getB_subject());
				pstmt.setString(4, board.getB_content());
				pstmt.setString(5, board.getB_regist_day());
				pstmt.setInt(6, board.getB_hit());
				pstmt.setString(7, board.getB_ip());
				
				System.out.println("insertBoard 메서드 호출 후 ");
				System.out.println("ID: " + board.getId());
				System.out.println("Name: " + board.getB_name());
				System.out.println("Subject: " + board.getB_subject());
				System.out.println("Content: " + board.getB_content());
				System.out.println("Date: " + board.getB_regist_day());
				System.out.println("Hit: " + board.getB_hit());
				System.out.println("IP: " + board.getB_ip());
				
				
				pstmt.executeUpdate();
			} catch (Exception ex) {
				System.out.println("insertBoard :" + ex);
			} finally {
				
				try {
					if (pstmt != null)
						pstmt.close();
					if(conn != null)
						conn.close();
				} catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}

			}
	
		}
		
		//선택된 글의 조회수 증가시키기
		public void updateHit(int num) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = DBConnection.getConnection();
				
				String sql = "select b_hit from board where num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				int hit = 0;
				
				if(rs.next())
					hit = rs.getInt("b_hit") + 1;
				
				sql = "update board set b_hit=? where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, hit);
				pstmt.setInt(2, num);
				pstmt.executeUpdate();
				
			} catch (Exception ex) {
				System.out.println("updateHit ()실행 : " + ex);
				
			} finally {
				try {
					if(rs != null)
						rs.close();
					if(pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}			
			}
		}
		
		// 선택된 글 상세 내용 가져오기
		public BoardDTO getBoardByNum(int num, int page, String b_id) {
			Connection conn = null;
			PreparedStatement pstmt =null;
			ResultSet rs = null;
			BoardDTO board = null;
			
			updateHit(num); //위에 작성한 조회수증가 메서드
			String sql = "select * from board where num = ?";
			
			try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					board = new BoardDTO();
					board.setId(rs.getString("b_id"));
					board.setNum(rs.getInt("num"));
					board.setB_name(rs.getString("b_name"));
					board.setB_subject(rs.getString("b_subject"));
					board.setB_content(rs.getString("b_content"));
					board.setB_regist_day(rs.getString("b_regist_day"));
					board.setB_hit(rs.getInt("b_hit"));
					board.setB_ip(rs.getString("b_ip"));	
				}
				return board;
			} catch (Exception ex) {
				System.out.println("getBoardByNum() : " + ex);
			} finally {
				try {
					if(rs != null)
						rs.close();
					if(pstmt != null)
						pstmt.close();
					if(conn != null)
						conn.close();
				} catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}
			}
			return null;
		}
		
		//선택된 글 내용 수정하기  
	public void updateBoard(BoardDTO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update board set b_name=?, b_subject=?, b_content=? where num=?";
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			conn.setAutoCommit(false);
			
			pstmt.setString(1, board.getB_name());
			pstmt.setString(2, board.getB_subject());
			pstmt.setString(3, board.getB_content());
			pstmt.setInt(4, board.getNum());
			
			pstmt.executeUpdate();
			conn.commit();
			
		} catch (Exception ex) {
			System.out.println("updateBoard() : " + ex);
		} finally {
			
			try {
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}
	
	
		// 삭제하기
	public void deleteBoard(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete from board where num=?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception ex) {
			System.out.println("deleteBoard () : " +ex);
		} finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
			
		}
	}
	
		
}// class종료
