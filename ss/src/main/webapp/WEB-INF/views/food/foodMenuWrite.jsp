<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<!-- CSS ================================================================= -->
	<style>
		table {
		border-collapse: collapse;
		width: fit-content;
		margin: 20px auto;
		}
		
		th {
		border: 1px solid black;
		padding: 8px;
		text-align: center;
		background-color: orange;
		}
		
		td {
		border: 1px solid black;
		padding: 8px;
		text-align: left;
		}
		
		#map {
		width: 100%;
		height: 400px;
		display: none;
		margin: 20px auto;
		}
	</style>
</head>

<!-- <body> -->
<!-- 테이블(DB name) ================================================================= -->
<br><br>
<h1 style="text-align: center; font-size: 2em;">메뉴 등록</h1>
	<form action="foodMenuWrite.do" method="post" style="text-align: center;" enctype="multipart/form-data" onsubmit="return validateForm()">
		<table id="menuTable">
			<button type="button" onclick="addRow()">메뉴 추가</button> &nbsp;&nbsp;
			<button type="button" onclick="removeRow()">메뉴 빼기</button>
			<tr>
				<th>메뉴 이름 </th>
				<th>메뉴 가격 </th>
			</tr>
			<tr>
				<input type = "hidden" name="fNo" value="${vo.fNo}">
				<td><input type="text" name="food_menu_name" ></td>
				<td><input type="text" name="food_menu_price"></td>
			</tr>
		</table>
		<!--첨부파일 -->
		<!-- <input type="file" name="uploadFile">
		<br><br> -->
		<button>등록</button>
	</form>

	<!-- 유효성 검사확인  -->
	<script>
		function addRow() {
			var table = document.getElementById("menuTable");
			var newRow = table.insertRow(table.rows.length);

			var cell1 = newRow.insertCell(0);
			var cell2 = newRow.insertCell(1);

			cell1.innerHTML = '<input type="text" name="food_menu_name" >';
			cell2.innerHTML = '<input type="text" name="food_menu_price" >';
		}

		function removeRow() {
			var table = document.getElementById("menuTable");
			if (table.rows.length > 2) { // Ensure that at least one row is always present
				table.deleteRow(table.rows.length - 1);
			}
		}

		function validateForm() {
			var foodMenuNameInputs = document.getElementsByName("food_menu_name");
			var foodMenuPriceInputs = document.getElementsByName("food_menu_price");

			for (var i = 0; i < foodMenuNameInputs.length; i++) {
				if (foodMenuNameInputs[i].value === "") {
					alert("메뉴이름을 작성해주세요.");
					return false;
				}
				if (foodMenuPriceInputs[i].value === "") {
					alert("메뉴가격을 작성해주세요.");
					return false;
				}
			}

			return true;
		}
	</script>	
<%@ include file="../include/footer.jsp" %> 