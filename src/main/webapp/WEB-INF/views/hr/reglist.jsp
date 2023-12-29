<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>
<!-- 본문 시작 -->
<div class="col-11 mx-auto">
	<div class="card my-3 mx-auto pt-5 px-6 pb-2 d-flex">
		<div class="card-header p-0 position-relative mx-3 z-index-2">
			<div class="bg-gradient-primary shadow-primary border-radius-lg pt-3 pb-3 pe-3 d-flex">
				<h3 class="text-white text-capitalize ps-5 align-items-center mb-0 py-1">인사 승인 관리 테이블</h3>
			</div>
		</div>		
		<div class="row">
			<div class="card-body mx-5 px-0 pb-4 col-lg-3">
				<div class="table-responsive p-0 mt-5">
					<table id="hr-table" class="table table-hover mb-0">
						<thead>
							<tr>
								<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"><input type="checkbox"></th>
								<th class="text-center font-weight-bolder col-2">사원번호</th>
								<th class="text-center font-weight-bolder col-1">아이디</th>
								<th class="text-center font-weight-bolder col-1">이름</th>
								<th class="text-center font-weight-bolder col-3">이메일</th>
								<th class="text-center font-weight-bolder col-3">연락처</th>
							</tr>
						</thead>
		 				<tbody id="employeeTableBody">
							<c:forEach var="vo" items="${list}">
								<tr class="memList">
									<td class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2 py-3"><input type="checkbox"></td>
									<td class="text-center identify-no">${vo.employee_no}</td>
									<td class="text-center">${vo.id}</td>
									<td class="text-center">${vo.name}</td>
									<td class="text-center">${vo.email}</td>
									<td class="text-center">${vo.contact}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-lg-auto mt-2">
					<div class="row d-flex">
						<div class="col-lg-4 col-sm-6 col-12">${pageVO.startPage } / ${pageVO.endPage } of 총 개수</div>
						<div class="col-lg-2 col-sm-6 col-6 ms-auto">
							<button class="btn bg-gradient-success fs-6 w-100 mb-0 toast-btn px-2" id="selectaccessbtn" type="button" data-target="successToast">선택 승인</button>
						</div>
						<div class="col-lg-2 col-sm-6 col-6">
							<button class="btn bg-gradient-danger fs-6 w-100 mb-0 toast-btn px-2" id="selectdeniedbtn" type="button" data-target="dangerToast">선택 거부</button>
						</div>
					</div>
				</div>
				<div class="col-lg-auto d-flex justify-content-center">										
					<ul class="pagination mx-auto">
						<c:if test="${pageVO.prev }">
							<li class="page-link link-container"><a href="/hr/${listUrl }?page=${pageVO.endPage-pageVO.displayPageNum }&searchword=${searchword}" class="link"><<</a></li>
						</c:if>
						<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
							<li ${pageVO.cri.page == i ? "class='page-link link-container active'" : "class='page-link link-container'"} >
								<a href="/hr/${listUrl }?page=${i }&searchword=${searchword}" ${pageVO.cri.page == i ? "class='link-white'" : "class=''"}>${i }</a>
							</li>				
						</c:forEach>
						<c:if test="${pageVO.next }">
							<li class="page-link link-container"><a href="/hr/${listUrl }?page=${pageVO.startPage+pageVO.displayPageNum }&searchword=${searchword}" class="link">>></a></li>
						</c:if>
					</ul>
				</div>
			</div>			
			<div id="Modal" class="card col-lg-5 my-auto me-5 border" >
				<div class="d-flex card-header pt-4 pb-2">
					<h3 class="mx-auto">사원 정보</h3>
				</div>
				<hr class="horizontal dark m-2">
				<div class="card-body p-4">
					<div class="user-container d-flex align-items-center">
						<img class="img-thumbnail mb-4 me-4 max-width-200 w-25" alt="회원사진" id="photo_paths">
						<div class="user-info d-flex w-100">
							<table class="table">
								<tr>
									<th class="fs-5">사번</th>
									<td class="fs-5" id="employee_no"></td>
								</tr>
								<tr>
									<th class="fs-5">이름</th>
									<td class="fs-5" id="name"></td>
								</tr>
								<tr>
									<th class="fs-5">아이디</th>
									<td class="fs-5" id="id"></td>
								</tr>
							</table>
						</div>
					</div>
					<div id="tableContainer" class="modal-body">
						<table id="view-table" class="table">
							<tr>
								<th class="fs-5">이메일</th>
								<td class="fs-5" id="email"></td>
							</tr>
							<tr>
								<th class="fs-5">연락처</th>
								<td class="fs-5" id="contact"></td>
							</tr>
							<tr>
								<th class="fs-5">주소</th>
								<td class="fs-5" id="address"></td>
							</tr>
							<tr>
								<th class="fs-5">신청일</th>
								<td class="fs-5" id="regdate"></td>
							</tr>
						</table>
						
						<form id="edit-form" method="post">
							<input type="hidden" name="employee_no" id="employee_no-forSubmit">
							<input type="hidden" name="ad_identify" id="ad_identify-forSubmit">
					  	</form>
					</div>
					<div class="row d-flex justify-content-center py-3">
						<div class="col-lg-3 col-sm-6 col-12">
							<button class="btn bg-gradient-success fs-6 w-100 mb-0 toast-btn" id="accessbtn" type="button" data-target="successToast">승인</button>
						</div>
						<div class="col-lg-3 col-sm-6 col-12">
							<button class="btn bg-gradient-danger fs-6 w-100 mb-0 toast-btn" id="deniedbtn" type="button" data-target="dangerToast">거부</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 본문 종료 -->


<%@ include file="../include/footer.jsp"%>
<%@ include file="../include/js.jsp"%>

<script>
	$(document).ready(function() {
		
		var modal = document.getElementById("Modal");
				
		$("#hr-table").on("click", "tr td:not(:first-child)", function(event) {
	        var value = $(this).closest("tr").find("td.identify-no").text();
	        $.ajax({
	            url: '/hr/content?employee_no=' + value,
				method : 'GET',
				dataType: 'json',
				success : function(data) {
					$('#photo_paths').attr('src', data.photo_paths).attr('width', '100');
					$("#employee_no").text(data.employee_no);
					$("#employee_no-forSubmit").val(data.employee_no);
					$("#id").text(data.id);
				    $("#name").text(data.name);
				    $("#email").text(data.email);
				    $("#contact").text(data.contact);
				    $("#address").text(data.address);
				    $("#regdate").text(data.regdate);
				},
				error : function(error) {
					console.log('실패:', error);
				}
			});
	    });
		
		$("#accessbtn").click(function(){
			swal({
				  title: "정말 승인하시겠습니까?",
				  text: "정말로?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
					swal("고마워요!", {icon: "success"}).then(function(){
						$("#employee_no-forSubmit").val($("#employee_no").text());
						$("#ad_identify-forSubmit").val("access");
						$("#edit-form").submit();                
					});							
				  } else {
				    swal("너무해요!");
				  }
			});    
		});	
		
		$("#deniedbtn").click(function(){
			swal({
				  title: "정말 거부하시겠습니까?",
				  text: "정말로?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
					swal("너무해요!", {icon: "success"}).then(function(){
						$("#employee_no-forSubmit").val($("#employee_no").text());
						$("#ad_identify-forSubmit").val("denied");
						$("#edit-form").submit();                
					});							
				  } else {
				    swal("휴!");
				  }
			});    
		});			
	});
</script>