<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		$j('#logoutBtn').hide();
		
		if('${user.userId}'!=''){
			$j('#loginBtn').hide();
			$j('#joinBtn').hide();
			$j('#logoutBtn').show();
		}
		
		$j('#logoutBtn').click(function(){
			var cf = confirm("정말 로그아웃 하시겠습니까?");
			if(cf==false){
				return false;
			}
		});
		
		$j('#all').click(function(){
			if($j('#all').prop('checked')){
				$j('input:checkbox').prop('checked',true);
			}else{
				$j('input:checkbox').prop('checked',false);
			}
		});
		
		
		$j('input[name=boardType]').click(function(){
			var chkbox = document.getElementsByName('boardType'); 
			var chk = true; 
			for(var i=0 ; i<chkbox.length ; i++) { 
				if(!chkbox[i].checked) {
					chk = false; 
				}
			} 
			
			if(chk) { 
				$j('#all').prop('checked',true);
			} else { 
				$j('#all').prop('checked',false);
			}
		});
		
		
		
		$j('#sorting').click(function(){
			if($j('input:checkbox:checked').length<1){
				alert("적어도 한개의 체크박스 선택 후 이용이 가능합니다.");
				return false;
			}

			var $frm = $j('.boardTypeSend :input');
			var param = $frm.serialize()+"&pageNo=${pageNo}";
			
			console.log(param);
			
			$j.ajax({
			    url : "${pageContext.request.contextPath}/board/boardSortingAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
			    	
			    	$j('#boardTable *').remove();
					var result = '';
					var cnt = 0;
					result += '<tr>	<td width="80" align="center">Type</td><td width="40" align="center">No	</td><td width="300" align="center">Title</td></tr>'
					$j.each(data.success, function(index, item){
						result += '<tr><td align="center">'+item.codeVo.codeName+'</td>';
						result += '<td>'+item.boardNum+'</td>';
						result += '<td><a href = "/board/'+item.boardType+'/'+item.boardNum+'/boardView.do?pageNo=${pageNo}">'+item.boardTitle+'</a></td></tr>';
						cnt++;
					});
					
					$j('#boardTable').append(result);
					$j('#totalCnt').html("total : "+ data.success[0].totalCnt);
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
			
		});
	});

</script>
<body>

<table  align="center">
	<tr>
	
		<td>
			<a href="/user/loginForm.do" id="loginBtn">login</a>
			<a href="/user/joinForm.do" id="joinBtn">join</a>
			${user.userName}
		</td>
		
		<td align="right" id="totalCnt">
			total : ${totalCnt}
		</td>
	</tr>
	<tr>
		<td>
			<table id="boardTable" border = "1">
				<tr>
					<td width="80" align="center">
						Type
					</td>
					<td width="40" align="center">
						No
					</td>
					<td width="300" align="center">
						Title
					</td>
				</tr>
				<c:forEach items="${boardList}" var="list" >
					<tr>
						<td align="center">
							${list.codeVo.codeName}
						</td>
						<td>
							${list.boardNum}
						</td>
						<td>
							<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href ="/board/boardWrite.do">글쓰기</a>
			<a href ="/user/logout.do" id="logoutBtn">로그아웃</a>
		</td>
	</tr>
</table>
<form id="boardTypeSend" class="boardTypeSend">
	<div align="center">
		<input type="checkbox" value="all" name="all" id="all">전체
	<c:forEach items="${codeList}" var="list" varStatus="status">
		<input type="checkbox" value="${list.codeId}" name="boardType" id="${list.codeId}">${list.codeName}
	</c:forEach>
		<input type="button" value="조회" id="sorting">
	</div>
</form>
</body>
</html>