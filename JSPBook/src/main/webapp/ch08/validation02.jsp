<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>

<script type="text/javascript">
/* 기본 유효성검사 : 사용자가 폼 페이지의 입력 항목에 입력한 데이터 값을 확인한다 */
/* document.폼이름.입력양식이름.value==" " */
	function checkLogin() {
		var form=document.loginForm;
		if (form.id.value==""){
			alert("이름을 입력해주세요.");
			form.id.focus();
			return false;
		} else if (form.passwd.value==""){
			alert("비밀번호를 입력해주세요");
			form.passwd.focus();
			return false;	
		}
		form.submit();
	}
</script>
<body>								
	<form name="loginForm" action="validation02_process.jsp" method="post">
		<p> 아이디 : <input type="text" name="id">
		<p> 비밀번호 : <input type="password" name="passwd">
		<p> <input type="button" value="전송" onclick="checkLogin()">
	</form>

</body>
</html>