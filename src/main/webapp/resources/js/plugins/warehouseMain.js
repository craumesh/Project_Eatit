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



var modal = document.getElementById("warehouseModal");
var span = document.getElementsByClassName("btn-close")[0];

$(document).ready(function() {
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

    $(".btn-close").click(function() {
        modal.style.display = "none";
    });

    $(window).click(function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    });
});