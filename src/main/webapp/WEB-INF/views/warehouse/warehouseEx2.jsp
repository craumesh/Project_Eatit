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
	
	<!-- 상세정보 모달시작  -->
<!-- 	<div id="Modal" class="modal"> -->
<!-- 		<div class="modal-content"> -->
<!-- 			<button class="btn-close position-absolute end-3"></button> -->
<!-- 			<div id="warehouse_info"> -->
<!-- 				창고번호 : <span id="warehouse_no"></span><br> -->
<!-- 				위치명 : <span id="location_name"></span><br> -->
<!-- 				구분 : <span id="category"></span><br> -->
<!-- 				창고명 : <span id="warehouse_name"></span><br> -->
<!-- 				관리자 : <span id="name"></span><br> -->
<!-- 				전화번호 : <span id="contact"></span><br> -->
<!-- 				이메일 : <span id="email"></span><br> -->
<!-- 				사용여부 : <span id="use_status"></span><br> -->
<!-- 				비고 : <span id="note"></span><br> -->
<!-- 				수정자 : <span id="updater"></span><br> -->
<!-- 				수정일자 : <span id="updatedate"></span><br> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<!-- 상세정보 모달끝  -->
	
	<!-- 창고 상세 정보 모달 시작 -->
	<div class="modal" id="Modal" data-backdrop="static">
	    <div class="modal-dialog">
	        <div class="modal-content">
	
	            <!-- 창고 상세 정보 모달 헤더 -->
	            <div class="modal-header">
	                <h4 class="modal-title">창고 상세 정보</h4>
	            </div>
	
	            <!-- 창고 상세 정보 모달 본문 -->
	            <div class="modal-content">
					<button class="btn-close position-absolute end-3"></button>
					<div id="warehouse_info">
						창고번호 : <span id="warehouse_no"></span><br>
						위치명 : <span id="location_name"></span><br>
						구분 : <span id="category"></span><br>
						창고명 : <span id="warehouse_name"></span><br>
						관리자 : <span id="name"></span><br>
						전화번호 : <span id="contact"></span><br>
						이메일 : <span id="email"></span><br>
						사용여부 : <span id="use_status"></span><br>
						비고 : <span id="note"></span><br>
						수정자 : <span id="updater"></span><br>
						수정일자 : <span id="updatedate"></span><br>
					</div>
				</div>
	           <!-- 창고 상세 정보 모달 footer 시작 -->
	            <div class="modal-footer">
	                <button type="button" class="btn btn-primary" data-dismiss="Modal">수정하기</button>
	            </div>
	           <!-- 창고 상세 정보 모달 footer 끝 -->
	        </div>
	    </div>
	</div>
	<!-- 창고 상세 정보 모달 끝 -->
	
	

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
						<tr class="warehouseList" role="row">
							<td>${warehouseListMain.warehouse_no}</td>
							<td>${warehouseListMain.category}</td>
							<td>${warehouseListMain.warehouse_name}</td>
							<td>${warehouseListMain.name}</td>
							<td>${warehouseListMain.use_status}</td>
							<td>
								<button type="button" class="btn warehouseDetailBtn" data-toggle="modal" data-target="#Modal"
					   	   		   		value="${warehouseListMain.warehouse_no}" style="margin-bottom : 0; font-size: 15px">
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

<script src="/resources/js/plugins/warehouseMain.js"></script>