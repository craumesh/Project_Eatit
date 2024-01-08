<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/header.jsp"%>

<!-- 창고 상세 모달 시작  -->
<div class="modal" id="warehouseModal" class="modal top-10 position-absolute h-auto">
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
								<td class="fs-6" id="warehouse_no"></td>
							</tr>
							<tr>
								<th class="fs-5">위치명</th>
								<td class="fs-6" id="location_name"></td>
							</tr>
						</table>
					</div>
				</div>
				<div id="tableContainer" class="modal-body">
					<table id="view-table" class="table">
						<tr>
							<th class="fs-5">구분</th>
							<td class="fs-6" id="category"></td>
						</tr>
						<tr>
							<th class="fs-5">창고명</th>
							<td class="fs-6" id="warehouse_name"></td>
						</tr>
						<tr>
							<th class="fs-5">관리자</th>
							<td class="fs-6" id="name"></td>
						</tr>
						<tr>
							<th class="fs-5">전화번호</th>
							<td class="fs-6" id="contact"></td>
						</tr>
						<tr>
							<th class="fs-5">이메일</th>
							<td class="fs-6" id="email"></td>
						</tr>
						<tr>
							<th class="fs-5">사용여부</th>
							<td class="fs-6" id="use_status"></td>
						</tr>
						<tr>
							<th class="fs-5">비고</th>
							<td class="fs-6" id="note"></td>
						</tr>
						<tr>
							<th class="fs-5">수정자</th>
							<td class="fs-6" id="updater"></td>
						</tr>
						<tr>
							<th class="fs-5">수정일자</th>
							<td class="fs-6" id="updatedate"></td>
						</tr>
					</table>
					
					<!-- 수정폼 시작-->
					<form action="/warehouse/updateDetailInfo" id="edit-form" method="post">
						<input type="hidden" name="admin_no" id="admin_no-forSubmit" value="${no}">
						<input type="hidden" name="warehouse_no" id="warehouse_no-forSubmit">
						<table id="edit-table" class="d-none table">
							<tr>
								<th class="fs-5">구분</th>
								<td class="fs-6">
									<div class="input-group input-group-dynamic">
									    <input type="text" name="category" id="category-input" 
									    class="form-control" placeholder="구분" aria-label="구분" aria-describedby="basic-addon1" readonly>
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
								<th class="fs-5">직책</th>
								<td class="fs-6">
									<div class="input-group input-group-dynamic">
									    <select class="form-control" name="position" id="choices-Position" >
									    	<option selected>직책 선택</option>
									      <c:forEach var="poName" items="${positionName}">
										  	<option >${poName }</option>
									      </c:forEach>
										</select>
										<select class="form-control" name="position" id="choices-Name" >
										  	<option ></option>
										</select>
									</div>
								</td>
							</tr>
					    	<tr>
								<th class="fs-5">관리자</th>
								<td class="fs-6">
									<div class="input-group input-group-dynamic">
									    <input type="text" name="name" id="name-input" class="form-control" 
									    placeholder="관리자" aria-label="관리자" aria-describedby="basic-addon1" readonly>
									</div>
								</td>
							</tr>
							<tr>
								<th class="fs-5">전화번호</th>
								<td class="fs-6">
									<div class="input-group input-group-dynamic">
									    <input type="text" name="contact" id="contact-input" class="form-control" 
									    placeholder="전화번호" aria-label="전화번호" aria-describedby="basic-addon1" readonly>
									</div>
								</td>
							</tr>
							<tr>
								<th class="fs-5">이메일</th>
								<td class="fs-6">
									<div class="input-group input-group-dynamic">
									    <input type="text" name="email" id="email-input" class="form-control" 
									    placeholder="이메일" aria-label="이메일" aria-describedby="basic-addon1" readonly>
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
				  	<!-- 수정폼 끝-->
				</div>
				<div class="text-center">
					<button id="editbtn" class="btn bg-gradient-danger fs-6 mb-0 py-2 px-3">정보 수정</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 창고 상세 모달 끝  -->

