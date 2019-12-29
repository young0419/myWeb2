<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="memberone.StudentDAO"/>

<%
	String id = request.getParameter("id");
	boolean check = dao.idCheck(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복체크</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
<style type="text/css">
body {
text-align: center;
}
</style>
</head>
<body bgcolor="#ffc">
<br>
<b><%=id %></b>
<%
	if(check){
		out.println("는 이미 존재하는 ID입니다.<br></br>");
	} else {
		out.println("는 사용 가능합니다<br></br>");
	}
%>
<a href="#" onClick="javascript:self.close()">닫기</a>
</body>
</html>