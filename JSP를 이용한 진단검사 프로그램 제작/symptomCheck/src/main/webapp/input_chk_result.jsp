<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Input Check Result</title>
<link rel="stylesheet" href="css/style.css?abc" />
<script type="text/javascript">
	function chkVal() {
		if(!document.c_data.p_no.value) {
			alert("환자번호가 입력되지 않았습니다!");
			c_data.p_no.focus();
			return false;
		}
		else if(!document.c_data.t_code.value || document.c_data.t_code.value == "notValue") {
			alert("검사코드가 선택되지 않았습니다!");
			c_data.t_code.focus();
			return false;
		}
		else if(!document.c_data.t_sdate.value) {
			alert("검사시작일자가 입력되지 않았습니다!");
			c_data.t_sdate.focus();
			return false;
		}
		else if(!document.c_data.t_status.value) {
			alert("검사상태가 선택되지 않았습니다!");
			return false;
		}
		else if(!document.c_data.t_ldate.value) {
			alert("검사완료일자가 입력되지 않았습니다!");
			c_data.t_ldate.focus();
			return false;
		}
		else if(!document.c_data.t_result.value) {
			alert("검사결과가 선택되지 않았습니다!");
			return false;
		}
		else {
			alert("검사결과가 정상적으로 등록 되었습니다!");
			return true;
		}
	}
	
	function rewrite() {
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		c_data.reset();
		c_data.p_no.focus();
	}
</script>
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<section class="section">
		<h2>검사결과입력</h2>
		<form action="input_chk_result_p.jsp" method="post" name="c_data" onsubmit="return chkVal()" >
			<table class="table_line">
				<tr>
					<th>환자번호</th>
					<td><input type="text" name="p_no" /> 예)1001</td>
				</tr>
				<tr>
					<th>검사코드</th>
					<td>
						<select name="t_code">
							<option value="notValue" selected disabled hidden>검사명</option>
							<option value="T001">[T001]결핵</option>
							<option value="T002">[T002]장티푸스</option>
							<option value="T003">[T003]수두</option>
							<option value="T004">[T004]홍역</option>
							<option value="T005">[T005]콜레라</option>	
						</select>
					</td>
				</tr>
				<tr>
					<th>검사시작일자</th>
					<td><input type="text" name="t_sdate" /> 예>20200101</td>
				</tr>
				<tr>
					<th>검사상태</th>
					<td>
						<input type="radio" name="t_status" id="ing" value="1" />
						<label for="ing">검사중</label>
						<input type="radio" name="t_status" id="com" value="2" />
						<label for="com">검사완료</label>
					</td>
				</tr>
				<tr>
					<th>검사완료일자</th>
					<td><input type="text" name="t_ldate" /> 예)20200101</td>
				</tr>
				<tr>
					<th>검사결과</th>
					<td>
						<input type="radio" name="t_result" id="r_non" value="X" />
						<label for="r_no">미입력</label>
						<input type="radio" name="t_result" id="r_pos" value="P" />
						<label for="r_pos">양성</label>
						<input type="radio" name="t_result" id="r_neg" value="N" />
						<label for="r_neg">음성</label>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="검사결과등록" />
						<input type="button" onclick="rewrite()" value="다시쓰기" />
					</th>
				</tr>
			</table>		
		</form>
	</section>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>