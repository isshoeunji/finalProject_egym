/**
 * focus, blur일 때 적용
 */
$(function(){
	$("#memberId").focus(function(){
		$("#memberId").css("outline", "1px solid green");
		$("#idCheck").show();
	});
	$("#memberId").blur(function(){
		$("#memberId").css("outline", "none");
	});
	$("#memberNickname").focus(function(){
		$("#memberNickname").css("outline", "1px solid green");
		$("#nicknameCheck").show();
	});
	$("#memberNickname").blur(function(){
		$("#memberNickname").css("outline", "none");
	});
	$("#memberPwd").focus(function(){
		$("#memberPwd").css("outline", "1px solid green");
		$("#pwdCheck").show();
	});
	$("#memberPwd").blur(function(){
		$("#memberPwd").css("outline", "none");
	});
	$("#memberPwdConfirm").focus(function(){
		$("#memberPwdConfirm").css("outline", "1px solid green");
	});
	$("#memberPwdConfirm").blur(function(){
		$("#memberPwdConfirm").css("outline", "none");
	});
	$("#memberName").focus(function(){
		$("#memberName").css("outline", "1px solid green");
	});
	$("#memberName").blur(function(){
		$("#memberName").css("outline", "none");
	});
	$("#memberEmail").focus(function(){
		$("#memberEmail").css("outline", "1px solid green");
	});
	$("#memberEmail").blur(function(){
		$("#memberEmail").css("outline", "none");
	});
	$("#memberPhone").focus(function(){
		$("#memberPhone").css("outline", "1px solid green");
	});
	$("#memberPhone").blur(function(){
		$("#memberPhone").css("outline", "none");
	});
	$("#inputCertificationNumber").focus(function(){
		$("#inputCertificationNumber").css("outline", "1px solid green");
	});
	$("#inputCertificationNumber").blur(function(){
		$("#inputCertificationNumber").css("outline", "none");
	});
	$("#receiverName").focus(function(){
		$("#receiverName").css("outline", "1px solid green");
	});
	$("#receiverName").blur(function(){
		$("#receiverName").css("outline", "none");
	});
	$("#receiverPhone").focus(function(){
		$("#receiverPhone").css("outline", "1px solid green");
	});
	$("#receiverPhone").blur(function(){
		$("#receiverPhone").css("outline", "none");
	});
	$("#nonuserOrderNo").focus(function(){
		$("#orderNoCheck").show();
		$("#nonuserOrderNo").css("outline", "1px solid green");
	});
	$("#nonuserOrderNo").blur(function(){
		$("#nonuserOrderNo").css("outline", "none");
	});
});

/**
 * 회원가입 유효성검사
 */
