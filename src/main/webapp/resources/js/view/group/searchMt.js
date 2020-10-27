function setMtnm(e){
    $('#mtNm').val(e.innerText);
    $('#pathModal').modal("hide");
}

$(document).ready(function () {
    $('#searchByMtnm').click(function (e){
        e.preventDefault();
        $('.mountainList').children().remove()

        var data = { mtNm : $('#mountainName').val(),
            arNm : "" };

        $.ajax({
            type: "POST",
            url: "/searchMt.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success(response){

                for (var i=0;i<response.body.items.length;i++){

                    var mntnm = response.body.items[i].mntnm;

                    $('.mountainList')
                        .append('<li class="mt-3" style="list-style: none"><a href="javascript:void(0);" onclick="setMtnm(this);" >'+mntnm+'</a></li>')
                }
            },
            error(data){
                alert("산오르기 등록 오류, 다시 시도해주세요.");
            }
        })
    })
})