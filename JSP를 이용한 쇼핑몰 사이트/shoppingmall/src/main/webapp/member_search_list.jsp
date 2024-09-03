<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<%
	int search = Integer.parseInt(request.getParameter("search"));
	String sql = "select custno, custname, phone, address, joindate, "
				+ "case grade when 'A' then 'VIP' when 'B' then '일반' when 'C' then '직원' end as grade,"
				+ "city from member_tbl_02 where custno = " + search;
	
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회 결과</title>
<link rel="stylesheet" href="css/style.css?abc">
</head>
<body>
	<header><jsp:include page="layout/header.jsp"></jsp:include></header>
	<nav><jsp:include page="layout/nav.jsp"></jsp:include></nav>
	<section class="section">
		<h2>회원 조회 결과</h2>
		
		<% if(rs.next()) {%>
			<table class="table_line">
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>회원전화</th>
					<th>회원주소</th>
					<th>가입일자</th>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<th>도서코드</th>
				</tr>
				<tr class="center">
					<td><%= rs.getString("custno") %></td>
					<td><%= rs.getString("custname") %></td>
					<td><%= rs.getString("phone") %></td>
					<td><%= rs.getString("address") %></td>
					<td><%= rs.getString("joindate") %></td>
					<td><%= rs.getString("grade") %></td>
					<td><%= rs.getString("city") %></td>
				</tr>
				<tr class="center">
					<td colspan="7">
						<input type="button" value="홈으로" onclick="location.href='index.jsp'">
						<input type="button" value="다시 조회" onclick="location.href='member_search.jsp'">
					</td>
				</tr>
			</table>
		<% } else { %>
			<p class="search_fail">
				회원번호 <%= search %>번을 찾지 못했습니다.
				<br>
				<br>
				<input type="button" value="다시 조회" onclick="location.href='member_search.jsp'">
			</p>
		<% } %>
	</section>
	<footer><jsp:include page="layout/footer.jsp"></jsp:include></footer>
</body>
</html>