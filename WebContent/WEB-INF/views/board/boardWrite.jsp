<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardWrite</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		if('${board}'!=""){
			$j('#boardType').attr('disabled','disabled');
			$j('#boardType').val('${board.boardType}');
			$j('#creator').val('${board.creator}');
			$j('#changeName').text('${board.creator}');
			
		}
		
		$j("#submit").on("click",function(){
			var $frm = $j('.boardWrite :input');
			var param = $frm.serialize();
			
			if('${board}'==""){
				var changeURL = "${pageContext.request.contextPath}/board/boardWriteAction.do";
			}else{
				
				changeURL = "${pageContext.request.contextPath}/board/boardUpdateAction.do";
				param = $frm.serialize()+'&boardType=${boardType}&boardNum=${boardNum}';
			}
			
			console.log(param);
			console.log(changeURL);
			$j.ajax({
			    url : changeURL,
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("�ۼ��Ϸ�");
					
					alert("�޼���:"+data.success);
					
					location.href = "/board/boardList.do";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
			    }
			});
		});
		
		/* $j('#addForm').click(function(){
			var $jform = $j('#cloneTable').clone();
			$jform.appendTo('.boardWrite'); 

		}); */
	});
	

</script>
<body>
<form class="boardWrite">
	<table align="center">
		<tr>
			<td align="right">
			<input id="addForm" type="button" value="�߰�">
			<input id="submit" type="button" value="�ۼ�">
			</td>
		</tr>
		<tr>
			<td>
				<table border ="1" id="cloneTable" align="center"> 
					<tr>
						<td width="120" align="center">
						Type
						</td>
						<td width="400">
							<select name="boardType" id="boardType">
							<c:forEach items="${codeList}" var="codeList" varStatus="status">
								<option value="${codeList.codeId}">${codeList.codeName}</option>
							</c:forEach>
							  
							</select>
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						<input name="boardTitle" type="text" size="50" value="${board.boardTitle}"> 
						</td>
					</tr>
					<tr>
						<td height="300" align="center">
						Comment
						</td>
						<td valign="top">
						<textarea name="boardComment"  rows="20" cols="55">${board.boardComment}</textarea>
						</td>
					</tr>
					<tr>
						<td align="center">
						Writer
						</td>
						<td>
						<input type="hidden" readonly="readonly" id="creator" name="creator" value="${user.userId}"><span id="changeName">${user.userId}</span>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right">
				<a href="/board/boardList.do">List</a>
			</td>
		</tr>
	</table>
</form>	
</body>
</html>