<!-- 본문 시작  -->
	<div class="col-12">
		<div class="card my-4 mx-4">
			<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
				<div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
					<h6 class="text-white text-capitalize ps-5 fs-3">창고 입출고 관리</h6>
				</div>
			</div>
			
			<div class="card-body px-0 pb-2">
				<div class="table-responsive p-0">
					<form role="form" method="post">
					<table class="table align-items-center mb-0">
					
						<thead>
							<tr>
								<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">
									<input type="checkbox" id="cbx_chkAll">
								</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">식별코드</th>
								<th class="text-center text-secondary text-xxs font-weight-bolder opacity-7">창고번호</th>
								<th class="text-center text-secondary text-xxs font-weight-bolder opacity-7">입출고 구분</th>
								<th class="text-center text-secondary text-xxs font-weight-bolder opacity-7 ">카테고리</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">품목이름</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">입출고 수량</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">단위</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">가격(만원)</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">유통기한</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">입출고일</th>
								<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">처리상태</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach var="stockInfoList" items="${stockInfoList}">
								<tr>
									<td class="text-uppercase text-secondary text-xxs font-weight-bold opacity-7" style="padding: 0.75rem 1.5rem;">
										<input type="checkbox" name="chk" value="${stockInfoList.identify_code}">
									</td>
									<td class="text-center">
                      					<span class="text-secondary text-xs font-weight-bold">${stockInfoList.identify_code}</span>
                     				</td>
									<td class="text-center">
                      					<span class="text-secondary text-xs font-weight-bold">${stockInfoList.warehouse_no}</span>
			                        </td>
									<td class="text-center">
                      					<span class="text-secondary text-xs font-weight-bold">${stockInfoList.io_classification}</span>
			                        </td>
									<td class="text-center">
				                        <span class="text-secondary text-xs font-weight-bold">${stockInfoList.category}</span>
                      				</td>
									<td class="text-center">
										<span class="text-secondary text-xs font-weight-bold">${stockInfoList.name}</span>
									</td>
									<td class="text-center text-sm">
			                        	<span class="text-secondary text-xs font-weight-bold">${stockInfoList.io_quantities}</span>
			                      	</td>
									<td class="text-center text-sm">
			                        	<span class="text-secondary text-xs font-weight-bold">${stockInfoList.unit}</span>
			                      	</td>
									<td class="text-center text-sm">
			                        	<span class="text-secondary text-xs font-weight-bold">${stockInfoList.price}</span>
			                      	</td>
									<td class="text-center text-sm">
			                        	<span class="text-secondary text-xs font-weight-bold">${stockInfoList.expiry_date}</span>
			                      	</td>
									<td class="text-center text-sm">
			                        	<span class="text-secondary text-xs font-weight-bold">${stockInfoList.io_date}</span>
			                      	</td>
									<td class="text-center text-sm">
			                        	<span class="badge badge-sm bg-gradient-info">${stockInfoList.status}</span>
			                      	</td>
								</tr>
							</c:forEach>
						</tbody>	
					</table>
					</form>
				</div>
				<div class="text-end ">
	                <button type="button" id="allowBtn" class="btn bg-gradient-dark">승인</button>
	                <button type="button" id="cancelBtn" class="btn bg-gradient-dark me-3" >취소</button>
	            </div>
			</div>
		</div>
	</div>
<!--본문 종료  -->
<%@ include file="../include/footer.jsp"%>
<%@ include file="../include/js.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
		// 필요한 변수 저장
		var formObj = $("form[role='form']");
		
		// 체크박스 전체선택 기능
		$("#cbx_chkAll").click(function() {
			if ($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
			else $("input[name=chk]").prop("checked", false);
		});
		
		// 승인 버튼 클릭시, 식별코드를 사용해서 승인 처리
		$("#allowBtn").click(function(){
			var chkboxes = $("input[name='chk']:checked");
			
			 if (chkboxes.length === 0) {
		            swal({
		                title: "처리할 사항을 선택해주세요",
		                icon: "warning",
		                buttons:{
		                    confirm: true
		                }
		            });
		            return;
		        }
			
			swal({
				  title: "정말 승인하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true
				})
				.then((willDelete) => {
				  if (willDelete) {
					swal("승인 완료", {icon: "success"}).then(function(){
						$("#closebtn").click();
						formObj.attr("action","/warehouse/processStockInfo");
						formObj.submit();
					});							
				  }
			});	
		});
		
		// 삭제 버튼 클릭시, 창고 번호를 사용해서 삭제 처리
		$("#cancelBtn").click(function(){
			var chkboxes = $("input[name='chk']:checked");
			
			 if (chkboxes.length === 0) {
		            swal({
		                title: "처리할 사항을 선택해주세요",
		                icon: "warning",
		                buttons:{
		                    confirm: true
		                }
		            });
		            return;
		        }
			
			swal({
				  title: "승인 취소하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true
				})
				.then((willDelete) => {
				  if (willDelete) {
					swal("승인 취소 완료", {icon: "success"}).then(function(){
						$("#closebtn").click();
						formObj.attr("action","/warehouse/updateStockInfo");
						formObj.submit();
					});							
				  }
			});	
		});
		
		
	});
</script>
<script src="/resources/js/plugins/warehouseMain.js"></script>
</html>