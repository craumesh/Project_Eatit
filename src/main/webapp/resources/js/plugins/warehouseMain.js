////////////////////// 팝업 중앙 정렬 ////////////////////////
function popup() {
    const width = 720;
    const height = 775;

    // 현재 창의 중앙 좌표 계산
    const left = (window.innerWidth - width) / 2 + window.screenLeft;
    const top = (window.innerHeight - height) / 2 + window.screenTop;

    // 팝업 창 열기
    window.open('/warehouse/warehouseRegist', 'popup', `width=${width}, height=${height}, left=${left}, top=${top}`);
}
////////////////////// 팝업 중앙 정렬 ////////////////////////

/////////////////////// 상세 페이지(모달) ////////////////////
var modal = document.getElementById("warehouseModal");
var span = document.getElementsByClassName("btn-close")[0];

$(document).ready(function() {
	
	// 체크박스 선택
	$("#cbx_chkAll").click(function() {
		if ($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
		else $("input[name=chk]").prop("checked", false);
	});

	$("input[name=chk]").click(function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;

		if (total != checked) $("#cbx_chkAll").prop("checked", false);
		else $("#cbx_chkAll").prop("checked", true);
	});
	// 체크박스 선택
	
    $(".warehouseDetailBtn").on("click", function() {
        var value = $(this).val();
//        console.log(value);
        $.ajax({
            url: '/warehouseContent?warehouse_no=' + value,
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                $("#warehouse_no").text(data.warehouse_no);
                $("#location_name").text(data.location_name);
                $("#category").text(data.category);
                $("#warehouse_name").text(data.warehouse_name);
                $("#name").text(data.name);
                $("#contact").text(data.contact);
                $("#email").text(data.email);
                $("#use_status").text(data.use_status);
                $("#note").text(data.note);
                $("#updater").text(data.updater);
                $("#updatedate").text(data.updatedate);
                console.log(data);
                modal.style.display = "block";
            },
            error: function(error) {
                console.log('실패:', error);
            }
        });
    });

    $("#closebtn").click(function(){
		modal.style.display = "none";
		location.reload();
	});
    
    $("#editbtn").click(function(){
		if ($("#edit-table").hasClass("d-none")) {
			$("#view-table").toggleClass("d-none");
		    $("#edit-table").toggleClass("d-none");	
			$("#editbtn").text("수정 완료");
		    getEditInfo();
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
						$("#closebtn").click(); 
						$("#edit-form").submit();                
					});							
				  } else {
				    swal("우유부단 하시군요!");
				  }
			});		    
		}		    
	});

    $(window).click(function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
            location.reload();
        }
        
        if (!$(event.target).closest('.input-group').length) {
	        $(".input-group").removeClass("focused is-focused");
	    }
    });
    
    $(".input-group").click(function(){
		$(this).addClass("focused is-focused");
	});
    
    function getEditInfo() {
    	$("#category-input").val($("#category").text());
    	$("#warehouse_name-input").val($("#warehouse_name").text());
		$("#name-input").val($("#name").text());
		$("#contact-input").val($("#contact").text());
		$("#email-input").val($("#email").text());
		$("#note-input").val($("#note").text());
	}
    
});
/////////////////////// 상세 페이지(모달) ////////////////////


//window.addEventListener('load', () => {
//  const forms = document.getElementsByClassName('validation-form');
//
//  Array.prototype.filter.call(forms, (form) => {
//    form.addEventListener('submit', function (event) {
//      if (form.checkValidity() === false) {
//        event.preventDefault();
//        event.stopPropagation();
//      }
//
//      form.classList.add('was-validated');
//    }, false);
//  });
//}, false);
