package goodsmvc.model;

public class BoardDTO {
	// DTO 역할 : DAO에서 DB데이터를 전달받는다.

	private int num ; //게시글번호
	private String id ; // 회원
	private String b_name; //게시글작성자
	private String b_subject; //게시판제목
	private String b_content; //게시판 내용
	private String b_regist_day; // 게시글 작성일
	private int b_hit; 				//조회수
	private String b_ip; 			// 작성자 ip
	
	
	public int getNum() {
		return num;
	}
	public String getId() {
		return id;
	}
	public String getB_name() {
		return b_name;
	}
	public String getB_subject() {
		return b_subject;
	}
	public String getB_content() {
		return b_content;
	}
	public String getB_regist_day() {
		return b_regist_day;
	}
	public int getB_hit() {
		return b_hit;
	}
	public String getB_ip() {
		return b_ip;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public void setB_regist_day(String b_regist_day) {
		this.b_regist_day = b_regist_day;
	}
	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}
	public void setB_ip(String b_ip) {
		this.b_ip = b_ip;
	}
	
	
	
}
