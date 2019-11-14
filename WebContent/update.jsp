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
	String upd = request.getParameter("upd");
	MemberVO vo = dao.readOne(upd);
%>
	<fieldset>
		<fieldset>
			<h2>수강신청 도우미 사이트</h2>
		</fieldset>
		<fieldset>
			<h2>교과목 수정</h2>
			<form name="update" action="updatePro.jsp" method="post">
			<table border="1">
				<tr>
					<td>교과목 코드</td>
					<td><input type="text" id="id" name="id" value="<%=vo.getId()%>"></td>
				</tr>
				<tr>
					<td>과목명</td>
					<td><input type="text" id="name" name="name" value="<%=vo.getName()%>"></td>
				</tr>
				<tr>
					<td>담당강사</td>
					<td>
						<select id="lecturer" name="lecturer">
							<option value="1"<%if(vo.getLecturer().equals("1")){%> selected <%} %>>김교수</option>
							<option value="2"<%if(vo.getLecturer().equals("2")){%> selected <%} %>>이교수</option>
							<option value="3"<%if(vo.getLecturer().equals("3")){%> selected <%} %>>박교수</option>
							<option value="4"<%if(vo.getLecturer().equals("4")){%> selected <%} %>>우교수</option>
							<option value="5"<%if(vo.getLecturer().equals("5")){%> selected <%} %>>최교수</option>
							<option value="6"<%if(vo.getLecturer().equals("6")){%> selected <%} %>>강교수</option>
							<option value="7"<%if(vo.getLecturer().equals("7")){%> selected <%} %>>황교수</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>학점</td>
					<td><input type="text" id="credit" name="credit" value="<%=vo.getCredit()%>"></td>
				</tr>
				<tr>
					<td>요일</td>
					<td>
						<input type="radio" name="week" value="1" <%if(vo.getWeek().equals("1")){%> checked <%} %>>월
						<input type="radio" name="week" value="2" <%if(vo.getWeek().equals("2")){%> checked <%} %>>화
						<input type="radio" name="week" value="3" <%if(vo.getWeek().equals("3")){%> checked <%} %>>수
						<input type="radio" name="week" value="4" <%if(vo.getWeek().equals("4")){%> checked <%} %>>목
						<input type="radio" name="week" value="5" <%if(vo.getWeek().equals("5")){%> checked <%} %>>금
						<input type="radio" name="week" value="6" <%if(vo.getWeek().equals("6")){%> checked <%} %>>토
					</td>
				</tr>
				<tr>
					<td>시작</td>
					<td><input type="text" id="start_hout" name="start_hour" value="<%=vo.getStart_hour()%>"></td>
				</tr>
				<tr>
					<td>종료</td>
					<td><input type="text" id="end_end" name="end_end" value="<%=vo.getEnd_end()%>"></td>
				</tr>
			</table><br>
			<input type="button" value="목록" onclick="location.href='list.jsp'">
			<input type="button" value="취소" onclick="location.href='list.jsp'">
			<input type="submit" value="완료">
			</form>
		</fieldset>
		<fieldset>
			<h5>Copyright (C) 2018 정보처리산업기사 All Right Reserved</h5>
		</fieldset>
	</fieldset>
</body>
</html>