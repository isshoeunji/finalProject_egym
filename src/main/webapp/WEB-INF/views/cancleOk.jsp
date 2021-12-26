<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

 <script type="text/javascript">
  $(function(){
	  alert("취소 신청이 완료되었습니다.");
	  location.href = "${pageContext.request.contextPath}/shop/user/orderList"
  })
 </script>

<body>
 
</body>
</html>