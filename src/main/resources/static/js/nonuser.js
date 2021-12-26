/**
 * 비회원 주문내역 유효성검사
 */
$(function(){
	var nameCheck = false;
	var phoneCheck = false;
	var orderNoCheck = false;
	
	$("#receiverName").blur(function(){
		var memberName = $("#receiverName").val();
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
	
	$("#receiverPhone").blur(function(){
		let phoneNumber = $("#receiverPhone").val();
		var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
		
		if(regExp.test(phoneNumber)){
			
			phoneCheck = true;
			console.log(phoneCheck);
		}
	});
	
	$("#nonuserOrderNo").blur(function(){
		let orderNo = $("#nonuserOrderNo").val();
		var regExp = /^[0-9]+$/;
		
		if(regExp.test(orderNo)){
			orderNoCheck = true;
		}
	});
	
	$("#selectBtn").click(function(){
		//이름 공백 확인
		if($("#receiverName").val() == ""){
			nameCheck = false;
		}
		if($("#receiverPhone").val() == ""){
			phoneCheck = false;
		}
		if($("#nonuserOrderNo").val() == ""){
			orderNoCheck = false;
		}
		
		if(!nameCheck){
			$("#receiverName").focus();
			$("#receiverName").css("outline", "1px solid red");
		}else if(!phoneCheck){
			$("#receiverPhone").focus();
			$("#receiverPhone").css("outline", "1px solid red");
		}else if(!orderNoCheck){
			$("#nonuserOrderNo").focus();
			$("#nonuserOrderNo").css("outline", "1px solid red");
		}else{
			$("#selectForm").attr("action", "/shop/orderList");
			$("#selectForm").submit();
		}
		
	});
});