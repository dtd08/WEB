<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>
<link rel="stylesheet" href="css/style.css?abc">
<script type="text/javascript">
	function checkValue() {
		if(!document.data.search.value) {
			alert("회원번호를 입력하세요.");
			document.data.search.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<header><jsp:include page="layout/header.jsp"></jsp:include></header>
	<nav><jsp:include page="layout/nav.jsp"></jsp:include></nav>
	<section class="section">
		<h2>회원조회</h2>
		<form action="member_search_list.jsp" method="post" name="data" onsubmit="return checkValue()">
			<table class="table_line">
				<tr>
					<th>회원 번호</th>
					<td><input type="text" name="search" size="10"></td>
				</tr>
				<tr class="center">
					<td colspan="2">
							<input type="button" value="취소" onclick="location.href='member_search.jsp'">
							<input type="submit" value="조회">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer><jsp:include page="layout/footer.jsp"></jsp:include></footer>
</body>
</html>