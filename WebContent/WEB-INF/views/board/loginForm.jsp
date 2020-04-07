<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>

<script type="text/javascript">

	$j(document).ready(function(){
		
		$j('#login').click(function(){
			if($j('#userId').val()==""){
				alert("ID를 입력해주세요");
				$j('#userId').focus();
				return false;
			}
			
			if($j('#userPw').val()==""){
				alert("비밀번호를 입력해주세요");
				$j('#userPw').focus();
				return false;
			}
			
			var param = 'userId='+$j('#userId').val()+'&userPw='+$j('#userPw').val();
			$j.ajax({
			    url : "${pageContext.request.contextPath}/user/login.do",
			    dataType: "text",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
			    	if(data=="fail"){
			    		alert("ID 또는 비밀번호가 틀립니다.");
			    		$j('#userId').val("");
			    		$j('#userPw').val("");
			    		$j('#userId').focus();
			    	}else{
			    		alert("로그인에 성공하셨습니다. 메인화면으로 이동합니다.");
			    		location.href="${pageContext.request.contextPath}/board/boardList.do"
			    	}
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
		});	
	});
</script>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
</head>
<a href="/board/boardList.do"> list</a>
<body>
<form id="loginForm" action="/user/login.do" method="post">
	<table border="1">
		<tr>
			<td width="80" align="center">
				id
			</td>
			<td width="100">
				<input type="text" id="userId" name="userId">
			</td>
		</tr>
		<tr>
			<td align="center">
				pw
			</td>
			<td>
				<input type="password" id="userPw" name="userPw">
			</td>
		</tr>
	</table>
</form>
	<a href="#" id="login">login</a>
</body>
</html>