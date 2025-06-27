<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Processing</title>
</head>
<body>
	<h3>회원가입</h3>
	<form action="form05_process.jsp" name="member" method="post">
		<!-- 액션태그를 사용하여 다른 페이지에서 실행 결과를 확인해보자 -->
	<p>아이디 : <input type="text" name="id"><input type="button" value="아이디 중복 검사">
	<p>비밀번호 : <input type="password" name="passwd">
	<p>이름 : <input type="text" name="name">
	<p>연락처 : <input type="text" maxlength="4" size="4" name="phone1">
			-<input type="text" maxlength="4" size="4" name="phone2">-
			<input type="text" maxlength="4" size="4" name="phone3">
	<p>성별 : <input type="radio" name="sex" value="남성" checked>남성
		<input type="radio" name="sex" value="여성">여성
	<p>취미 : 독서<input type="checkbox" name="hobby" value="독서">
	<p>운동 <input type="checkbox" name="hobby" value="운동">
	   영화 <input type="checkbox" name="hobby" value="영화">
	<p> <textarea name="comment" cols="30"
		rows="3" placeholder="가입인사를 입력해주세요"></textarea>
	<p> <input type="submit" value="가입하기">
		<input type="reset" value="다시쓰기">
	</form>

</body>
</html>