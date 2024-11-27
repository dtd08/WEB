<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<%
	String sql = "select v_name, ('19' || substr(v_jumin, 1, 2) || '년' || substr(v_jumin, 3, 2) || '월' || substr(v_jumin, 5, 2) || '일생' )as v_birth, (TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_DATE('19' || (substr(v_jumin, 1, 6)),'YYYYMMDD')) / 12)) as v_age, case substr(v_jumin,7,1) when '1' then '남' when '2' then '여' end as v_gender, m_no, (substr(v_time, 1,2) || ':' || substr(v_time, 3,2)) as v_time, case v_confirm when 'N' then '미확인' when 'Y' then '확인' end as v_confirm from tbl_vote_202005 where v_area='제1투표장' order by m_no";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Voting check List Page</title>
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
				<th>성별</th>
				<th>후보번호</th>
				<th>투표시간</th>
				<th>유권자확인</th>
			</tr>
			<% while(rs.next()) { %>
				<tr class="center">
					<td><%= rs.getString("v_name") %></td>
					<td><%= rs.getString("v_birth") %></td>
					<td>만<%= rs.getString("v_age") %>세</td>
					<td><%= rs.getString("v_gender") %></td>
					<td><%= rs.getString("m_no") %></td>
					<td><%= rs.getString("v_time") %></td>
					<td><%= rs.getString("v_confirm") %></td>
				</tr>
			<% } %>
		</table>
	</section>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>