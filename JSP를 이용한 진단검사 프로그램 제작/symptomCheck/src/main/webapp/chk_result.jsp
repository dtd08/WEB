<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<%
	String sql = "select P.p_no, P.p_name, T.t_name, to_char(R.t_sdate, 'yyyy-mm-dd') as t_sdate, case R.t_status when '1' then '검사중' when '2' then '검사완료' end as t_status, to_char(R.t_ldate, 'yyyy-mm-dd') as t_ldate, case R.t_result when 'X' then '미입력' when 'P' then '양성' when 'N' then '음성' end as t_result from tbl_patient_202004 P, tbl_lab_test_202004 T, tbl_result_202004 R	where P.p_no = R.p_no and T.t_code = R.t_code order by P.p_no";	
	
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check Result</title>
<link rel="stylesheet" href="css/style.css?abc" />
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<section class="section">
		<h2>검사결과조회</h2>
		<table class="table_line">
			<tr class="colored">
				<th>환자번호</th>
				<th>환자성명</th>
				<th>검사명</th>
				<th>검사시작일</th>
				<th>검사상태</th>
				<th>검사종료일</th>
				<th>검사결과</th>
			</tr>
		<% while(rs.next()) { %>
			<tr class="center">
				<td><%= rs.getString("p_no") %></td>
				<td><%= rs.getString("p_name") %></td>
				<td><%= rs.getString("t_name") %></td>
				<td><%= rs.getString("t_sdate") %></td>
				<td><%= rs.getString("t_status") %></td>
				<td><%= rs.getString("t_ldate") %></td>
				<td><%= rs.getString("t_result") %></td>
			</tr>
		<% } %>
		</table>
	</section>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>