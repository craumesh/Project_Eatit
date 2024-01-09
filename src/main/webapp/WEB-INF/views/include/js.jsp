<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="/resources/js/core/popper.min.js"></script>
  <script src="/resources/js/core/bootstrap.min.js"></script>
  <script src="/resources/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="/resources/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
  $(document).ready(function () {
    // 초기에는 모든 서브메뉴 목록을 숨김
    $("ul[id^='sm']").hide();

    // 메뉴 항목을 클릭했을 때 해당 서브메뉴를 보여줌 또는 숨김
    $("[id^='mn']").click(function (e) {
      // 클릭한 항목에 해당하는 서브메뉴 목록을 찾음
      var submenu = $(this).find("ul[id^='sm']");

      // 다른 모든 서브메뉴 목록을 숨김
      $("ul[id^='sm']").not(submenu).hide();

      // 클릭한 항목에 해당하는 서브메뉴 목록을 토글하여 보이거나 숨김
      submenu.toggle().css({ height: "0px" }).animate({ height: "125px" });

      // Stop the event from propagating to the document click handler
      e.stopPropagation();
    });

    // 다른 곳을 클릭했을 때 모든 서브메뉴 목록을 숨기지 않음
    $(document).click(function () {
      // do nothing here or perform other actions if needed
    });
  });
</script>


<script>
  document.addEventListener("DOMContentLoaded", function () {
    // 모든 네비게이션 항목을 가져오고 NodeList를 배열로 변환
    var navItems = Array.from(document.querySelectorAll('#sidenav-collapse-main .nav-item'));

    // 각 네비게이션 항목에 클릭 이벤트 리스너 추가
    navItems.forEach(function(item) {
      item.addEventListener('click', function (event) {
        // 현재 클릭한 네비게이션 항목의 링크(a 태그)에 'bg-gradient-primary' 클래스 추가
        var link = this.querySelector('span');
        if (link) {
          link.classList.add('bg-gradient-primary');
        }

        // 다른 네비게이션 항목의 링크(a 태그)에 'bg-gradient-primary' 클래스 제거
        navItems.filter(function(navItem) {
          return navItem !== item;
        }).forEach(function(otherNavItem) {
          var otherLink = otherNavItem.querySelector('span');
          var otherLink1 = otherNavItem.querySelector('a');
          if (otherLink) {
            otherLink.classList.remove('bg-gradient-primary');
          if (otherLink1) {
              otherLink1.classList.remove('bg-gradient-primary');
          }
          }
        });
      });
    });
  });
</script>

<script>
document.addEventListener("DOMContentLoaded", function () {
	  // 모든 네비게이션 항목을 가져옵니다.
	  var navItems = document.querySelectorAll(".nav-item:not(.ignore-click)");

	  // 클릭 이벤트 리스너를 문서 전체에 추가합니다.
	  document.addEventListener("click", function (event) {
	    // 클릭된 요소가 네비게이션 항목인지 확인합니다.
	    var isNavItemClick = Array.from(navItems).some(function (navItem) {
	      return navItem.contains(event.target);
	    });

	    // 만약 클릭된 요소가 네비게이션 항목이 아니라면 아무것도 하지 않습니다.
	    if (!isNavItemClick) {
	      return;
	    }
	  });

	  // 각 네비게이션 항목에 클릭 이벤트 리스너를 추가합니다.
	  navItems.forEach(function (item) {
	    item.addEventListener("click", function (event) {
	      // 현재 margin-bottom 값을 가져옵니다.
	      var currentMarginBottom = parseInt(
	        window.getComputedStyle(item).marginBottom
	      );

	      // 만약 현재 margin-bottom 값이 20px이면 제거하고, 아니면 추가합니다.
	      item.style.marginBottom =
	        currentMarginBottom === 20 ? "" : "20px";

	      // 모든 다른 네비게이션 항목에서 "margin-bottom" 스타일을 제거합니다.
	      navItems.forEach(function (navItem) {
	        if (navItem !== item) {
	          navItem.style.marginBottom = "";
	        }
	      });

	      // Stop the event from propagating to the document click handler
	      event.stopPropagation();
	    });
	  });
	});
</script>


<script>
var result = "${result}";

