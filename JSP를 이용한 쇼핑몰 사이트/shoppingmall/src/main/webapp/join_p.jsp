<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="DB.DBConnect" %>
<%@ page import="java.sql.*" %>
<%
	//오라클의 문자 인코딩을 utf-8로 설정함 => 한글 깨짐 방지 (데이터 삽입 시 필수)
	request.setCharacterEncoding("utf-8");
	
	// sql 변수 선언 후 쿼리문 형태의 문자열 저장, 삽입 쿼리문에 입력 데이터 자리 7개 준비
	String sql = "insert into member_tbl_02 values(?,?,?,?,?,?,?)";
	
	// DB 연결 & 쿼리문 생성
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	// 화면(웹 브라우저)으로부터 사용자가 입력한 회원정보 데이터 7개를 쿼리문 각자리에 셋팅
	pstmt.setInt(1, Integer.parseInt(request.getParameter("custno")));	// setInt(파리미터 자리, 값)  // 화면에서 가져온 데이터는 무조건 문자열 형태이기 때문에 형변환이 필요하다
	pstmt.setString(2, request.getParameter("custname"));
	pstmt.setString(3, request.getParameter("phone"));
	pstmt.setString(4, request.getParameter("address"));
	pstmt.setDate(5, Date.valueOf(request.getParameter("joindate")));
	pstmt.setString(6, request.getParameter("grade"));
	pstmt.setString(7, request.getParameter("city"));
	
	pstmt.executeUpdate();  // 삽입문은 도출되는 결과가 없고 db에 데이터를 누적시키므로 ResultSet을 쓰지 않는다. 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 백그라운드 페이지</title>
</head>
<body>
	<!-- 데이터 입력 소행 롼료 후 회원목록을 조회할 수 있는 페이지로 이동 -->
	<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>