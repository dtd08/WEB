<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<%
	String sql = "select P.p_city, case P.p_city when '10' then '서울' when '20' then '경기' when '30' then '강원' when '40' then '대구' end as p_city_name, count(R.p_no) as l_cnt from tbl_patient_202004 P, tbl_result_202004 R where P.p_no = R.p_no group by P.p_city order by p_city";
	
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Local Check Count</title>
<link rel="stylesheet" href="css/style.css?abc" />
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<section class="section">
		<h2>(지역별)검사건수통계</h2>
		<table class="table_line">
			<tr class="colored">
				<th>지역코드</th>
				<th>지역명</th>
				<th>검사건수</th>
			</tr>
		<% while(rs.next()) { %>
			<tr class="center">
				<td><%= rs.getString("p_city") %></td>
				<td><%= rs.getString("p_city_name") %></td>
				<td><%= rs.getString("l_cnt") %></td>
			</tr>
		<% } %>
		</table>
	</section>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>