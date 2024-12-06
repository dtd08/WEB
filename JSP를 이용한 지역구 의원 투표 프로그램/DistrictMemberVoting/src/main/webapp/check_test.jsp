<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<%
	String sql = "select m.m_no, m.m_name, v.v_name from tbl_vote_202005 v, tbl_member_202005 m where v.m_no = m.m_no group by m.m_no, m.m_name, v.v_name order by m_no";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내용 확인 페이지</title>
<link rel="stylesheet" href="css/style.css?abc">
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<section class="section">
		<h2>후보조회</h2>
		<table class="table_line">
			<tr class="colored">
				<th>성명</th>
				<th>생년월일</th>
				<th>나이</th>
			</tr>
			<% while(rs.next()) { %>
				<tr class="center">
					<td><%= rs.getString("m_no") %></td>
					<td><%= rs.getString("m_name") %></td>
					<td><%= rs.getString("v_name") %></td>
				</tr>
			<% } %>
		</table>
	</section>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>