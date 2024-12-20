<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("utf-8");

	String sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?";
	
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("custname"));
	pstmt.setString(2, request.getParameter("phone"));
	pstmt.setString(3, request.getParameter("address"));
	pstmt.setDate(4, Date.valueOf(request.getParameter("joindate")));
	pstmt.setString(5, request.getParameter("grade"));
	pstmt.setString(6, request.getParameter("city"));
	pstmt.setString(7, request.getParameter("custno"));
	
	pstmt.executeUpdate();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="member_list.jsp"></jsp:forward>
</body>
</html>