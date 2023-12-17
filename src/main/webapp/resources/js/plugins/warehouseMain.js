function submitWarehouseForm() {
    // AJAX를 사용하여 데이터를 서버로 전송
    var formData = $("#warehouseForm").serialize();
    $.ajax({
        type: "POST",
        url: "/warehouse/warehouseMain",  // 해당 URL은 실제 프로젝트에 맞게 변경
        data: formData,
        success: function (response) {
            // 서버 응답에 대한 처리
            console.log(response);
            // 필요한 작업 수행 (예: 창고 목록 새로고침 등)
            location.reload();
        },
        error: function (error) {
            console.error(error);
        }
    });
}
