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
	ArrayList<MemberVO> mvo = dao.lectureList();
%>
	<fieldset>
		<fieldset>
			<h2>수강신청 도우미 사이트</h2>
		</fieldset>
		<fieldset>
			<h2>교과목 추가</h2>
			<form name="insert" action="insertPro.jsp" method="post">
			<table border="1">
				<tr>
					<td>교과목 코드</td>
					<td><input type="text" id="id" name="id"></td>
				</tr>
				<tr>
					<td>과목명</td>
					<td><input type="text" id="name" name="name"></td>
				</tr>
				<tr>
					<td>담당강사</td>
					<td>
						<select id="lecturer" name="lecturer">
							<%for(MemberVO m : mvo) {%>
							<option value="<%=m.getIdx()%>"><%=m.getLname() %></option>
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<td>학점</td>
					<td><input type="text" id="credit" name="credit"></td>
				</tr>
				<tr>
					<td>요일</td>
					<td>
						<input type="radio" name="week" value="1">월
						<input type="radio" name="week" value="2">화
						<input type="radio" name="week" value="3">수
						<input type="radio" name="week" value="4">목
						<input type="radio" name="week" value="5">금
						<input type="radio" name="week" value="6">토
					</td>
				</tr>
				<tr>
					<td>시작</td>
					<td><input type="text" id="start_hout" name="start_hour"></td>
				</tr>
				<tr>
					<td>종료</td>
					<td><input type="text" id="end_end" name="end_end"></td>
				</tr>
			</table><br>
			<input type="button" value="목록" onclick="location.href='list.jsp'">
			<input type="submit" value="완료">
			</form>
		</fieldset>
		<fieldset>
			<h5>Copyright (C) 2018 정보처리산업기사 All Right Reserved</h5>
		</fieldset>
	</fieldset>
</body>
</html>