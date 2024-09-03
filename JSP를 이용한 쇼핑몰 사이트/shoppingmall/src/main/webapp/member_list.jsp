<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	ResultSet은 쿼리의 결과가 하나의 튜플끼리 묶여 나온다.
	또한 .next()를 활용하면 더 이상 데이터가 존재하는지 판별할 수 있다.
	때문에 여러개의 select절 결과를 불러오려면 반복문을 사용하면 된다.
 -->
<%@ page import="DB.DBConnect" %>
<%@ page import="java.sql.*" %>

<% 
	String sql = "select custno, custname, phone, address, to_char(joindate, 'yyyy-mm-dd') as joindate, "
		+ "case grade when 'A' then 'VIP' when 'B' then '일반' when 'C' then '직원' end as grade, "
		+ "city from member_tbl_02 order by custno";
	
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	// rs.next()는 마지막 데이터의 포인터 주소를 갖는다.
	// 때문에 rs.next()가 존재하지 않는다는 것은 다음 데이터가 없다는 뜻이다.
	// 이러한 점을 이용해 우리는 뷰 테이블의 데이터들을 가져올 반복문의 조건으로 설정할 것이다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 조회</title>
<link rel="stylesheet" href="css/style.css?abc">
</head>
<body>
	<header><jsp:include page="layout/header.jsp"></jsp:include></header>
	<nav><jsp:include page="layout/nav.jsp"></jsp:include></nav>
	<section class="section">
		<h2>회원목록조회/수정</h2>
		<table class="table_line">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
			<%
				while(rs.next()) {
			%>
				<tr class="center">
					<td><%= rs.getString(1) %></td>
					<td><%= rs.getString(2) %></td>
					<td><%= rs.getString(3) %></td>
					<td><%= rs.getString(4) %></td>
					<td><%= rs.getString(5) %></td>
					<td><%= rs.getString(6) %></td>
					<td><%= rs.getString(7) %></td>
				</tr>
			<% 
				// 오라클에서 화면으로 가져올때는 데이터 타입의 제한이 덜하다.
				// 하지만 반대로 웹브라우저에서 오라클로 갈 때에는 데이터 타입을 맞춰야 한다.
				// 그래서 보통 숫자형 데이터들도 그냥 문자열로 가져온다. (어차피 웹브라우저에선 모두 문자로 보이기 때문)
				}
			%>
		</table>
	</section>
	<footer><jsp:include page="layout/footer.jsp"></jsp:include></footer>
</body>
</html>