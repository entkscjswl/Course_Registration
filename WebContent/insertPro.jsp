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
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String lecturer = request.getParameter("lecturer");
	String credit = request.getParameter("credit");
	String week = request.getParameter("week");
	String start_hour = request.getParameter("start_hour");
	String end_end = request.getParameter("end_end");
	
	MemberVO vo = new MemberVO();
	vo.setId(id);
	vo.setName(name);
	vo.setLecturer(lecturer);
	vo.setCredit(credit);
	vo.setWeek(week);
	vo.setStart_hour(start_hour);
	vo.setEnd_end(end_end);
	dao.insert(vo);
%>
<script>
	alert("등록에 성공하였습니다 ㅋㅋ");
	location.href="list.jsp";
</script>
</body>
</html>