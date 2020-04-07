<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>

<script type="text/javascript">

	$j(document).ready(function(){
		
		var pattern_num = /[0-9]/;
    	var pattern_eng = /[a-zA-Z]/;	
    	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; 
    	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; 
    	var pattern_check = /-/;
    	
		var idConfirm = false;
		var pwConfirm = false;
		var nameConfirm = false;
		var phoneConfirm = false;
		
		
		$j('#userId').keyup(function(){
			if(idConfirm){
				idConfirm = false;
			}
			
			if(pattern_kor.test($j('#userId').val()) || pattern_spc.test($j('#userId').val())){
				alert("숫자나 영문만 입력가능합니다.");
				$j('#userId').val("");
				$j('#userId').focus();
				return false;
			}
			
			if($j('#userId').val().length > 15){
				alert("15자리 이하만 가능합니다.");
				$j('#userId').val("");
				$j('#userId').focus();
				return false;
			}
		});
		
		
		$j('#idCheck').click(function(){
			
			if ($j('#userId').val()==""){
				alert("ID를 입력해주세요");
				$j('#userId').focus();
				return false;
			}
			
			if(pattern_kor.test($j('#userId').val()) || pattern_spc.test($j('#userId').val())){
				alert("한글이나 특수문자는 사용할 수 없습니다.");
				$j('#userId').val("");
				$j('#userId').focus();
				return false;
			}
			
			var param = 'userId='+$j('#userId').val();
			$j.ajax({
			    url : "${pageContext.request.contextPath}/user/idCheck.do",
			    dataType: "text",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
			    	if(data=="possible"){
			    		alert("ID 사용이 가능합니다.");
			    		idConfirm = true;
			    	}else{
			    		alert("ID가 중복입니다.");
			    		$j('#userId').val("");
			    		$j('#userId').focus();
			    		return false;
			    	}
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
		});
		
			
		$j('#userPw2').keyup(function(){
			
			if(pattern_kor.test($j('#userPw2').val()) || pattern_spc.test($j('#userPw2').val())){
				alert("한글이나 특수문자는 사용할 수 없습니다.");
				$j('#userPw2').val("");
				$j('#userPw2').focus();
				return false;
			}
			
		  	if($j('#userPw').val()!=$j('#userPw2').val()){
		    	$j('#userPwCheck').text('');
		    	$j('#userPwCheck').text("암호가 일치하지 않습니다.").css("color","red");
		    	pwConfirm = false;
		  	}else{
		   		$j('#userPwCheck').text('');
		    	$j('#userPwCheck').text("암호가 일치합니다.").css("color","blue");
		    	pwConfirm = true;
			}
		});
		
		$j('#userPhone2').keyup(function(){
			if($j('#userPhone2').val().length==4){
				$j('#userPhone3').focus();
			}
			
			if(pattern_kor.test($j('#userPhone2').val()) || pattern_spc.test($j('#userPhone2').val()) || pattern_eng.test($j('#userPhone2').val())){
				alert("숫자만 입력가능합니다.");
				$j('#userPhone2').val("");
				$j('#userPhone2').focus();
				return false;
			}
			
			if($j('#userPhone2').val().length > 4){
				alert("4자리 이하만 가능합니다.");
				$j('#userPhone2').val("");
				$j('#userPhone2').focus();
				return false;
			}
		});
		
		$j('#userPhone3').keyup(function(){
			
			if(pattern_kor.test($j('#userPhone3').val()) || pattern_spc.test($j('#userPhone3').val()) || pattern_eng.test($j('#userPhone3').val())){
				alert("숫자만 입력가능합니다.");
				$j('#userPhone3').val("");
				$j('#userPhone3').focus();
				return false;
			}
			
			if($j('#userPhone3').val().length > 4){
				alert("4자리 이하만 가능합니다.");
				$j('#userPhone3').val("");
				$j('#userPhone3').focus();
				return false;
			}
		});
		
		$j('#userName').keyup(function(){
			
			if(pattern_num.test($j('#userName').val()) || pattern_spc.test($j('#userName').val()) || pattern_eng.test($j('#userName').val())){
				alert("한글만 입력가능합니다.");
				$j('#userName').val("");
				$j('#userName').focus();
				return false;
			}
			
			if($j('#userName').val().length > 5){
				alert("5자리 이하만 가능합니다.");
				$j('#userName').val("");
				$j('#userName').focus();
				return false;
			}
		});
		
		$j('#userAddr1').keypress(function(){
			
			if($j('#userAddr1').val().length == 3){
				var addSpc = $j('#userAddr1').val()+"-";
				$j('#userAddr1').val(addSpc);
			}
		});
		
		$j('#userAddr1').keyup(function(){
			
			if(pattern_kor.test($j('#userAddr1').val()) || pattern_eng.test($j('#userAddr1').val())){
				alert("숫자만 입력가능합니다.");
				$j('#userAddr1').val("");
				$j('#userAddr1').focus();
				return false;
			}
		});
		
		$j('#userAddr2').keyup(function(){
			
			if($j('#userAddr2').val().length > 50){
				alert("50자 이하만 입력가능합니다.");
				$j('#userAddr2').val("");
				$j('#userAddr2').focus();
				return false;
			}
		});	
		
		$j('#userCompany').keyup(function(){
			
			if($j('#userCompany').val().length > 20){
				alert("20자 이하만 입력가능합니다.");
				$j('#userCompany').val("");
				$j('#userCompany').focus();
				return false;
			}
		});	
		
		$j('#join').click(function(){
			
			if ($j('#userId').val()==""){
				alert("ID를 입력해주세요");
				$j('#userId').focus();
				return false;
			}
			
			if(idConfirm == false){
				alert('id 중복확인을 해주세요');
				return false;
			}
			
			if ($j('#userPw').val()==""){
				alert("비밀번호를 입력해주세요");
				$j('#userPw').focus();
				return false;
			}
			
			if($j('#userPw').val().length < 6 || $j('#userPw').val().length > 12){
				alert('비밀번호는 6자 이상 12자 이하만 가능합니다.');
				$j('#userPw').val("");
				$j('#userPw').focus();
				return false;
			}
			if(pwConfirm == false){
				alert('비밀번호 체크를 해주세요');
				$j('#userPw2').focus();
				return false;
			}
			
			if($j('#userName').val()==""){
				alert("이름을 입력해주세요");
				$j('#userName').focus();
				return false;
			}else{
				nameConfirm = true;
			}
			
			if($j('#userPhone2').val().length!=4){
				alert('휴대전화 번호를 제대로 입력하세요.');
				$j('#userPhone2').focus();
				return false;
			}
			
			if($j('#userPhone3').val().length!=4){
				alert('휴대전화 번호를 제대로 입력하세요.');
				$j('#userPhone3').focus();
				return false;
			}
			
			if($j('#userPhone2').val().length==4 && $j('#userPhone3').val().length==4){
				phoneConfirm = true;
			}
			
			if($j('#userAddr1').val()!=""){
				var frontPostNo = $j('#userAddr1').val().substring(0,3);
				var backPostNo = $j('#userAddr1').val().substring(4,7);
				if(pattern_check.test($j('#userAddr1').val())==false || $j('#userAddr1').val().length > 7 || pattern_check.test(frontPostNo) || pattern_check.test(backPostNo)){
					alert('우편번호는 123-123 형식으로 작성해주세요');
					$j('#userAddr1').focus();
					return false;
				}
			}		
			
			
			if(idConfirm && pwConfirm && nameConfirm && phoneConfirm){
				$j('#joinForm').submit();
				alert('등록성공');
			}else{
				alert('등록실패');
				return false;
			}
			
		});
			
	});
</script>
<head>
<meta charset="UTF-8">
<title>joinForm</title>
</head>
<a href="/board/boardList.do"> list</a>
<body>
<form id="joinForm" action="/user/join.do" method="post">
	<table border="1">
		<tr>
			<td width="80" align="center">
				id
			</td>
			<td width="600">
				<input type="text" id="userId" name="userId" maxlength="15"> <input type="button" value="중복확인" id="idCheck">
			</td>
		</tr>
		<tr>
			<td align="center">
				pw
			</td>
			<td>
				<input type="password" id="userPw" name="userPw" placeholder="6~12자리로 입력해주세요" maxlength="12">
			</td>
		</tr>
		<tr>
			<td align="center">
				pw check
			</td>
			<td>
				<input type="password" id="userPw2" name="userPw2" maxlength="12"><span id=userPwCheck></span>
			</td>
		</tr>
		<tr>
			<td align="center">
				name
			</td>
			<td>
				<input type="text" id="userName" name="userName" maxlength="5">
			</td>
		</tr>
		<tr>
			<td align="center">
				phone
			</td>
			<td>
				<input type="text" style="width: 40px" id="userPhone1" name="userPhone1" value="010" readonly="readonly"> -
				<input type="text" style="width: 40px" id="userPhone2" name="userPhone2" maxlength="4"> -
				<input type="text" style="width: 40px" id="userPhone3" name="userPhone3" maxlength="4">
			</td>
		</tr>
		<tr>
			<td align="center">
				postNo
			</td>
			<td>
				<input type="text" id="userAddr1" name="userAddr1" placeholder="ex)123-123" maxlength="7">
			</td>
		</tr>
		<tr>
			<td align="center">
				address
			</td>
			<td>
				<input type="text" id="userAddr2" name="userAddr2" maxlength="50">
			</td>
		</tr>
		<tr>
			<td align="center">
				company
			</td>
			<td>
				<input type="text" id="userCompany" name="userCompany" maxlength="20">
			</td>
		</tr>
	</table>
</form>
	<a href="#" id="join">join</a>
</body>
</html>