if(result == "LOGOUT"){
	swal('로그아웃을 해?',"일 해야지 어디가?",'success');
}
if(result == "LOGIN"){
	swal('로그인 성공!',"일하러 온 걸 환영해♥",'success');	
}
if(result == "FAILLOGIN"){
	swal("비밀번호를 틀리셨군요!","비밀번호를 다시 입력해주세요","error");
}
if(result == "JOIN"){
	swal("회원가입 성공!!","이제 일하러 가볼까?","success");
}
if(result == "WAIT"){
	swal("승인 대기중!!","인사담당에게 연락해보시오","warning");
}
</script>

  <script>
	var infoModal = document.getElementById("InfoModal");

	$(document).ready(function() {			
		var urlParams = window.location.href;	
		
		$("#profileBtn").click(function() {
			$.ajax({
				url : '/members/profile',
				method : 'GET',
				dataType: 'json',
				success : function(data) {
					$('#info_photo_paths').attr('src', data.photo_paths).attr('width', '100');
	                $("#info_employee_no").text(data.employee_no);
	                $("#infoEmployee_no-forSubmit").val(data.employee_no);
	                $("#info_id").text(data.id);
	                $("#info_name").text(data.name);
	                $("#info_depart_name").text(data.depart_name);
	                $("#info_position_name").text(data.position_name);
	                $("#info_email").text(data.email);
	                $("#info_extension_no").text(data.extension_no);
	                $("#info_contact").text(data.contact);
	                $("#info_address").text(data.address);
	                $("#info_status").text(data.status);
					infoModal.style.display = "block";
				},
				error : function(error) {
					console.log('실패:', error);
				}
			});
		});
		
		$("#infoClosebtn").click(function(){
			infoModal.style.display = "none";
			location.reload();
		});
		
		$("#infoEditbtn").click(function(){
			if ($("#infoEdit-table").hasClass("d-none")) {
				$("#infoView-table").toggleClass("d-none");
			    $("#infoEdit-table").toggleClass("d-none");	
				$("#infoEditbtn").text("수정 완료");
			    getEditMyInfo();
			    updatePositionMyNameSelect();
			} else {
				swal({
					  title: "정말 수정하시겠습니까?",
					  text: "이 사람도 누군가의 가장입니다",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
						swal("당신은 정말 잔인한 사람이에요!", {icon: "success"}).then(function(){
							$("#infoClosebtn").click(); 
							$("#infoPrev-url-forSubmit").val(urlParams);
							$("#infoEdit-form").submit();                
						});							
					  } else {
					    swal("우유부단 하시군요!");
					  }
				});		    
			}		    
		});		
		
		$(window).click(function(event){
			if (event.target == infoModal) {
				infoModal.style.display = "none";
				location.reload();
			}
			
			if (!$(event.target).closest('.input-group').length) {
		        $(".input-group").removeClass("focused is-focused");
		    }
		});		
		
		$(".input-group").click(function(){
			$(this).addClass("focused is-focused");
		});
		
		$("#info_depart_name-select").on("change", function() {			
			updatePositionMyNameSelect();
		});	
	});
	
	function getEditMyInfo() {
	    getSelected("#info_depart_name");
	    getSelected("#info_position_name");
		$("#info_email-input").val($("#info_email").text());
		$("#info_extension_no-input").val($("#info_extension_no").text());
		$("#info_contact-input").val($("#info_contact").text());
		$("#info_address-input").val($("#info_address").text());
	    getSelected("#info_status");
	}
	
	function updatePositionMyNameSelect() {
	    var infoSelectedValue = $("#info_depart_name-select").val();
	    var infoPositionNameSelect = $("#info_position_name-select");

	    infoPositionNameSelect.empty();

	    switch (infoSelectedValue) {
	      case "미정":
	        addOption(infoPositionNameSelect, "미정");
	        break;
	      case "관리":
	        addOption(infoPositionNameSelect, "정보");
	        addOption(infoPositionNameSelect, "재고");
	        break;
	      case "생산":
	        addOption(infoPositionNameSelect, "상품");
	        addOption(infoPositionNameSelect, "설비");
	        break;
	      case "영업":
	        addOption(infoPositionNameSelect, "자재");
	        addOption(infoPositionNameSelect, "납품");
	        break;
	      case "총괄":
	        addOption(infoPositionNameSelect, "임원");
	        break;
	    }
	}
	
	function addOption(selectElement, value) {
		var option = $("<option>").text(value).val(value);
		selectElement.append(option);
	}
	
	function getSelected(id) {
		var optionToSelect = $(id+"-select option").filter(function() {
			return $(this).text().indexOf($(id).text()) !== -1;
		});
		
		if (optionToSelect.length > 0) {
		    optionToSelect.prop("selected", true);
	    }
	}
	
</script>

  <script>
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("info_address-input").value = addr;
            }
        }).open();
    }
</script>