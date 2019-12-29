<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*, memberone.*"%>
<jsp:useBean id="dao" class="memberone.StudentDAO"/>
<%
	request.setCharacterEncoding("utf-8");
	String check = request.getParameter("check");
	String dong = request.getParameter("dong");
	Vector<ZipCodeVO> zipcodeList = dao.zipcodeRead(dong);
	int totList = zipcodeList.size();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 찾기</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
<style>
body{
text-align: center;
}
table {
margin: 0 auto;
}
</style>
<script type="text/javascript">
	function sendAddress(zipcode,sido,gugun,dong,ri,bunji) {
		var address = sido + " " + gugun + " " + dong + " " + ri + " " + bunji;
		opener.document.regForm.zipcode.value=zipcode;
		opener.document.regForm.address1.value=address;
		self.close();
	}
</script>
</head>
<body bgcolor="#ffc">
	<b>우편 번호 찾기</b>
	<form action="zipCheck.jsp" name="zipForm" method="post">
		<table>
			<tr>
				<td>동이름 입력  : <input name="dong" type="text"/><input type="button" value="검색" onclick="dongCheck()"/></td>
			</tr>
		</table>
		<input type="hidden" name="check" value="n">
	</form>
	<table>
		<%
			if(check.equals("n")) {
				if(zipcodeList.isEmpty()) {
		%>
		<tr><td align="center"><br/>검색된 결과가 없습니다.</td></tr>
	    <%
				} else {
	    %>
	    <tr><td align="center"><br>※ 검색 후 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td></tr>
	    <%
	    			for(int i = 0; i < totList; i++){
	    				ZipCodeVO vo = zipcodeList.elementAt(i);
	    				String tmpZipcode = vo.getZipcode();
	    				String tmpSido = vo.getSido();
	    				String tmpGugun = vo.getGugun();
	    				String tmpDong = vo.getDong();
	    				String tmpRi = vo.getRi();
	    				String tmpBunji = vo.getBunji();
	    				if(tmpRi == null) tmpRi = " ";
	    				if(tmpBunji == null) tmpBunji = " ";
	    %>
	    <tr>
	    	<td><a href="javascript:sendAddress('<%=tmpZipcode%>','<%=tmpSido%>','<%=tmpGugun%>','<%=tmpDong%>','<%=tmpRi%>','<%=tmpBunji%>')"><%=tmpZipcode%>&nbsp;<%=tmpSido%>&nbsp;<%=tmpGugun%>&nbsp;<%=tmpDong%>&nbsp;<%=tmpRi%>&nbsp;<%=tmpBunji%></a><br>
	    	<%
	    			}//end for
				} //end else
			} //end if
	    	%>
	    	</td>
	    </tr>	
		<tr>
			<td align="center"><a href="javascript:this.close();">닫기</a></td>
		</tr>
	</table>
</body>
</html>