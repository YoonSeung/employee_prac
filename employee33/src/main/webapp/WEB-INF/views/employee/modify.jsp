<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp" %>

       
	<div id="wrap" align="center">
		<h1>사원정보수정</h1>
		<form name='modify' id="modify" role="form" method="post" action="/employee/modify" onsubmit="return employeeCheck();">
			<table style="width: 600px">
				<tr>
					<th>아이디</th>
					<td><input class="form-control" name='id' value='<c:out value="${employee.id }"/>' readonly="readonly"> </td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input class="form-control" name='pass' value='<c:out value="${employee.pass }"/>'> </td>
				</tr>	
				<tr>
					<th>이름</th>
					<td><input class="form-control" name='name' value='<c:out value="${employee.name }"/>' > </td>
				</tr>
				<tr>
					<th>권한</th>
					<td>
						<select name = "lev">
							<option value="A">운영자</option>
							<option value="B">일반사원</option>
						</select>
					 </td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<select name = "gender">
							<option value="1">남자</option>
							<option value="2">여자</option>
						</select>
					</td>
					</tr>	
				<tr>
					<th>전화번호</th>
					<td><input class="form-control" name='phone' value='<c:out value="${employee.phone }"/>' > </td>
				</tr>
				<tr>
					<th>입사일</th>
					<td><input class="form-control" name='enter' value='<fmt:formatDate pattern="yyyy/MM/dd" value="${employee.enter }"/>' readonly="readonly"> </td>
				</tr>																		
			</table>
			<br>
			<button id="subBtn" type="submit" data-oper='modify' class="btn btn-primary" >확인</button>
			<button type="submit" data-oper='list' class="btn btn-info">사원리스트</button>
			<button id="regBtn" type="button" class="btn btn-default">사원등록</button>

		</form>
	</div>
	
<script>
$(document).ready(function(){
	var formObj = $("modify");
	
	$('button').on("click", function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		 if(operation ==='list'){
			self.location="/employee/list";
			return;
		}
		formObj.submit();
	});
});

//사원등록화면 됨
$(function(){
	$("#regBtn").click(function() {                
		location.href="/employee/register";          
	});
});

$("#subBtn").click(function() {               
	$(function employeeCheck(){
		var pass = '<c:out value="${employee.pass}"/>';
		var name = '<c:out value="${employee.name}"/>';

		if(document.modify.pass.value.length==0){
			alert("비밀번호를 입력하시오.");
			modify.pass.focus();
			return false;
		}
		if(document.modify.pass.value.length>10){
			alert("비밀번호는 10자 이하로 입력하십시오.");
			modify.pass.focus();
			return false;
		}		
		if(document.modify.name.value.length==0){
			alert("사원이름을 입력하십시오.");
			modify.pass.focus();
			return false;
		}
		modify.submit();
		return true;
	});     
});


</script>
	
<%@include file="../includes/footer.jsp" %>