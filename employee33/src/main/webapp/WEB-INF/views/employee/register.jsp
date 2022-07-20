<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp" %>

       
	<div id="wrap" align="center">
		<h1>사원정보등록</h1>
		<form name='register' id="register" method="post" action="/employee/register" onsubmit="return employeeCheck();">
			<table style="width: 600px">
				<tr>
					<th>아이디</th>					
					<td><input type="text" size="60" name="id" id="id" ></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" size="60" name="pass"></td>
				</tr>	
				<tr>
					<th>이름</th>
					<td>
						<input type="text" size="60" name="name">
					</td>
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
					<td>
						<input type ="text" name="phone">
					</td>
				</tr>																		
			</table>
			<br>
			<!-- <button type="submit" class="btn btn-primary" data-oper="register">확인</button>
			<button type="reset" class="btn btn-danger">초기화</button>
			<button type="submit" class="btn btn-default" data-oper="list">리스트로 이동</button> -->
			<div>
			<button id="subBtn" type="button" class="btn btn-primary">확인</button>
			<button type="reset" class="btn btn-danger">초기화</button>
			<button id="listBtn" type="button" class="btn btn-default">리스트로 이동</button>
			</div>
		</form>		
	</div>
	
<script>

$(document).ready(function(){
/*	var formObj = $("#frm"); 선생님이 해주신것 
	
	$("button[data-oper='register']").on("click", function(e){
		
		if(!formObj.find("input[name='id']").val()){
			alert("아이디를 입력하세요.");
			return false;
		}
	
		if(!formObj.find("input[name='pass']").val()){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		if(!formObj.find("input[name='name']").val()){
			alert("사원이름을 입력하세요.");
			return false;
		}
		e.preventDefault();
		formObj.submit();
	});
	
	$("button[data-oper='list']").on("click",function(e){
		formObj.attr("action","/employee/list").attr("method", "get");
		formObj.submit;
	});*/
	
});//document.ready 끝

//뒤로가기 되는거 최종확인함 
$(function(){
	$("#listBtn").click(function() {                
		location.href="/employee/list";          
	});
});
  
$("#subBtn").click(function() {//sql의 id, pass 최대길이 넘으면 오류나는 것을 막기위해 추가해봄                
	$(function employeeCheck(){
		var id = '<c:out value="${employee.id}"/>';
		var pass = '<c:out value="${employee.pass}"/>';
		var name = '<c:out value="${employee.name}"/>';
		if(document.register.id.value.length==0){
			alert("아이디를 입력하십시오.");
			register.id.focus();
			return false;
		}
		if(document.register.id.value.length>10){
			alert("아이디는 10자 이하로 입력하십시오.");
			register.id.focus();
			return false;
		}
		if(document.register.pass.value.length==0){
			alert("비밀번호를 입력하시오.");
			register.pass.focus();
			return false;
		}
		if(document.register.pass.value.length>10){
			alert("비밀번호는 10자 이하로 입력하십시오.");
			register.pass.focus();
			return false;
		}		
		if(document.register.name.value.length==0){
			alert("사원이름을 입력하십시오.");
			register.pass.focus();
			return false;
		}
		register.submit();
		return true;
	});     
});





</script>
	
<%@include file="../includes/footer.jsp" %>

	