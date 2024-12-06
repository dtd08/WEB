<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<%
	String sql = "select m.m_no, m.m_name, count(v.v_jumin) as m_rank from tbl_vote_202005 v, tbl_member_202005 m where v.m_no = m.m_no and v.v_confirm = 'Y' group by m.m_no, m.m_name	order by m_rank desc, m_no";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Rank List</title>
<link rel="stylesheet" href="css/style.css?abc">
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<section class="section">
		<h2>후보자등수</h2>
		<table class="table_line">
			<tr class="colored">
				<th>후보번호</th>
				<th>성명</th>
				<th>소속정당</th>
			</tr>
			<% while(rs.next()) { %>
				<tr class="center">
					<td><%= rs.getString("m_no") %></td>
					<td><%= rs.getString("m_name") %></td>
					<td><%= rs.getString("m_rank") %></td>
				</tr>
			<% } %>
		</table>
	</section>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>