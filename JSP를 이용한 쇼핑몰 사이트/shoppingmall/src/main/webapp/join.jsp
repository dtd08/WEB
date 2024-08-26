<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DB.DBConnect" %> <!-- 지시문 형식을 통해 DB연결 자바 파일 불러오기 -->
<%@ page import="java.sql.*" %> <!-- 지시문 형식을 통해 sql 관련 라이브러리 불러오기 -->
<%
	String sql = "select max(custno) from member_tbl_02"; 										// 쿼리문 형식의 문자열을 일반 변수 sql에 저장

	Connection conn = DBConnect.getConnection(); 												// 1. DB 연결 : DB연결 기능을 인스턴스 conn에 저장
	PreparedStatement pstmt = conn.prepareStatement(sql); 										// 2. 쿼리문 생성 : sql 변수에 저장되어 있는 문장이 쿼리문 옷을 입음
	ResultSet rs = pstmt.executeQuery(); 														// 3. 결과 저장 : pstmt에 저장되어 있던 sql문을 실행하여 나온 결과를 인스턴스 rs에 저장 
	rs.next(); 																					// 4. 결과 확인 : rs에 결과값이 저장되었는지 next()를 호출하여 마지막 값을 확인
	int num = rs.getInt(1) + 1;																	// 5. 회원번호 생성 : 결과적으로 num에는 member_tbl_02 테이블의 마지막 회원번호 + 1이 들어감 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
<link rel="stylesheet" href="./css/style.css?abc">
<script type="text/javascript">
	function checkValue() {
		if(!document.data.custname.value) {
			alert("회원이름이 입력되지 않았습니다.");
			data.custname.focus();
			return false;
		}
		else if(!document.data.phone.value) {
			alert("회원전화번호가 입력되지 않았습니다.");
			data.phone.focus();
			return false;
		}
		else if(!document.data.address.value) {
			alert("회원주소가 입력되지 않았습니다.");
			data.address.focus();
			return false;
		}
		else if(!document.data.joindate.value) {
			alert("가입일자가 입력되지 않았습니다.");
			data.joindate.focus();
			return false;
		}
		else if(!document.data.grade.value) {
			alert("고객등급이 입력되지 않았습니다.");
			data.grade.focus();
			return false;
		}
		else if(!document.data.city.value) {
			alert("도시코드가 입력되지 않았습니다.");
			data.city.focus();
			return false;
		}
		alert("회원정보가 등록되었습니다.");
		return true;
	}
</script>
</head>
<body>
	<header><jsp:include page="./layout/header.jsp"></jsp:include></header>
	<nav><jsp:include page="./layout/nav.jsp"></jsp:include></nav>
	<section class="section">
		<h2>홈쇼핑 회원 등록</h2>
		<form name="data" action="join_p.jsp" method="post" onsubmit="return checkValue()">
			<table class="table_line">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="number" name="custno" value="<%=num %>" readonly /></td>
					<!-- 
						input의 name 속성은 컬럼명으로 정하는게 후에 jsp 등의 절차를 거칠 때 쉽게 알아볼 수 있다. 
						물론 전부 꼭 같이야 하는건 아니다.
						그래서 문제지를 받았을 때 종이에 input의 컬럼명을 적는게 좋다. 
					-->
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" /></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" /></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" /></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="date" name="joindate" /></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP, B:일반, C:직원]</th>
					<td><input type="text" name="grade" /></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" /></td>
				</tr>
				<tr class="center">
					<td colspan="2">
						<input type="submit" value="등록">
						<input type="button" value="취소" onclick="location.href='join.jsp'">
						<input type="button" value="조회">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer><jsp:include page="./layout/footer.jsp"></jsp:include></footer>
</body>
</html>