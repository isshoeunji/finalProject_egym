/**
 * 로그인 유효성체크
 */
$(function(){
	$("#username").blur(function(){
		$("#username").css("outline", "none");
	})
	$("#password").blur(function(){
		$("#password").css("outline", "none");
	});
	//board 로그인 버튼 눌렀을 때
	$("#loginBtn").click(function(){
		if($("#username").val()==""){
			$("#username").focus();
			$("#username").css("outline", "1px solid red");
			return false;
		}else{
			$("#username").css("outline", "none");
		}
		if($("#password").val()==""){
			$("#password").focus();
			$("#password").css("outline", "1px solid red");
			return false;
		}else{
			$("#password").css("outline", "none");
		}
		
		$("#loginForm").attr("action", "/login");
		$("#loginForm").submit();
	});
	
	//shop 로그인 버튼 눌렀을 때
	$("#loginBtn_shop").click(function(){
		if($("#username").val()==""){
			$("#username").focus();
			$("#username").css("outline", "1px solid red");
			return false;
		}else{
			$("#username").css("outline", "none");
		}
		if($("#password").val()==""){
			$("#password").focus();
			$("#password").css("outline", "1px solid red");
			return false;
		}else{
			$("#password").css("outline", "none");
		}

		$("#loginForm_shop").attr("action", "/shop/loginProcess");
		$("#loginForm_shop").submit();
	});
});