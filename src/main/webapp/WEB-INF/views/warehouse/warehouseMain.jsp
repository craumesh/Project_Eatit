<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/header.jsp"%>
<!-- 창고 상세 정보 모달 시작 -->
<!-- 	<div class="modal" id="warehouseModal" data-backdrop="static"> -->
<!-- 	    <div class="modal-dialog"> -->
<!-- 	        <div class="modal-content"> -->
<!-- 	            창고 상세 정보 모달 헤더 -->
<!-- 	            <div class="modal-header"> -->
<!-- 	                <h4 class="modal-title">창고 상세 정보</h4> -->
<!-- 	                <button class="btn-close end-3"></button> -->
<!-- 	            </div> -->
<!-- 	            창고 상세 정보 모달 본문 -->
<!-- 	            <div > -->
<!-- 	                <div id="warehouse_info"> -->
<!-- 	                    각각의 ID를 할당 -->
<!-- 	                    창고번호 : <span id="warehouse_no"></span><br> -->
<!-- 	                    위치명 : <span id="location_name"></span><br> -->
<!-- 	                    구분 : <span id="category"></span><br> -->
<!-- 	                    창고명 : <span id="warehouse_name"></span><br> -->
<!-- 	                    관리자 : <span id="name"></span><br> -->
<!-- 	                    전화번호 : <span id="contact"></span><br> -->
<!-- 	                    이메일 : <span id="email"></span><br> -->
<!-- 	                    사용여부 : <span id="use_status"></span><br> -->
<!-- 	                    비고 : <span id="note"></span><br> -->
<!-- 	                    수정자 : <span id="updater"></span><br> -->
<!-- 	                    수정일자 : <span id="updatedate"></span><br> -->
<!-- 	                </div> -->
<!-- 	            </div> -->
<!-- 	            창고 상세 정보 모달 footer 시작 -->
<!-- 	            <div class="modal-footer"> -->
<!-- 	                <button type="button" class="btn btn-primary" onclick="location.href='/warehouse/warehouseUpdate'">수정하기</button> -->
<!-- 	            </div> -->
<!-- 	            창고 상세 정보 모달 footer 끝 -->
<!-- 	        </div> -->
<!-- 	    </div> -->
<!-- 	</div> -->
<!-- 창고 상세 정보 모달 끝 -->
<!-- 창고 상세 모달2 시작  -->
<div class="modal" id="warehouseModal" class="modal top-10 position-absolute">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button id="closebtn" class="btn bg-gradient-primary position-absolute py-1 px-2 mt-2 end-5">X</button>
				<h3 class="modal-title mx-auto">창고 상세 정보</h3>
			</div>
			<div class="modal-body p-5">
				<div class="user-container d-flex align-items-center">
					<div class="user-info d-flex w-100">
						<table class="table">
							<tr>
								<th class="fs-5">창고번호</th>
								<td class="fs-5" id="warehouse_no"></td>
							</tr>
							<tr>
								<th class="fs-5">위치명</th>
								<td class="fs-5" id="location_name"></td>
							</tr>
						</table>
					</div>
				</div>
				<div id="tableContainer" class="modal-body">
					<table id="view-table" class="table">
						<tr>
							<th class="fs-5">구분</th>
							<td class="fs-5" id="category"></td>
						</tr>
						<tr>
							<th class="fs-5">창고명</th>
							<td class="fs-5" id="warehouse_name"></td>
						</tr>
						<tr>
							<th class="fs-5">관리자</th>
							<td class="fs-5" id="name"></td>
						</tr>
						<tr>
							<th class="fs-5">전화번호</th>
							<td class="fs-5" id="contact"></td>
						</tr>
						<tr>
							<th class="fs-5">이메일</th>
							<td class="fs-5" id="email"></td>
						</tr>
						<tr>
							<th class="fs-5">사용여부</th>
							<td class="fs-5" id="use_status"></td>
						</tr>
						<tr>
							<th class="fs-5">비고</th>
							<td class="fs-5" id="note"></td>
						</tr>
						<tr>
							<th class="fs-5">수정자</th>
							<td class="fs-5" id="updater"></td>
						</tr>
						<tr>
							<th class="fs-5">수정일자</th>
							<td class="fs-5" id="updatedate"></td>
						</tr>
					</table>
					
					<form id="edit-form" method="post">
						<input type="hidden" name="admin_no" id="admin_no-forSubmit" value="${no}">
						<table id="edit-table" class="d-none table">
							<tr>
								<th class="fs-5">구분</th>
								<td class="fs-6">
									<div class="input-group input-group-dynamic">
									    <input type="text" name="category" id="category-input" 
									    class="form-control" placeholder="구분" aria-label="구분" aria-describedby="basic-addon1">
									</div>
								</td>
							</tr>
							<tr>
								<th class="fs-5">창고명</th>
								<td class="fs-6">
									<div class="input-group input-group-dynamic">
									    <input type="text" name="warehouse_name" id="warehouse_name-input"
									    class="form-control" placeholder="창고명" aria-label="창고명" aria-describedby="basic-addon1">
									</div>
								</td>
							</tr>
					    	<tr>
								<th class="fs-5">관리자</th>
								<td class="fs-6">
									<div class="input-group input-group-dynamic">
									    <input type="text" name="name" id="name-input"
									    class="form-control" placeholder="관리자" aria-label="관리자" aria-describedby="basic-addon1">
									</div>
								</td>
							</tr>
							<tr>
								<th class="fs-5">전화번호</th>
								<td class="fs-6">
									<div class="input-group input-group-dynamic">
									    <input type="text" name="contact" id="contact-input"
									    class="form-control" placeholder="전화번호" aria-label="전화번호" aria-describedby="basic-addon1">
									</div>
								</td>
							</tr>
							<tr>
								<th class="fs-5">이메일</th>
								<td class="fs-6">
									<div class="input-group input-group-dynamic">
									    <input type="text" name="email" id="email-input"
									    class="form-control" placeholder="이메일" aria-label="이메일" aria-describedby="basic-addon1">
									</div>
								</td>
							</tr>
							<tr>
								<th class="fs-5">비고</th>
								<td class="fs-6">
									<div class="input-group input-group-outline mb-3" style="padding-left: 0; padding-right: 0;">
										<textarea id="note-input" class="form-control" rows="7" placeholder="내용을 입력하세요" name="note"></textarea>
									</div>
								</td>
							</tr>
					  	</table>
				  	</form>
				</div>
				<div class="text-center">
					<button id="editbtn" class="btn bg-gradient-danger fs-6 mb-0 py-2 px-3">정보 수정</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 창고 상세 모달2 끝  -->

