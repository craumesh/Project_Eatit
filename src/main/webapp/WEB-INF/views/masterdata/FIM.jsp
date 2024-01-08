<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>

<style>
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
	 z-index: 1000;
}

.modal-content {
	background-color: #fefefe;
	margin: 5% auto;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	width: 50%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
	position: absolute;
	right: 20px;
	top: 20px;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.fixed-size-textarea {
	resize: none; /* 드래그에 의한 크기 조정을 막습니다. */
	width: 900px; /* 가로 크기를 조절할 수 있습니다. */
	height: 150px; /* 세로 크기를 조절할 수 있습니다. */
}
</style>
<!-- 본문 시작 -->
<div class="col-12">
	<div class="card my-4 mx-4">
		<div class="card-header position-relative p-0 mt-n4 mx-3 z-index-2">
			<div
				class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-3 d-flex align-items-center">
				<h3 class="text-white text-capitalize ps-5 my-2 py-1">설비 정보 관리</h3>
				<form action="/masterdata/FIMsearch"
					class="ms-md-auto bg-white rounded p-2 mb-0 d-flex align-items-center"
					method="GET">
					<div class="align-items-center d-flex flex-column mx-1">
						<div class="input-group input-group-outline">
							<label class="form-label">검색어</label> <input type="text"
								name="keyword" class="form-control" value="${keyword }">
						</div>
					</div>

					<div class="align-items-center d-flex flex-column py-1 ct-example">
						<button type="submit" id="searchbtn"
							class="btn btn-outline-primary mb-0 py-2 mx-1 fs-6">검색</button>
					</div>
				</form>
			</div>
		</div>

		<div class="card-body mx-5 px-0 pb-4">
			<div class="p-0">
				<table id="hr-table"
					class="table table-hover align-items-center mb-0">
					<thead>
						<tr>
							
							<th class="text-center py-3 font-weight-bolder col-2">설비번호</th>
							<th class="text-center font-weight-bolder col-1">설비이름</th>
							<th class="text-center font-weight-bolder col-1">설비상태</th>
							<th class="text-center font-weight-bolder col-1">관리자번호</th>
							<th class="text-center font-weight-bolder col-1">사용목적</th>
							<th class="text-center font-weight-bolder col-3">설치날짜</th>
							<th class="text-center font-weight-bolder col-2">설비위치</th>
							 
							 
							<th class="text-center font-weight-bolder col-1">
							


								<ul class="navbar-nav  justify-content-end">
									<li class="nav-item d-flex align-items-center"><span
										class="d-sm-inline d-none"><button
												onclick="openModal()" class="btn btn-success">설비정보등록</button></span></li>
								</ul>


							</th>
						</tr>
					</thead>
					<tbody id="productTableBody">
						<c:forEach var="product" items="${FIMList}">
							<tr>
							    
								<td class="text-center py-2-3 identify-no">${product.machine_code}</td>
								<td class="text-center py-2-3">${product.machine_name}</td>
								<td class="text-center"><span class="badge badge-sm bg-gradient-success">${product.machine_status}</span></td>
								<td class="text-center py-2-3">${product.employee_no}</td>
								<td class="text-center py-2-3">${product.purpose_of_use}</td>
								<td class="text-center py-2-3">${product.installation_date}</td>
								<td class="text-center py-2-3">${product.machine_location}</td>
								
								<td class="text-center py-2-3">
									<button onclick="openEditModal(event)"
										class="btn btn-secondary">설비정보수정</button>

									<form action="/masterdata/FIMdelete" method="post">
										<input type="hidden" name="machine_code"
											value="${product.machine_code}"> 
										<button type="submit" class="btn btn-dark">설비정보삭제</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		
		<c:if test="${not empty referer}">
			<a href="${referer}" class="btn btn-primary">뒤로 가기</a>
		</c:if>

		<div class="row">
			<div class="col-sm-5">
				<div class="ms-6"></div>
			</div>
			<div class="col-sm-5 mb-3">
				<ul class="pagination">
					<c:if test="${pageVO.prev}">
						<li class="page-link link-container"><a
							href="javascript:void(0);"
							onclick="goToPageWithKeyword(${pageVO.startPage - 1})"
							class="page-link rounded fw-bolder${pageVO.cri.page == pageVO.startPage - 1 ? ' link-white' : ''}"><<</a></li>
					</c:if>
					<c:forEach var="i" begin="${pageVO.startPage}"
						end="${pageVO.endPage}" step="1">
						<c:if test="${i <= pageVO.totalCount / pageVO.cri.pageSize + 1}">
							<li
								${pageVO.cri.page == i ? 'class="link-container active"' : 'class="link-container"'}>
								<a href="javascript:void(0);"
								onclick="goToPageWithKeyword(${i})"
								class="page-link rounded fw-bolder${pageVO.cri.page == i ? ' link-white' : ''}">${i}</a>
							</li>
						</c:if>
					</c:forEach>
					<c:if test="${pageVO.next}">
						<li class="page-link link-container"><a
							href="javascript:void(0);"
							onclick="goToPageWithKeyword(${pageVO.endPage + 1})"
							class="page-link rounded fw-bolder${pageVO.cri.page == pageVO.endPage + 1 ? ' link-white' : ''}">>></a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>

</div>
<!-- 본문 종료 -->


<%@ include file="../include/footer.jsp"%>
<%@ include file="../include/js.jsp"%>

<div id="myModal" class="modal">
	<div class="modal-content">

		<div class="modal-header py-4">
			<button id="closebtn"
				class="btn bg-gradient-primary position-absolute py-1 px-2 mt-2 end-5"
				onclick="closeModal()">X</button>
			<h3 class="modal-title mx-auto">설비정보 등록</h3>
		</div>
		<div class="modal-body p-5">

			<div id="tableContainer" class="modal-body">
				<form id="myForm" method="post" action="/masterdata/FIMinsert">
					<table id="view-table" class="table">
						<tbody>

							
							<tr>
								<th class="fs-5">설비이름</th>
								<td class="fs-5" id="position_name"><select
									name="machine_name" class="form-select">
										<option value="Production">Production</option>
										<option value="Packaging">Packaging</option>										
								</select></td>
							</tr>
							<tr>
								<th class="fs-5">설비상태</th>
								<td class="fs-5" id="email"><select
									name="machine_status" class="form-select">
										<option value="고장">고장</option>
										<option value="생산대기">생산대기</option>
										<option value="생산중">생산중</option>
										<option value="수리중">수리중</option>
										<option value="점검중">점검중</option>
										<option value="준비중">준비중</option>
								</select></td>
							</tr>
							<tr>
								<th class="fs-5">관리자번호</th>
								<td class="fs-5" id="extension_no"><input type="text"
									name="employee_no" class="form-control"></td>
							</tr>
							<tr>
								<th class="fs-5">작동목적</th>
								<td class="fs-5" id="contact"> <input type="text"
									name="purpose_of_use" class="form-control"></td>
							</tr>
							<tr>
								<th class="fs-5">설치일</th>
								<td class="fs-5" id="address"><input type="date"
									name="installation_date" class="form-control"></td>
							</tr>
							<tr>
								<th class="fs-5">설비위치</th>
								<td class="fs-5" id="status"><select
									name="machine_location" class="form-select">
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>																			
								</select></td>
							</tr>
							
						</tbody>
					</table>
					<div class="text-center">
						<button id="editbtn"
							class="btn bg-gradient-danger fs-6 mb-0 py-2 px-3" type="submit">설비정보
							등록</button>
					</div>

				</form>
			</div>


		</div>

	</div>
</div>
<div id="editModal" class="modal">
	<div class="modal-content">

		<div class="modal-header py-4">
			<button id="closebtn"
				class="btn bg-gradient-primary position-absolute py-1 px-2 mt-2 end-5"
				onclick="closeEditModal()">X</button>
			<h3 class="modal-title mx-auto">설비정보 수정</h3>
		</div>
		<div class="modal-body p-5">

			<div id="tableContainer" class="modal-body">
				<form id="editForm" method="post" action="/masterdata/FIMedit">
					<table id="view-table" class="table">
						<tbody>
						
							
							<tr>
								<th class="fs-5">설비번호</th>
								<td class="fs-5" id="depart_name"><input type="text"
									name="machine_code" class="form-control" readonly="readonly"></td>
							</tr>
							<tr>
								<th class="fs-5">설비이름</th>
								<td class="fs-5" id="position_name"><input type="text"
									name="machine_name" class="form-control"></td>
							</tr>
							<tr>
								<th class="fs-5">설비상태</th>
								<td class="fs-5" id="email"><select
									name="machine_status" class="form-select">
										<option value="고장">고장</option>
										<option value="생산대기">생산대기</option>
										<option value="생산중">생산중</option>
										<option value="수리중">수리중</option>
										<option value="점검중">점검중</option>
										<option value="준비중">준비중</option>
								</select></td>
							</tr>
							<tr>
								<th class="fs-5">관리자번호</th>
								<td class="fs-5" id="extension_no"><input type="text"
									name="employee_no" class="form-control"></td>
							</tr>
							
							<tr>
								<th class="fs-5">작동목적</th>
								<td class="fs-5" id="address"><input type="text"
									name="purpose_of_use" class="form-control"></td>
							</tr>
							<tr>
								<th class="fs-5">설치날짜</th>
								<td class="fs-5" id="status"><input type="date"
									name="installation_date" class="form-control"></td>
							</tr>
							<tr>
								<th class="fs-5">설비위치</th>
								<td class="fs-5" id="status"><select
									name="machine_location" class="form-select">
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>	
								</select></td>
							</tr>
						</tbody>
					</table>
					<div class="text-center">
						<button id="editbtn"
							class="btn bg-gradient-danger fs-6 mb-0 py-2 px-3" type="submit">설비정보
							수정</button>
					</div>

				</form>
			</div>


		</div>

	</div>
</div>




<c:if test="${searchError}">
	<script>
    
    swal("검색 오류", "해당하는 검색어가 없습니다!", "error").then(function() {
        window.history.back(); // 이전 페이지로 이동
    });

    </script>
</c:if>



<script>
window.onload = function() {
    const urlParams = new URLSearchParams(window.location.search);
    const keyword = urlParams.get('keyword') || '';
    const cells = document.querySelectorAll("#productTableBody td"); // 모든 셀을 가져옴

    if (keyword) { // 검색어가 있는 경우에만 실행
        cells.forEach(cell => {
            const cellText = cell.textContent.toLowerCase(); // 셀의 텍스트를 소문자로 변환

            if (cellText.includes(keyword.toLowerCase())) { // 검색어를 포함하는 경우
                const newText = cellText.replace(new RegExp(keyword.toLowerCase(), 'g'), '<span style="background-color: gray; color: white;">' + keyword.toLowerCase() + '</span>');
                cell.innerHTML = newText;
            }
        });
    }
};


</script>

<script>
function goToPageWithKeyword(page) {
    var keyword = new URLSearchParams(window.location.search).get('keyword');
    var currentUrl = window.location.href;
    var urlWithoutParams = currentUrl.split('?')[0];

    var url = urlWithoutParams + '?page=' + page;

    if (keyword) {
        url += '&keyword=' + keyword;
    }

    window.location.href = url;
}
</script>





<script>
    document.addEventListener('DOMContentLoaded', () => {
        const deleteForms = document.querySelectorAll('form[action="/masterdata/FIMdelete"]');

        deleteForms.forEach(form => {
            form.addEventListener('submit', function(event) {
                event.preventDefault(); // 기본 제출 동작 막기

                const machine_code = this.querySelector('input[name="machine_code"]').value;

                swal({
                    title: '품목정보 삭제',
                    text: '정말 삭제하시겠습니까?',
                    icon: 'warning',
                    buttons: true,
                    dangerMode: true,
                }).then((willDelete) => {
                    if (willDelete) {
                        swal('삭제 성공', '삭제가 완료되었습니다', 'info').then(() => {
                            this.submit(); // 확인 시 폼 제출
                        });
                    } else {
                        swal('삭제 취소', '삭제가 취소되었습니다.', 'info');
                    }
                });

            });
        });
    });
</script>





<script>
    function openModal() {
        document.getElementById("myModal").style.display = "block";
    }

    function closeModal() {
        document.getElementById("myModal").style.display = "none";
        
    }

    function openEditModal(event) {
        // 수정 버튼이 속한 <tr> 요소를 찾습니다.
        const selectedRow = event.target.closest('tr');

        // 각 셀의 데이터를 가져와 변수에 저장합니다.
       
        const machineCode = selectedRow.cells[0].innerText;
        const machineName = selectedRow.cells[1].innerText;
        const machineStatus = selectedRow.cells[2].innerText;
        const employeeNo = selectedRow.cells[3].innerText;
        const purposeUse = selectedRow.cells[4].innerText;
        const installDate = selectedRow.cells[5].innerText;
        const machineLoca = selectedRow.cells[6].innerText;
        

        // 가져온 데이터를 수정 모달에 넣어줍니다.
        document.getElementById("editModal").style.display = "block";
        document.querySelector('#editForm [name="machine_code"]').value = machineCode;
        document.querySelector('#editForm [name="machine_name"]').value = machineName;
        document.querySelector('#editForm [name="machine_status"]').value = machineStatus;
        document.querySelector('#editForm [name="employee_no"]').value = employeeNo;
        document.querySelector('#editForm [name="purpose_of_use"]').value = purposeUse;
        document.querySelector('#editForm [name="installation_date"]').value = installDate;
        document.querySelector('#editForm [name="machine_location"]').value = machineLoca;
        
       
        
    }
    function closeEditModal() {
        document.getElementById("editModal").style.display = "none";
        
    }
    function validateForm(formId) {
        const form = document.getElementById(formId);
        const inputs = form.getElementsByTagName('input');

        for (let i = 0; i < inputs.length; i++) {
            if (inputs[i].value.trim() === '') {
                
                return false;
            }
        }
        return true;
    }

    document.getElementById('myForm').addEventListener('submit', function(event) {
        event.preventDefault(); // 기본 제출 동작 방지

        if (!validateForm('myForm')) {
            // 폼이 유효하지 않은 경우
            swal('입력하지 않은 칸이 있습니다!', '', 'warning');
            return;
        }

        // 숫자만 입력되도록 유효성 검사
        const employeeNo = document.getElementsByName('employee_no')[0].value;
        if (!/^\d+$/.test(employeeNo)) {
            swal('관리자 번호란에는 숫자만 입력할 수 있습니다!', '', 'warning');
            return;
        }

        // 유효한 경우 SweetAlert로 사용자에게 확인 요청
        swal({
                title: '설비정보 등록',
                text: '정말 등록하시겠습니까? 한 번 더 정보를 확인해 주세요',
                icon: 'info',
                buttons: true,
                dangerMode: false,
            })
            .then((willSubmit) => {
                if (willSubmit) {
                    swal('등록이 성공적으로 완료됐습니다!', '', 'success')
                        .then(() => {
                            event.target.submit(); // 확인을 누르면 submit 실행
                        });
                } else {
                    swal('등록 취소', '등록이 취소되었습니다.', 'info');
                }
            });
    });

    document.getElementById('editForm').addEventListener('submit', function (event) {
    	 event.preventDefault(); // 기본 제출 동작 방지

    	    if (!validateForm('editForm')) {
    	        // 폼이 유효하지 않은 경우
    	        swal('입력하지 않은 칸이 있습니다!', '', 'warning');
    	        return;
    	    }

    	    // 유효한 경우 SweetAlert로 사용자에게 확인 요청
    	    swal({
    	        title: '품목정보 수정',
    	        text: '정말 수정하시겠습니까? 한 번 더 정보를 확인해 주세요',
    	        icon: 'info',
    	        buttons: true,
    	        dangerMode: false,
    	    })
    	    .then((willSubmit) => {
    	        if (willSubmit) {
    	            swal('수정이 성공적으로 완료됐습니다!', '', 'success')
    	            .then(() => {
    	                event.target.submit(); // 확인을 누르면 submit 실행
    	            });
    	        } else {
    	            swal('수정 취소', '수정이 취소되었습니다.', 'info');
    	        }
    	    });
    });
   
    
    
</script>
