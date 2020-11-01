function validation(){

    if($('#mtNm').val()=='' || $('#mtNm').val()==null){
        $('#mtNm').focus()
        alert('산이름을 입력해주세요');return
    }else if($('#name').val()=='' || $('#name').val()==null){
        $('#name').focus()
        alert('제목을 입력해주세요');return
    }else if(window.editor.getData()=='' || window.editor.getData()==null){
        $('.ck-content').focus()
        alert('본문내용을 작성해주세요');return
    }else if($('#startDay').val()=='' || $('#startDay').val()==null){
        $('#startDay').focus();
        alert('시작 날짜를 설정해주세요');return
    }else if($('#area').val()=='' || $('#area').val()==null){
        $('#area').focus()
        alert('지역을 설정해주세요');return
    }else if($('#uploadFile').val()=='' || $('#uploadFile').val()==null){
        $('#uploadFile').focus()
        alert('첨부사진은 최소 1장 이상 입니다');return
    }
    return 1;
}