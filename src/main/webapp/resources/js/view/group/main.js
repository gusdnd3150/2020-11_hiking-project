function create1(){
    location.href='form1.jsp';
}
function create2(){
    location.href='form2.jsp';
}
function goMain1(){
    location.href='/group/main1.do';
}
function goMain2(){
    location.href='/group/main2.do';
}

$(function() {

    $('.button-class1').click(function(){
        if( $(this).hasClass('btn-outline-secondary') ) $(this).removeClass('btn-outline-secondary');
        if( !$(this).hasClass('btn-outline-info') ) $(this).addClass('btn-outline-info');
        if( $('.button-class2').hasClass('btn-outline-info') ) $('.button-class2').removeClass('btn-outline-info');
        if( !$('.button-class2').hasClass('btn-outline-secondary') ) $('.button-class2').addClass('btn-outline-secondary');
    });

    $('.button-class2').click(function(){
        if( $(this).hasClass('btn-outline-secondary') ) $(this).removeClass('btn-outline-secondary');
        if( !$(this).hasClass('btn-outline-info') ) $(this).addClass('btn-outline-info');
        if( $('.button-class1').hasClass('btn-outline-info') ) $('.button-class1').removeClass('btn-outline-info');
        if( !$('.button-class1').hasClass('btn-outline-secondary') ) $('.button-class1').addClass('btn-outline-secondary');
    });

});