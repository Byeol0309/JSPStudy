# JSPStudy
JSP, 서블릿, JSTL, 톰켓


----------------------------------------
             jsp 셋팅 순서
----------------------------------------
1. 윈도우에 jdk 11~17버전 설치(오라클홈페이지, java)
2. 시스템 환경 변수 설정
   - 시작 우클릭 -> 시스템 -> 고급 시스템 설정
   - 시스템 변수 -> 새로 만들기 -> JAVA_HOME -> JDK설치경로
   - Path 추가 -> %JAVA_HOME%\bin (어디서나 javac 명령어 실행)
   - cmd -> javac -version -> 자바 버전 출력이 되야 한다.

3. 톰켓 설치 (9버전 : javax , 10버전이상 : 자카르타)
   - 크롬 -> 톰켓 -> tomcat.apache.org -> 9버전 다운
     - msi 버전 : 설치용
     - zip : 압축 풀어 설치용
   - 설치시 경로 변경 할 것 (d:\tomcat)
     -> http/1.1 포트변경(8000), 관리자 포트(8001)

4. 이클립스 설치 
   - 크롬 -> 이클립스 검색 -> www.eclipse.org
   - 최신버전 설치 -> JAVA EE용 으로 설치 할 것(JSP 지원)

5. 방화벽 설치 (외부에서 접속하기 위한 포트 오픈)
   - 실행 -> WF.MSC -> 인바운드 우클릭 -> 새규칙
   - 포트 -> TCP/8000 -> 이름작성 -> 완료(나머지 기본값)
   - 오른쪽 서브메뉴에서 새로 고침

6. 이클립스 실행 
   - 퍼스팩 티브 -> JAVA EE 확인
   - 파일 -> 새로만들기 -> Other -> Server -> Apache 
   -> Tomcat v9.0 Server -> host name 이름 작성
   -> Tomcat Server 창에서 Browse 에서 위에서 저장한 톰켓 경로 지정
   -> jre 선택
   -> 하단 메뉴에 Server 탭 생성 -> 10-1 서버 더블클릭 
      : Posts 메뉴에 admin port : 8001 , HTTP/1.1 8000 으로 지정 확인 (저장)

7. JSP용 프로젝트 생성
   - 파일 -> New -> Dynamic Web Project  -> Project Name 입력 
   -> Target runtime (톰켓 9.x 연결), Working Sets 체크해제 -> next -> java 저장경로확인
   -> Web Module (Context root : 프로젝트명 ,  Webapp : 정적파일 저장 위치확인)
   -> web.xml 체크(필수, was 톰켓이 관장하는 파일) -> 완료
   -> Server탭 -> 톰켓 우클릭 -> add -> 현재 프로젝트 추가

8. 이클립스 한글지원 (UTF-8 셋팅)
   - Window메뉴 -> Preferences -> web 항목 -> css, html, jsp 등을 UTF-8로 변경
   - 생성한 프로젝트 우클릭 -> Properties -> Resource 항목 -> Text file encoding(utf-8)

9. JDBC 연결

