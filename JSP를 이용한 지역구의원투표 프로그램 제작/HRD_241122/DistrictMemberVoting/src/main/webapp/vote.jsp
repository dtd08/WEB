<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vote Page</title>
<link rel="stylesheet" href="css/style.css?abc">
<script type="text/javascript">
	function chkVal() {
		if(!document.vote_data.v_jumin.value) {
			alert("주민번호가 입력되지 않았습니다!");
			vote_data.v_jumin.focus();
			return false;
		}
		else if(!document.vote_data.v_name.value) {
			alert("성명이 입력되지 않았습니다!");
			vote_data.v_name.focus();
			return false;
		}
		else if(document.vote_data.m_no.value == 'notvale') {
			alert("후보번호가 선택되지 않았습니다!");
			vote_data.m_no.focus();
			return false;
		}
		else if(!document.vote_data.v_time.value) {
			alert("투표시간이 입력되지 않았습니다!");
			vote_data.v_time.focus();
			return false;
		}
		else if(!document.vote_data.v_confirm.value) {
			alert("유권자 확인이 선택되지 않았습니다!");
			vote_data.v_confirm.focus();
			return false;
		}
		else if(!document.vote_data.v_area.value) {
			alert("투표장소가 입력되지 않았습니다!");
			vote_data.v_area.focus();
			return false;
		}
		
		else {
			alert("투표하기 정보가 정상적으로 등록 되었습니다!");
			return true;
		}
	}
	
	function rewrite() {
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		location.href = "vote.jsp";
		vote_data.v_jumin.focus();
	}
</script>
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<section class="section">
		<h2>투표하기</h2>
		<form action="vote_p.jsp" method="post" name="vote_data" onsubmit="return chkVal()" >
			<table class="table_line">
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="v_jumin" > 예)8901012000021</td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="v_name" ></td>
				</tr>
				<tr>
					<th>후보번호</th>
					<td>
						<select name="m_no" >
							<option value="notvale" selected disabled hidden >후보번호</option>
							<option value="1">[1]김후보</option>
							<option value="2">[2]이후보</option>
							<option value="3">[3]박후보</option>
							<option value="4">[4]조후보</option>
							<option value="5">[5]최후보</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>투표시간</th>
					<td><input type="text" name="v_time" > 예) 0930 (09시30분)</td>
				</tr>
				<tr>
					<th>투표장소</th>
					<td><input type="text" name="v_area" ></td>
				</tr>
				<tr>
					<th>유권자확인</th>
					<td>
						<input type="radio" id="confirm_yes" name="v_confirm" value="Y" ><label for="confirm_yes">확인</label>
						<input type="radio" id="confirm_no" name="v_confirm" value="N" ><label for="confirm_no">미확인</label>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="투표하기" >
						<input type="button" value="다시쓰기" onclick="rewrite()" >
					</th>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>