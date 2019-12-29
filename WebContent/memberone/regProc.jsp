<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="memberone.StudentDAO"/>    
<jsp:useBean id="vo" class="memberone.StudentVO"/>
<jsp:setProperty property="*" name="vo"/>
<%
	request.setCharacterEncoding("utf-8");
	boolean flag = dao.memberInsert(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 확인</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
body {
	text-align: center;
}
</style>
</head>
<body bgcolor="#ffc">
<br><br>
<%
	if(flag) {
		out.println("<b>회원가입을 축하 드립니다.</b><br>");
		out.println("<a href=login.jsp>로그인</a>");
	} else{
		out.println("<b>다시 입력하여 주십시오</b><br>");
		out.println("<a href=regForm.jsp>다시 가입</a>");
	}
%>
</body>
</html>