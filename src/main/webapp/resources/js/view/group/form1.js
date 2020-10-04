function fileUploadAction() {
    $('#uploadFile').trigger('click');
}

function setPreview(event){
    for(var image of event.target.files) {
        var reader = new FileReader();

        reader.onload = function (event) {
            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            img.setAttribute("class","col-4")
            document.querySelector("div.preview").appendChild(img);
        };
        reader.readAsDataURL(image);
    }
}


$(document).ready(function () {
    // 추가입력 토글버튼
    $(function () {
        $('.toggle-btn').bootstrapToggle({
            on: 'Enabled',
            off: 'Disabled'
        });
    })

    // 이미지 업로드
    $('#submit').click(function (e){
        e.preventDefault();

        var form = $('#filesForm')[0];
        var data = new FormData(form);

        data.append("mtNm",$('#mtNm').val());
        data.append("name",$('#name').val());
        data.append("detail",$('#detail').val());
        data.append("startDay",$('#startDay').val());
        data.append("area",$('#area').val());
        data.append("ageStart",$('#ageStart').val());
        data.append("ageEnd",$('#ageEnd').val());
        data.append("sex",$('#sex').val());
        data.append("staffMax",1);

        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: '/group/insert.do',
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            success(response){
                console.log(response)
                alert("등록완료")
                location.href = "/group/result.jsp"
            },
            error(response){
                alert("등록 오류, 새로고침 후 다시 시도 해주세요")
            }
        })
    })
})