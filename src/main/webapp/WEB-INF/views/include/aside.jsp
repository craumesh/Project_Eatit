<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark" id="sidenav-main">
   <div class="sidenav-header">
     <a class="navbar-brand m-0" href="/">
       <!-- <span class="ms-1 font-weight-bold text-white">디저트카페 EatIt</span> -->
       <img src="../resources/img/mainLogo.png" style="margin-left: 30px;">
     </a>
   </div>
   <hr class="horizontal light mt-0 mb-2">
   <div class="collapse navbar-collapse  w-auto" id="sidenav-collapse-main">
		<button class="btn bg-gradient-secondary w-70 fs-6 ms-4-5 mt-3" onclick="location.href='/'" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
		   	메인
		 </button>
		 <div class="dropdown mb-3 mt-3 ms-4-5 w-100">
			  <button class="btn bg-gradient-secondary dropdown-toggle w-70 fs-6" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
			   	 기준정보 관리
			  </button>
			  <ul class="dropdown-menu w-80" aria-labelledby="dropdownMenuButton">
   			  	<li>
   			  		<a class="dropdown-item fs-6" href="${path}/masterdata/BomMain">BOM 관리</a>
		  		</li>
				<li>
					<a class="dropdown-item fs-6" href="${path}/masterdata/QualityManagement">설비정보관리</a>
				</li>
			  </ul>
		 </div>
   		 <div class="dropdown mb-3 ms-4-5 w-100">
	  		<button class="btn bg-gradient-secondary dropdown-toggle w-70 fs-6" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
	   			 자재 관리
 		    </button>
	  		<ul class="dropdown-menu w-80" aria-labelledby="dropdownMenuButton">
			    <li>
			    	<a class="dropdown-item fs-6" href="#">서브메뉴 1</a>
			    </li>
			    <li>
			    	<a class="dropdown-item fs-6" href="#">서브메뉴 2</a>
			    </li>
			    <li>
			    	<a class="dropdown-item fs-6" href="#">서브메뉴 3</a>
			    </li>
	  		</ul>
		 </div>
      	 <div class="dropdown mb-3 ms-4-5 w-100">
			<button class="btn bg-gradient-secondary dropdown-toggle w-70 fs-6" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
			   	 설비 & 생산 관리
			</button>
  			<ul class="dropdown-menu w-80" aria-labelledby="dropdownMenuButton">
			    <li>
			    	<a class="dropdown-item fs-6" href="/machine/machine">설비 관리</a>
			    </li>
			    <li>
			    	<a class="dropdown-item fs-6" href="#">서브메뉴 2</a>
			    </li>
			    <li>
			    	<a class="dropdown-item fs-6" href="#">서브메뉴 3</a>
			    </li>
	  		</ul>
		</div>
      	<div class="dropdown mb-3 ms-4-5 w-100">
			<button class="btn bg-gradient-secondary dropdown-toggle w-70 fs-6" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
			   	창고 관리
			</button>
	  		<ul class="dropdown-menu w-80" aria-labelledby="dropdownMenuButton">
		    	<li>
		    		<a class="dropdown-item fs-6" href="/warehouse/warehouseMain">창고 목록</a>
		    	</li>
			    <li>
			    	<a class="dropdown-item fs-6" href="/warehouse/warehouseStockMain">창고 재고 현황</a>
			    </li>
			    <li>
			    	<a class="dropdown-item fs-6" href="#">서브메뉴 3</a>
			    </li>
			</ul>
		</div>
        <div class="dropdown mb-3 ms-4-5 w-100">
	  		<button class="btn bg-gradient-secondary dropdown-toggle w-70 fs-6" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
	   			납품 관리
	  		</button>
			<ul class="dropdown-menu w-80" aria-labelledby="dropdownMenuButton">
			  	<li>
			  		<a class="dropdown-item fs-6" href="/purchaseOrder/orderList">발주 관리</a>
			  	</li>
			    <li>
			    	<a class="dropdown-item fs-6" href="/saleOrder/orderList">수주 관리</a>
			    </li>
			</ul>
		</div>
        <div class="dropdown ms-4-5 w-100">
			<button class="btn bg-gradient-secondary dropdown-toggle w-70 fs-6" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
			   	인사 관리
			</button>
			<ul class="dropdown-menu w-80" aria-labelledby="dropdownMenuButton">
			    <li>
			    	<a class="dropdown-item fs-6" href="/hr/list">인사 관리</a>
			    </li>
			    <li>
			    	<a class="dropdown-item fs-6" href="#">서브 메뉴 2</a>
			    </li>
			    <li>
			    	<a class="dropdown-item fs-6" href="#">서브메뉴 3</a>
			    </li>
			</ul>
		</div>
   </div>
 </aside>