$(function(){
	var idCheck = false;
	var nicknameCheck = false;
	var pwdCheck = false;
	var pwdConfirmCheck = false;
	var nameCheck = false;
	var emailCheck = false;
	var phoneCheck = false;
	var phoneCertificationCheck = false;
	var tosCheck = false;
	
	$("#memberId").on("propertychange change keyup paste input", function(){

		//console.log("keyup 테스트");	
		var memberId = $("#memberId").val();
		var regExp = /^[a-zA-Z0-9]{5,20}$/;

		if(memberId == ""){
			$("#idCheck").css("color", "black");
		}else{
			$.ajax({
				type : "post",
				url : "/member/memberIdChk",
				data : {
					"memberId" : memberId
				},
				success : function(result){
					//console.log(result);
					if(regExp.test(memberId)){
						$("#idCheck").css("color", "green");
						if(result != "fail"){
							$("#idDuplicateCheckOk").css("display", "inline-block");
							$("#idDuplicateCheckFail").css("display", "none");
							idCheck = true;
						}else{
							$("#idDuplicateCheckOk").css("display", "none");
							$("#idDuplicateCheckFail").css("display", "inline-block");
						}
					}else{
						$("#idCheck").css("color", "red");
						$("#idDuplicateCheckOk").css("display", "none");
						$("#idDuplicateCheckFail").css("display", "none");
						idCheck = false;
					}
					
				}
			});
		}
	});
	
	$("#memberNickname").on("propertychange change keyup paste input", function(){

		//console.log("keyup 테스트");	
		var memberNickname = $("#memberNickname").val();
		var regExp = /^[가-힣ㄱ-ㅎㅏ-ㅣ]{2,8}|[a-zA-Z0-9]{4,16}$/;

		if(memberNickname == ""){
			$("#nicknameCheck").css("color", "black");
		}else{
			$.ajax({
				type : "post",
				url : "/member/memberNicknameChk",
				data : {
					"memberNickname" : memberNickname
				},
				success : function(result){
					//console.log(result);
					if(regExp.test(memberNickname)){
						$("#nicknameCheck").css("color", "green");
						if(result != "fail"){
							$("#nicknameDuplicateCheckOk").css("display", "inline-block");
							$("#nicknameDuplicateCheckFail").css("display", "none");
							nicknameCheck = true;
						}else{
							$("#nicknameDuplicateCheckOk").css("display", "none");
							$("#nicknameDuplicateCheckFail").css("display", "inline-block");
						}
					}else{
						$("#nicknameCheck").css("color", "red");
						$("#nicknameDuplicateCheckOk").css("display", "none");
						$("#nicknameDuplicateCheckFail").css("display", "none");
						nicknameCheck = false;
					}
					
				}
			});
		}
	});
	
	$("#memberPwd").on("propertychange change keyup paste input", function(){

		//console.log("keyup 테스트");	
		var memberPwd = $("#memberPwd").val();
		var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;

		if(memberPwd == ""){
			$("#pwdCheck").css("color", "black");
		}else{
			if(regExp.test(memberPwd)){
				$("#pwdCheck").css("color", "green");
				pwdCheck = true;
			}else{
				$("#pwdCheck").css("color", "red");
				pwdCheck = false;
			}
		}
	});
	
	$("#memberPwdConfirm").on("propertychange change keyup paste input", function(){
		var memberPwd = $("#memberPwd").val();
		var memberPwdConfirm = $("#memberPwdConfirm").val();

		if(memberPwdConfirm == ""){
			$("#pwdConfirmCheckOk").css("display", "none");
			$("#pwdConfirmCheckFail").css("display", "none");
		}else{
			if(memberPwd == null || memberPwdConfirm != memberPwd){
				$("#pwdConfirmCheckOk").css("display", "none");
				$("#pwdConfirmCheckFail").css("display", "inline-block").css("color", "red");
				pwdConfirmCheck = false;
			}else{
				$("#pwdConfirmCheckFail").css("display", "none");
				$("#pwdConfirmCheckOk").css("display", "inline-block").css("color", "green");
				pwdConfirmCheck = true;
			}
		}
		
		
			
	});
	
	$("#memberName").blur(function(){
		var memberName = $("#memberName").val();
		var regExp = /^()[가-힣a-zA-Z\s]{2,16}$/;
		
		if(memberName == ""){
			$("#nameCheckFail").hide();
		}else{
			if(!regExp.test(memberName)){
				$("#nameCheckFail").show();
				nameCheck = false;
			}else{
				$("#nameCheckFail").hide();
				nameCheck = true;
			}
		}
	});
	$("#memberEmail").blur(function(){
		var memberEmail = $("#memberEmail").val();
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

		if(memberEmail == ""){
			$("#emailCheckFail").hide();
		}else{
			if(!regExp.test(memberEmail)){
				$("#emailCheckFail").show();
				emailCheck = false;
			}else{
				$("#emailCheckFail").hide();
				emailCheck = true;
			}
		}
	});
	
	$("#sendPhoneNumber").click(function(){
		//alert(11)
		let phoneNumber = $("#memberPhone").val();
		var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
		//alert(phoneNumber);
		if (phoneNumber == "") {
			alert("휴대폰 번호를 입력해주세요.");
		}else if(!regExp.test(phoneNumber)){
			alert("올바른 휴대폰 번호를 입력해주세요.");
		}else{
			alert("인증번호가 발송되었습니다.");
			$("#inputCertificationNumber").show();
			$("#confirmCertificationBtn").show();
			$("#phoneCheck").show();
			$("#inputCertificationNumber").focus();
			phoneCheck = true;
			
			$.ajax({
				  url: "/check/sendSMS",  //서버요청주소
				  type: "get", //요청방식(get, post, put,delete, patch)
				  dataType:"text", //서버가 응답해주는 데이터 타입(text, html, xml, json)
				  data: {
				    "phoneNumber" : phoneNumber
				  },
				  
				  success: function(result){
					  //alert(result);
					  //$("#display").html("<h3>"+result +"</h3>");
					  
					  $('#confirmCertificationBtn').click(function(){
	                      if($.trim(result) == $("#inputCertificationNumber").val()){
	                          alert("인증이 완료되었습니다.");
	                          $("#inputCertificationNumber").attr("disabled",true).attr("readonly",false);
	                          $("#confirmCertificationBtn").attr("disabled",true).attr("readonly",false);
	                          phoneCertificationCheck = true;
	                      }else{
	                          alert("인증번호가 올바르지 않습니다.");
	                      }
	                  })
				  },
				  error : function(err){
					  alert(err+"오류 발생했습니다.");
				  }
			  });
		}
	})
	
	//board 회원가입 버튼을 눌렀을 때
	$("#joinBtn").click(function(){
		//아이디 공백 확인 
		if($("#memberId").val() == ""){ 
		  idCheck = false;
		}
		//닉네임 공백 확인
		if($("#memberNickname").val() == ""){
			nicknameCheck = false;
		}
		//비밀번호 공백 확인
		if($("#memberPwd").val() == ""){
			pwdCheck = false;
		}
		//비밀번호 확인 공백 확인
		if($("#memberPwdConfirm").val() == ""){
			pwdConfirmCheck = false;
		}
		//이름 공백 확인
		if($("#memberName").val() == ""){
			nameCheck = false;
		}
		//이메일 공백 확인
		if($("#memberEmail").val() == ""){
			emailCheck = false;
		}
		//휴대전화 공백 확인
		if($("#memberPhone").val() == ""){
			phoneCheck = false;
		}
		//휴대전화 인증 공백 확인
		if($("#inputCertificationNumber").val() == ""){
			phoneCertificationCheck = false;
		}
		
		//약관 동의 여부
		if($("#tosCheck").is(":checked")){
			tosCheck = true;
		}
		
		//Check 변수가 false일때
		if(!idCheck){
			$("#memberId").focus();
			$("#memberId").css("outline", "1px solid red");
		}else if(!nicknameCheck){
			$("#memberNickname").focus();
			$("#memberNickname").css("outline", "1px solid red");
		}else if(!pwdCheck){
			$("#memberPwd").focus();
			$("#memberPwd").css("outline", "1px solid red");
		}else if(!pwdConfirmCheck){
			$("#memberPwdConfirm").focus();
			$("#memberPwdConfirm").css("outline", "1px solid red");
		}else if(!nameCheck){
			$("#memberName").focus();
			$("#memberName").css("outline", "1px solid red");
		}else if(!emailCheck){
			$("#memberEmail").focus();
			$("#memberEmail").css("outline", "1px solid red");
		}else if(!phoneCheck || !phoneCertificationCheck){
			alert("휴대전화 인증을 완료해주세요.");
		}else if(!tosCheck){
			alert("약관에 동의해주세요.");
		}else{ //true일 때 전송
			$("#joinForm").attr("action", "/signup");
			$("#joinForm").submit();
		}
		
		return false;
	});
	
	//shop 회원가입 버튼을 눌렀을 때
	$("#joinBtn_shop").click(function(){
		//아이디 공백 확인 
		if($("#memberId").val() == ""){ 
		  idCheck = false;
		}
		//닉네임 공백 확인
		if($("#memberNickname").val() == ""){
			nicknameCheck = false;
		}
		//비밀번호 공백 확인
		if($("#memberPwd").val() == ""){
			pwdCheck = false;
		}
		//비밀번호 확인 공백 확인
		if($("#memberPwdConfirm").val() == ""){
			pwdConfirmCheck = false;
		}
		//이름 공백 확인
		if($("#memberName").val() == ""){
			nameCheck = false;
		}
		//이메일 공백 확인
		if($("#memberEmail").val() == ""){
			emailCheck = false;
		}
		//휴대전화 공백 확인
		if($("#memberPhone").val() == ""){
			phoneCheck = false;
		}
		//휴대전화 인증 공백 확인
		if($("#inputCertificationNumber").val() == ""){
			phoneCertificationCheck = false;
		}
		
		//약관 동의 여부
		if($("#tosCheck").is(":checked")){
			tosCheck = true;
		}
		
		//Check 변수가 false일때
		if(!idCheck){
			$("#memberId").focus();
			$("#memberId").css("outline", "1px solid red");
		}else if(!nicknameCheck){
			$("#memberNickname").focus();
			$("#memberNickname").css("outline", "1px solid red");
		}else if(!pwdCheck){
			$("#memberPwd").focus();
			$("#memberPwd").css("outline", "1px solid red");
		}else if(!pwdConfirmCheck){
			$("#memberPwdConfirm").focus();
			$("#memberPwdConfirm").css("outline", "1px solid red");
		}else if(!nameCheck){
			$("#memberName").focus();
			$("#memberName").css("outline", "1px solid red");
		}else if(!emailCheck){
			$("#memberEmail").focus();
			$("#memberEmail").css("outline", "1px solid red");
		}else if(!phoneCheck || !phoneCertificationCheck){
			alert("휴대전화 인증을 완료해주세요.");
		}else if(!tosCheck){
			alert("약관에 동의해주세요.");
		}else{ //true일 때 전송
			$("#joinForm_shop").attr("action", "/shop/signup");
			$("#joinForm_shop").submit();
		}
		
		return false;
	});
});