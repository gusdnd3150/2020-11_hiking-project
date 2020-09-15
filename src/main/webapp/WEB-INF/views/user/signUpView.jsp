<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
    <%
   request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>회원가입</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
     <div class="container">
    <div class="row">
    <div class="col-sm-12 text-center" >
    <div class="col-sm-3"></div>
     
    <div class="col-sm-6">
    <h2>회원가입</h2>
    <form action="/user/insertUser" method="post">
        <table class="table table-boardered">
            <tr>
                <th>아이디</th>
                <td><input type="text" class="form-control" id="userId" name="userId" placeholder="소문자와 숫자 4~12자리" required><br>
                <div class ="check_font" id="userIdCheck"></div></td>  
           </tr>
        
            <tr>
                <th>비밀번호</th>
                <td><input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="대소문자와 숫자 4~12자리" required><br>
                <div class ="check_font" id="userPwdCheck"></div></td>      
                
            </tr>
                 <tr>
                <th>비밀번호 확인</th>
                <td><input type="password" class="form-control" id="userPwd2" name="userPwd2" placeholder="비밀번호 확인" required><br>
                 <div class ="check_font" id="userPwd2Check"></div></td>      
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" class="form-control" id="userName" name="userName" required><br>  
                 <div class ="check_font" id="userNameCheck"></div></td>    
            </tr>

            <tr>
                <th>이메일</th>
                <td><input type="eamil" class="form-control"id="userEmail" name="userEmail" required><br>
                 <div class ="check_font" id="userEmailCheck"></div></td>       
            </tr>
            <tr>
                <th>주소</th>
                <td><input type="text" class="form-control" id="userAddress" name="userAddress" required></td>       
            </tr>
             
            <tr>
                <th>전화번호</th>
                <td><input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="'-'없이 입력해 주세요." required><br>
                   <div class ="check_font" id="userPhoneCheck"></div></td>       
            </tr>
         
            <tr>
                <th>성별</th>
                <td>
                <input type="radio"  name="userSex" value="10">남성 &nbsp;&nbsp;
                <input type="radio"  name="userSex" value="20">여성 &nbsp;&nbsp;
                </td>     
            </tr>
            <tr>
                <td colspan="2">
                <input type="submit" class="btn btn-primary" value="가입" id="insertUser" >
                </td>
            </tr>
        </table>
    </form>
    </div>
     
    </div>
    </div>
</div>
</body>
<script>
//모든 공백 체크 정규식
var empJ = /\s/g;
//아이디 정규식
var idJ = /^[a-z0-9]{4,12}$/;
// 이름 정규식
var nameJ = /^[가-힣]{2,6}$/;
// 비밀번호 정규식
var pwdJ = /^[A-Za-z0-9]{4,12}$/; 
//이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
//휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	
	$(document).ready(function(){ 
		//아이디 유효성 검사
		$("#userId").blur(function() {
		console.log("이벤트 먹었니");					
		var userId = $("#userId").val();
		$.ajax({
			url : "/user/userIdCheck?userId="+userId ,
			type : "get",
			success : function(data, textStatus) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);		
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#userIdCheck").text("사용중인 아이디입니다 :p");
						$("#userIdCheck").css("color", "red");
						$("#insertUser").attr("disabled", true);
					} else {
						if(idJ.test(userId)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#userIdCheck").text("");
							$("#insertUser").attr("disabled", false);
						} else if(userId == ""){
							$('#userIdCheck').text('아이디를 입력해주세요 :)');
							$('#userIdCheck').css('color', 'red');
							$("#insertUser").attr("disabled", true);		
						} else {
							$('#userIdCheck').text("아이디는 소문자와 숫자 4~12자리만 가능합니다:)");
							$('#userIdCheck').css('color', 'red');
							$("#insertUser").attr("disabled", true);
						}
					}
				}, error : function(data, textStatus) {
					console.log(data.readyState);
					console.log(data.status);
					console.log(data.responseText); 
						console.log("실패");
				},
				complete : function(data, textStatus) {
				}
			});
		});
		// 이름에 특수문자 들어가지 않도록 설정
		$("#userName").blur(function() {
			console.log("이벤트 먹었니");	
			if (nameJ.test($(this).val())) {
					console.log(nameJ.test($(this).val()));
					$("#userNameCheck").text('');
			} else {
				$('#userNameCheck').text('이름을 확인해주세요 :)');
				$('#userNameCheck').css('color', 'red');
			}
		});
		//비밀번호
		$('#userPwd').blur(function(){
			console.log("이벤트 먹었니");	
			if(pwdJ.test($(this).val())){
				console.log(pwdJ.test($(this).val()));
				$("#userPwdCheck").text('');
			} else{
				$('#userPwdCheck').text('비밀번호를 확인해주세요 :)');
				$('#userPwdCheck').css('color', 'red');
			}
		});
		//비밀번호 확인
		$('#userPwd2').blur(function(){
			console.log("이벤트 먹었니");
			var userPwd = $("userPwd").val()
			if($(this).val() == userPwd){
				console.log("비밀번호 같을 때 ");
				console.log($(this).val())
				$("#userPwd2Check").text('');
			} else{
				console.log(userPwd)
				console.log($(this).val())
				console.log("비밀번호 다를 때 ");	
				$('#userPwd2Check').text('비밀번호가 일치하지 않습니다 :p');
				$('#userPwd2Check').css('color', 'red');
			}
		});
		// 이메일
		$('#userEmail').blur(function(){
			console.log("이벤트 먹었니");	
			if(mailJ.test($(this).val())){
				console.log(mailJ.test($(this).val()));
				$("#userEmailCheck").text('');
			} else {
				$('#userEmailCheck').text('이메일을 확인해주세요 :)');
				$('#userEmailCheck').css('color', 'red');
			}
		});
	// 휴대전화
	$('#userPhone').blur(function(){
		if(phoneJ.test($(this).val())){
			console.log(phoneJ.test($(this).val()));
			$("#userPhoneCheck").text('');
		} else {
			$('#userPhoneCheck').text('휴대폰번호를 확인해주세요 :)');
			$('#userPhoneCheck').css('color', 'red');
		}
	});
});
	</script>
</html>