<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<!-- CSS  -->
<style>
	table { border-collapse: collapse; width: fit-content; margin: 20px auto; }
	th { border:  padding: 8px; text-align: center; background-color: orange; }
	td { border:  padding: 8px; text-align: left; }
	.form-signin { max-width: 500px; padding: 15px; }
	.form-signin .form-floating:focus-within { z-index: 2; }
	.form-signin input { margin-bottom: 1px; }
</style>

<!-- 테이블 -->
<br><br>
<div class="text-center pt-5" style="height:150%; background-color: #FFFCF5;">
	<div class="form-signin card shadow-sm w-100 m-auto">
		<form action="foodMenuWrite.do" method="post" style="text-align: center;" enctype="multipart/form-data" onsubmit="return validateForm()">
			<table id="menuTable">
				<a class="navbar-brand" href="<%=request.getContextPath()%>/food/foodMain.do" title="Arcalive">
				<svg class="ms-1 mb-4" style="color:#FFA500" xmlns="http://www.w3.org/2000/svg" width="72" height="60" fill="currentColor" class="bi bi-cup-hot" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M.5 6a.5.5 0 0 0-.488.608l1.652 7.434A2.5 2.5 0 0 0 4.104 16h5.792a2.5 2.5 0 0 0 2.44-1.958l.131-.59a3 3 0 0 0 1.3-5.854l.221-.99A.5.5 0 0 0 13.5 6H.5ZM13 12.5a2.01 2.01 0 0 1-.316-.025l.867-3.898A2.001 2.001 0 0 1 13 12.5ZM2.64 13.825 1.123 7h11.754l-1.517 6.825A1.5 1.5 0 0 1 9.896 15H4.104a1.5 1.5 0 0 1-1.464-1.175Z"/>
				  <path d="m4.4.8-.003.004-.014.019a4.167 4.167 0 0 0-.204.31 2.327 2.327 0 0 0-.141.267c-.026.06-.034.092-.037.103v.004a.593.593 0 0 0 .091.248c.075.133.178.272.308.445l.01.012c.118.158.26.347.37.543.112.2.22.455.22.745 0 .188-.065.368-.119.494a3.31 3.31 0 0 1-.202.388 5.444 5.444 0 0 1-.253.382l-.018.025-.005.008-.002.002A.5.5 0 0 1 3.6 4.2l.003-.004.014-.019a4.149 4.149 0 0 0 .204-.31 2.06 2.06 0 0 0 .141-.267c.026-.06.034-.092.037-.103a.593.593 0 0 0-.09-.252A4.334 4.334 0 0 0 3.6 2.8l-.01-.012a5.099 5.099 0 0 1-.37-.543A1.53 1.53 0 0 1 3 1.5c0-.188.065-.368.119-.494.059-.138.134-.274.202-.388a5.446 5.446 0 0 1 .253-.382l.025-.035A.5.5 0 0 1 4.4.8Zm3 0-.003.004-.014.019a4.167 4.167 0 0 0-.204.31 2.327 2.327 0 0 0-.141.267c-.026.06-.034.092-.037.103v.004a.593.593 0 0 0 .091.248c.075.133.178.272.308.445l.01.012c.118.158.26.347.37.543.112.2.22.455.22.745 0 .188-.065.368-.119.494a3.31 3.31 0 0 1-.202.388 5.444 5.444 0 0 1-.253.382l-.018.025-.005.008-.002.002A.5.5 0 0 1 6.6 4.2l.003-.004.014-.019a4.149 4.149 0 0 0 .204-.31 2.06 2.06 0 0 0 .141-.267c.026-.06.034-.092.037-.103a.593.593 0 0 0-.09-.252A4.334 4.334 0 0 0 6.6 2.8l-.01-.012a5.099 5.099 0 0 1-.37-.543A1.53 1.53 0 0 1 6 1.5c0-.188.065-.368.119-.494.059-.138.134-.274.202-.388a5.446 5.446 0 0 1 .253-.382l.025-.035A.5.5 0 0 1 7.4.8Zm3 0-.003.004-.014.019a4.077 4.077 0 0 0-.204.31 2.337 2.337 0 0 0-.141.267c-.026.06-.034.092-.037.103v.004a.593.593 0 0 0 .091.248c.075.133.178.272.308.445l.01.012c.118.158.26.347.37.543.112.2.22.455.22.745 0 .188-.065.368-.119.494a3.198 3.198 0 0 1-.202.388 5.385 5.385 0 0 1-.252.382l-.019.025-.005.008-.002.002A.5.5 0 0 1 9.6 4.2l.003-.004.014-.019a4.149 4.149 0 0 0 .204-.31 2.06 2.06 0 0 0 .141-.267c.026-.06.034-.092.037-.103a.593.593 0 0 0-.09-.252A4.334 4.334 0 0 0 9.6 2.8l-.01-.012a5.099 5.099 0 0 1-.37-.543A1.53 1.53 0 0 1 9 1.5c0-.188.065-.368.119-.494.059-.138.134-.274.202-.388a5.446 5.446 0 0 1 .253-.382l.025-.035A.5.5 0 0 1 10.4.8Z"/>
				</svg>
				</a>
				<h1 class="h3 mb-3 fw-normal" style="color:#FFA500">메뉴 등록</h1>
				<button class="btn" style="color:#FFA500" type="button" onclick="addRow()">
					<svg  xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-clipboard2-plus" viewBox="0 0 16 16">
					  <path d="M9.5 0a.5.5 0 0 1 .5.5.5.5 0 0 0 .5.5.5.5 0 0 1 .5.5V2a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 2v-.5a.5.5 0 0 1 .5-.5.5.5 0 0 0 .5-.5.5.5 0 0 1 .5-.5h3Z"/>
					  <path d="M3 2.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 0 0-1h-.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1H12a.5.5 0 0 0 0 1h.5a.5.5 0 0 1 .5.5v12a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5v-12Z"/>
					  <path d="M8.5 6.5a.5.5 0 0 0-1 0V8H6a.5.5 0 0 0 0 1h1.5v1.5a.5.5 0 0 0 1 0V9H10a.5.5 0 0 0 0-1H8.5V6.5Z"/>
					</svg>
					<br>
					메뉴 추가
				</button> 
				<button class="btn" style="color:#FFA500" type="button" onclick="removeRow()">
					<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-clipboard2-minus" viewBox="0 0 16 16">
					  <path d="M9.5 0a.5.5 0 0 1 .5.5.5.5 0 0 0 .5.5.5.5 0 0 1 .5.5V2a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 2v-.5a.5.5 0 0 1 .5-.5.5.5 0 0 0 .5-.5.5.5 0 0 1 .5-.5h3Z"/>
					  <path d="M3 2.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 0 0-1h-.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1H12a.5.5 0 0 0 0 1h.5a.5.5 0 0 1 .5.5v12a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5v-12Z"/>
					  <path d="M6 8a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1H6Z"/>
					</svg>
					<br>
					메뉴 빼기
				</button> 
				
				<input type = "hidden" name="fNo" value="${vo.fNo}">
				<div class="d-flex justify-content-center">
					<div class="form-floating pe-1">
						<input type="text" class="form-control" id="food_menu_name" placeholder="메뉴 이름 " name="food_menu_name">
						<label for="floatingInput" class="text-muted mb-2">메뉴 이름</label>
					</div>
					<div class="form-floating">
						<input type="text" class="form-control" id="food_menu_price" placeholder="메뉴 가격" name="food_menu_price" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
						<label for="floatingInput" class="text-muted">메뉴 가격 (숫자만 기입)</label>
					</div>
				</div>
				
			</table>
			<button class="w-100 btn btn-lg " style="background-color:#FFA500; color:white">
				등록
			</button>
		</form>
	</div>
</div>
	<!-- 유효성 검사확인  -->
	<script>
		function addRow() {
			var table = document.getElementById("menuTable");
			var newRow = table.insertRow(table.rows.length);

			var cell1 = newRow.insertCell(0);
			var cell2 = newRow.insertCell(1);

			cell1.innerHTML = '<div class="form-floating pe-1">'
							+'<input type="text" class="form-control" id="food_menu_name" placeholder="메뉴 이름 " name="food_menu_name">'
							+'<label for="floatingInput" class="text-muted mb-2">메뉴 이름</label>'
							+'</div>';
			cell2.innerHTML = '<div class="form-floating">'
							+'<input type="text" class="form-control" id="food_menu_price" placeholder="메뉴 가격" name="food_menu_price" oninput="this.value = this.value.replace(/[^0-9]/g, \'\');">'
							+'<label for="floatingInput" class="text-muted">메뉴 가격 (숫자만 기입)</label>'
							+'</div>';
		}

		function removeRow() {
			var table = document.getElementById("menuTable");
			if (table.rows.length > 0) { // Ensure that at least one row is always present
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