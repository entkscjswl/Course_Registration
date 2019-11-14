<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	MemberDAO dao = MemberDAO.getInstance();
	String del = request.getParameter("del");
	dao.delete(del);
%>
<script>
	alert("과목코드 <%=del%>의 정보가 삭제가 완료되었습니다");
	location.href="list.jsp";
</script>
</body>
</html>