<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>
<!-- 본문 시작 -->
<style>
#member_info {
	margin-top: 50px;
}
</style>

<div>
	<div>
		<h3>인사 정보 테이블</h3>
	</div>

	<div id="Modal" class="modal">
		<div class="modal-content">
			<button class="btn-close position-absolute end-3"></button>
			<div id="member_info">
				사번 <label id="member_no"></label><br>
				이름 <label id="member_name"></label><br>
				이메일 <label id="member_email"></label><br>
				연락처 <label id="member_contact"></label><br>
				재직상태 <label id="member_status"></label><br>
			</div>
		</div>
	</div>

	<div>
		<div class="col-sm-12">
			<table class="table table-bordered table-hover dataTable" role="grid">
				<thead>
					<tr class="table-dark" role="row">
						<th rowspan="1" colspan="1">창고번호</th>
						<th rowspan="1" colspan="1">구분</th>
						<th rowspan="1" colspan="1">창고명</th>
						<th rowspan="1" colspan="1">관리자</th>
						<th rowspan="1" colspan="1">사용여부</th>
						<th rowspan="1" colspan="1">상세</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="warehouseListMain" items="${warehouseListMain}">
						<tr class="memList" role="row">
							<td>${warehouseListMain.warehouse_no}</td>
							<td>${warehouseListMain.category}</td>
							<td>${warehouseListMain.warehouse_name}</td>
							<td>${warehouseListMain.name}</td>
							<td>${warehouseListMain.use_status}</td>
							<td>
								<button type="button" class="btn" data-toggle="modal" data-target="#warehouseDetailModal"
					   	   		   		style="margin-bottom : 0; font-size: 15px">
					   	   			<span class="text-secondary text-xs font-weight-bold" >+</span>
					   	   		</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-5">
			<div>Showing 1 to 10 of 57 entries</div>
		</div>
		<div class="col-sm-5">
			<ul class="pagination">
				<li class="page-link link-container"><a href="#" class="link"><<</a></li>
				<li class="page-link link-container"><a href="#" class="link">1</a></li>
				<li class="page-link link-container"><a href="#" class="link">2</a></li>
				<li class="page-link link-container"><a href="#" class="link">>></a></li>
			</ul>
		</div>
	</div>
</div>
<!-- 본문 종료 -->
<%@ include file="../include/footer.jsp"%>
<%@ include file="../include/js.jsp"%>

<script>
	var modal = document.getElementById("Modal");
	var span = document.getElementsByClassName("btn-close")[0];

	$(document).ready(function() {
		$("table").on("click", "tr", function() {
			var value = $(this).find("td:first").text();
			$.ajax({
				url : '/hr/content?member_no='+value,
				method : 'GET',
				dataType: 'json',
				success : function(data) {
					$("#member_no").text(data.member_no);
				    $("#member_name").text(data.member_name);
				    $("#member_email").text(data.member_email);
				    $("#member_contact").text(data.member_contact);
				    $("#member_status").text(data.member_status);
					modal.style.display = "block";
				},
				error : function(error) {
					console.log('실패:', error);
				}
			});
		});
		
		$(".btn-close").click(function(){
			modal.style.display = "none";
		});
		
		$(window).click(function(event){
			if (event.target == modal) {
				modal.style.display = "none";
			}
		});
	});
</script>