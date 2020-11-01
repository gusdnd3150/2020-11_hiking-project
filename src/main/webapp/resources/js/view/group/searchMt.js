function setMtnm(e){
    $('#mtNm').val(e.innerText);
    $('#pathModal').modal("hide");
}

$(document).ready(function () {
    $('#searchByMtnm').click(function (e){
        e.preventDefault();

        $('.mountainList').children().remove()

        var type = $('#searchType').val();

        var data = {
            mtNm : $('#keyword').val(),
            arNm : "",
            searchWrd : $('#keyword').val()
        };

        if(type == 'mountain') {

            $.ajax({
                type: "POST",
                url: "/searchMt.do",
                data: JSON.stringify(data),
                dataType: 'json',
                contentType: "application/json; charset=utf-8;",
                success(response) {
                    if(response.body.items == null){
                        var html = '';
                        html += '<div>검색 결과가 없습니다</div>'

                        $('.mountainList').append(html)

                    }else if(response.body.items != null) {
                        for (var i = 0; i < response.body.items.length; i++) {

                            var mntnm = response.body.items[i].mntnm;

                            var html = '';
                            html += '<li class="mt-3" style="list-style: none"><a href="javascript:void(0);" onclick="setMtnm(this);" >';
                            html += mntnm
                            html += '</a></li>';

                            $('.mountainList').append(html)
                        }
                    }
                },
                error(data) {
                    alert("산오르기 등록 오류, 다시 시도해주세요.");
                }
            })
        }else if(type == 'trail'){
            $.ajax({
                type: "POST",
                url: "/searchTrail.do",
                data: JSON.stringify(data),
                dataType: 'json',
                contentType: "application/json; charset=utf-8;",
                success(response) {

                    if(response.body.items == null){
                        var html = '';
                        html += '<div>검색 결과가 없습니다</div>'

                        $('.mountainList').append(html)

                    }else if(response.body.items != null) {
                        for (var i = 0; i < response.body.items.length; i++) {

                            var mntnnm = response.body.items[i].mntnnm;
                            var baekdusections = response.body.items[i].baekdusections;
                            var baekdusectione = response.body.items[i].baekdusectione;

                            var html = '';
                            html += '<li class="mt-3" style="list-style: none"><a href="javascript:void(0);" onclick="setMtnm(this);" >';
                            html += '['+mntnnm+']'+ baekdusections + '~' + baekdusectione
                            html += '</a></li>';

                            $('.mountainList').append(html)
                        }
                    }
                },
                error(data) {
                    alert("산오르기 등록 오류, 다시 시도해주세요.");
                }
            })
        }
    })
})