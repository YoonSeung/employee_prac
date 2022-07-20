<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>

       
	<div id="wrap" align="center">
		<h1>사원상세보기</h1>

			<table style="width: 600px">
				<tr>
					<th>아이디</th>
					<td>${employee.id }</td>					
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>${employee.pass }</td>
				</tr>	
				<tr>
					<th>이름</th>
					<td>${employee.name }</td>
				</tr>
				<tr>
					<th>권한</th>
					<td>
						<c:choose>
							<c:when test='${employee.lev=="A" }'>운영자</c:when>
							<c:otherwise>일반사원</c:otherwise>
						</c:choose>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<c:choose>
							<c:when test='${employee.gender=="1" }'>남자</c:when>
							<c:otherwise>여자</c:otherwise>
						</c:choose>
				</tr>	
				<tr>
					<th>전화번호</th>
					<td>${employee.phone }</td>
				</tr>
				<tr>
					<th>입사일</th>
					<td><fmt:formatDate pattern="yyyy/MM/dd" value="${employee.enter }"/></td>
				</tr>																		
			</table>
			<br>
			<button data-oper='modify' class="btn btn-primary">수정</button>
			<button data-oper='remove' class="btn btn-danger">삭제</button>
			<button data-oper='list' class="btn btn-info">사원리스트</button>
			<button id="regBtn" type="button" class="btn btn-default">사원등록</button>
			
  			<form id='operForm' action="/employee/modify" method="get">
				<input type='hidden' id='id' name='id' value='<c:out value="${employee.id }"/>'>
			</form> 
</div>
	
<script>
$(document).ready(function(){
	
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action","/employee/modify").submit();
	});
	
	$("button[data-oper='remove']").on("click", function(e){
		operForm.attr("action","/employee/remove").attr("method", "post");
		operForm.submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		operForm.find("#id").remove();
		operForm.attr("action","/employee/list")
		operForm.submit();
	});
	
	
	$("#regBtn").on("click", function(){
		self.location="/employee/register";
	});

});

</script>
	
<%@include file="../includes/footer.jsp" %>