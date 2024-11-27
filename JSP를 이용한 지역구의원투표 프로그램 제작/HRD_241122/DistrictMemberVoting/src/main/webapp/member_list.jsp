<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<%
	String sql = "select m.m_no, m.m_name, p.p_name, case m.p_school when '1' then '고졸' when '2' then '학사' when '3' then '석사' when '4' then '박사' end as p_school, ( substr(m.m_jumin,1,6) || '-' || substr(m.m_jumin,7,7) ) as m_jumin , m.m_city, ( p.p_tel1 || '-' || p.p_tel2 || '-' || p.p_tel3 ) as p_tel from tbl_member_202005 m, tbl_party_202005 p where m.p_code = p.p_code";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
<link rel="stylesheet" href="css/style.css?abc">
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<section class="section">
		<h2>후보조회</h2>
		<table class="table_line">
			<tr class="colored">
				<th>후보번호</th>
				<th>성명</th>
				<th>소속정당</th>
				<th>학력</th>
				<th>주민번호</th>
				<th>지역구</th>
				<th>대표전화</th>
			</tr>
			<% while(rs.next()) { %>
				<tr class="center">
					<td><%= rs.getString("m_no") %></td>
					<td><%= rs.getString("m_name") %></td>
					<td><%= rs.getString("p_name") %></td>
					<td><%= rs.getString("p_school") %></td>
					<td><%= rs.getString("m_jumin") %></td>
					<td><%= rs.getString("m_city") %></td>
					<td><%= rs.getString("p_tel") %></td>
				</tr>
			<% } %>
		</table>
	</section>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>