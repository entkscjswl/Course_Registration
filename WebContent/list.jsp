<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.*" %>
<%@ page import="java.util.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css.css?ver=1">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	MemberDAO dao = MemberDAO.getInstance();
	ArrayList<MemberVO> mvo = dao.memberList();
%>
	<fieldset>
		<fieldset class="header">
			<h2>수강신청 도우미 사이트</h2>
		</fieldset>
		<fieldset>
		<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;총 <%=dao.count() %>개의 교과목이 있습니다.</h4>
			<table border="1">
				<tr>
					<td>과목코드</td>
					<td>과목명</td>
					<td>학점</td>
					<td>담당강사</td>
					<td>요일</td>
					<td>시작시간</td>
					<td>종료시간</td>
					<td>관리</td>
				</tr>
				<%for(MemberVO m : mvo) {%>
				<tr>
					<td><%=m.getId() %></td>
					<td><%=m.getName() %></td>
					<td><%=m.getCredit() %></td>
					<td><%=m.getLname() %></td>
					<td>
					<%if(m.getWeek().equals("1")){
							out.print("월");
						}else if(m.getWeek().equals("2")){
							out.print("화");
						}else if(m.getWeek().equals("3")){
							out.print("수");
						}else if(m.getWeek().equals("4")){
							out.print("목");
						}else if(m.getWeek().equals("5")){
							out.print("금");
						}else if(m.getWeek().equals("6")){
							out.print("토");
						}
						%>
					</td>
					<td><%=m.getStart_hour() %></td>
					<td><%=m.getEnd_end() %></td>
					<td><a href="update.jsp?upd=<%=m.getId()%>">수정</a> / <a href="delete.jsp?del=<%=m.getId()%>">삭제</a></td>
				</tr>
				<%} %>
			</table><br>
			<input type="button" class="button" value="작성" onclick="location.href='insert.jsp'">
		</fieldset>
		<fieldset>
			<h5>Copyright (C) 2018 정보처리산업기사 All Right Reserved</h5>
		</fieldset>
	</fieldset>
</body>
</html>