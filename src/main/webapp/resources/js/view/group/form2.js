$(document).ready(function (){
    $('.drag_drop_zone')
        .on("dragover", dragOver)
        .on("dragleave", dragOver)
        .on("drop", uploadFiles);

    function dragOver(e){
        e.stopPropagation();
        e.preventDefault();
        if (e.type == "dragover") {
            $(e.target).css({
                "background-color": "whitesmoke",
                "outline-offset": "-20px"
            });
        } else {
            $(e.target).css({
                "background-color": "whitesmoke",
                "outline-offset": "-5px"
            });
        }
    }

    function uploadFiles(e) {
        e.stopPropagation();
        e.preventDefault();
        dragOver(e);

        e.dataTransfer = e.originalEvent.dataTransfer;
        var files = e.target.files || e.dataTransfer.files;
        if (files.length > 1) {
            alert('하나만 올려주세요.');
            return;
        }
        if (files[0].type.match(/image.*/)) {
            $(e.target).css({
                "background-image": "url(" + window.URL.createObjectURL(files[0]) + ")",
                "outline": "none",
                "background-size": "100% 100%"
            });
        }else{
            alert('이미지가 아닙니다.');
            return;
        }
    }
    $(function() {
        $('.toggle-btn').bootstrapToggle({
            on: 'Enabled',
            off: 'Disabled'
        });
    })

    //버튼 증감
    const number = document.getElementById("staffMax");
    const increase = document.getElementById("increase");
    const decrease = document.getElementById("decrease");

    increase.onclick = () => {
        const current = parseInt(number.innerText, 10);
        if(current >= 50){
            alert("최대인원을 초과했습니다")
            return
        }
        number.innerText = current + 1 + "명";
    };

    decrease.onclick = () => {
        const current = parseInt(number.innerText, 10);
        if(current < 2){
            alert("2명 이상으로 설정해주세요");
            return
        }
        number.innerText = current - 1 + "명";
    }

    $('#submit').click(function (){

        var data = {
            name : $('#name').val(),
            staffMax : $('#staffMax').val(),
            detail : $('#detail').val(),
            startDay : $('#startDay').val(),
            area : $('#area').val(),
            ageStart : $('#ageStart').val(),
            ageEnd : $('#ageEnd').val(),
            sex : $('#sex').val()
            //mtnm가 없음
        }

        console.log(data)

        $.ajax({
            type: "POST",
            url: "/group/insert.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success : function (data){
                console.log("success");
            },
            error : function (){
                console.log("error!")
            }
        })
    })
})