<!-- 본문 시작  -->
	<div class="col-12">
		<div class="card my-4">
			<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
				<div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
					<h6 class="text-white text-capitalize ps-3">창고 목록</h6>
				</div>
			</div>
			<div class="card-body px-0 pb-2">
				<div class="table-responsive p-0">
					<table class="table align-items-center mb-0">
					
						<thead>
							<tr>
								<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 "><input type="checkbox"></th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">창고번호</th>
								<th class="text-center text-secondary text-xxs font-weight-bolder opacity-7">구분</th>
								<th class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ">창고명</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">관리자</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">사용여부</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">상세</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach var="warehouseListMain" items="${warehouseListMain}">
								<tr>
									<td class="text-uppercase text-secondary text-xxs font-weight-bold opacity-7" style="padding: 0.75rem 1.5rem;">
										<input type="checkbox">
									</td>
									<td class="text-center">
                      					<span class="text-secondary text-xs font-weight-bold">${warehouseListMain.warehouse_no}</span>
                     				</td>
									<td class="text-center">
                      					<span class="text-secondary text-xs font-weight-bold">${warehouseListMain.category}</span>
			                        </td>
									<td class="text-center">
				                        <span class="text-secondary text-xs font-weight-bold">${warehouseListMain.warehouse_name}</span>
                      				</td>
									<td class="text-center">
										<span class="text-secondary text-xs font-weight-bold">${warehouseListMain.name}</span>
									</td>
									<td class="text-center text-sm">
			                        	<span class="badge badge-sm bg-gradient-success">${warehouseListMain.use_status}</span>
			                      	</td>
									<td class="text-center text-sm">
									<!--상세내역 모달버튼 시작  -->
			                        	<button type="button" class="btn warehouseDetailBtn" data-toggle="modal" data-target="#warehouseModal"
							   	   		   		value="${warehouseListMain.warehouse_no}" style="margin-bottom : 0; font-size: 15px">
							   	   			<span class="text-secondary text-xs font-weight-bold" >+</span>
							   	   		</button>
									<!--상세내역 모달버튼 끝  -->
									
			                      	</td>
								</tr>
							</c:forEach>
						</tbody>	
					</table>
				</div>
				<div>
	                <button type="button" class="btn bg-gradient-primary" onclick="popup();">창고등록</button>
	                <button type="button" class="btn bg-gradient-primary" onclick="location.href='/warehouse/warehouseDelete'">창고삭제</button>
	            </div>
			</div>
		</div>
	</div>
<!--본문 종료  -->
<%@ include file="../include/footer.jsp"%>
<%@ include file="../include/js.jsp"%>
<script src="/resources/js/plugins/warehouseMain.js"></script>